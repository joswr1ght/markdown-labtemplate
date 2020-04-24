#!/usr/bin/env python3
import sys
import yaml
import re
import pdb
import mistune

class CustomRenderer(mistune.Renderer):
    templatecnt = 0 # Used for each template value for ordering in the YAML file
    yamldata = {}

    def addelement(self, text):
        name = f"element{self.templatecnt:03}"
        self.yamldata.update( {name:f"{text}"} )
        self.templatecnt+=1
        return name

    # This is the most common element
    def paragraph(self, text):
        return f"{{{self.addelement(text)}}}\n\n"
    def header(self, text, level, raw=None):
        return f"{'#'*level} {{{self.addelement(text)}}}\n\n"
    def codespan(self, text):
        return f"`{text}`"
    def block_quote(self, text):
        # Block quotes are first parsed as paragraphs, then passed to block_quote.
        return f"> {text}"
    def block_html(self, html):
        return f"{html}\n\n"
    def emphasis(self, text):
        return f"_{text}_"
    def list_item(self, text):
        return f"+ {{{self.addelement(text)}}}\n"
    def list(self, body, ordered=True):
        return f"{body}\n"
    def link(self, link, title, content):
        #pdb.set_trace()
        # Some links return like this:
        # <img src="videos/400%20John%20the%20Ripper/400%20John%20the%20Ripper.png" alt="Video Walkthrough Screen Shot">
        # Convert to MD format:
        # [![Video Walkthrough Screen Shot](videos/400%20John%20the%20Ripper/400%20John%20the%20Ripper.png)](videos/400%20John%20the%20Ripper/)
        return f"[{content}]({link})"

if __name__ == "__main__":

    if (len(sys.argv) != 4):
        sys.stdout.write("mdtoyaml: Convert MD file to MD with expansion variables and YAML file.\n\n")
        sys.stdout.write("Usage: mdtoyaml.py <input MD file> <output MD file> <output YAML file>\n")
        sys.exit(0)

    # Override default yaml.safe_dump() formatting to make the YAML more readable
    yaml.SafeDumper.org_represent_str = yaml.SafeDumper.represent_str
    def repr_str(dumper, data):
        if '\n' in data:
            return dumper.represent_scalar(u'tag:yaml.org,2002:str', data, style='|')
        return dumper.org_represent_str(data)
    yaml.add_representer(str, repr_str, Dumper=yaml.SafeDumper)

    renderer = CustomRenderer()
    markdown = mistune.Markdown(renderer=renderer)
    with open (sys.argv[1]) as mdfile:
        md=mdfile.read()
    with open (sys.argv[2], "w") as mdoutfile:
        mdoutfile.write((markdown(md)))
    with open (sys.argv[3], "w") as ymlfile:
        ymlfile.write(yaml.safe_dump(renderer.yamldata, allow_unicode=True))


