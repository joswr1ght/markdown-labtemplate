#!/usr/bin/env python3
import sys
from lunr import lunr
import os
import re
import json

if (len(sys.argv) < 3):
    sys.stdout.write("buildidx: Create an index file for use in search from Markdown files.\n\n")
    sys.stdout.write(f"Usage: {sys.argv[0]} <Markdown Directory> <Output File>\n")
    sys.exit(0)


# Don't add these docs to the search index
skipdocs = ["CourseBooks-Index.md", "CourseBooks-Links.md"]

documents = []  # Data to be indexed
store = {}      # Helper object when displaying search results
titlere = re.compile("^# (.*)$")
for filename in os.listdir(sys.argv[1]):
    if filename.endswith(".md") and filename not in skipdocs:
        # Extract title
        for i, line in enumerate(open(sys.argv[1] + "/" + filename)):
            title = re.findall(titlere, line)[0]
            if (title is not None):
                break
        # Get content
        body = open(sys.argv[1] + "/" + filename).read()
        # Strip tags from body
        body = re.sub('<[^<]+?>', '', body)
        # Get href filename, replacing .md with .html
        href = filename[0:-2] + "html"
        documents.append({'href': href, 'title': title, 'body': body})
        store.update({href: title})

idx = lunr(ref='href', fields=('title', 'body'), documents=documents)
# print(idx.search("VGAuthService"))

with open(sys.argv[2], 'w') as f:
    # Write index and store collection to use for displaying search response and results
    f.write(json.dumps({"index": idx.serialize(), "store": store}))
