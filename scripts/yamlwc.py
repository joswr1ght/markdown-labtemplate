#!/usr/bin/env python
# -*- coding: utf8 -*-
from collections import Mapping, Set, Sequence
import yaml
import sys
import re

# dual python 2/3 compatability, inspired by the "six" library
string_types = (str, unicode) if str is bytes else (str, bytes)
iteritems = lambda mapping: getattr(mapping, 'iteritems', mapping.items)()

def objwalk(obj, path=(), memo=None):
    if memo is None:
        memo = set()
    iterator = None
    if isinstance(obj, Mapping):
        iterator = iteritems
    elif isinstance(obj, (Sequence, Set)) and not isinstance(obj, string_types):
        iterator = enumerate
    if iterator:
        if id(obj) not in memo:
            memo.add(id(obj))
            for path_component, value in iterator(obj):
                for result in objwalk(value, path + (path_component,), memo):
                    yield result
            memo.remove(id(obj))
    else:
        yield path, obj


if __name__ == "__main__":
    if (len(sys.argv) != 2):
        sys.stdout.write("yamlwc: Count total words in a YAML file.\n\n")
        sys.stdout.write("Usage: yamlwc <yaml file>\n")
        sys.exit(0)

    file_contents = open(sys.argv[1]).read()
    yaml_data = yaml.safe_load(file_contents)

    word_match = re.compile('^[\[*_(]{0,2}[–\w-]+([\'’]\w*)?[*_.,?!:;)]{0,2}(]\(.+\))?(<\w+)?$')
    total = 0
    for (path, value) in objwalk(yaml_data):
        all_words = value.split()
        words = [word for word in all_words if word_match.match(word)]
        total += len(words)
        # Uncomment to display the words _not_ counted in the total word count.
#        if (len(all_words) != len(words)):
#            print('.'.join(path) + ': ' + str(len(words)))
#            print(set(all_words) - set(words))

    print("Total word count: " + str(total))
