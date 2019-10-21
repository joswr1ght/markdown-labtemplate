#!/usr/bin/env python3
import yaml
import sys

if __name__ == "__main__":

    if (len(sys.argv) != 4):
        sys.stdout.write("i18nmd: Use a YAML file and Markdown template to generate a locale-specific "
                "Markdown file\n\n")
        sys.stdout.write("Usage: i18nmd.py <MD expansion input file> <YAML file> <Output MD file>\n")
        sys.exit(0)

    with open(sys.argv[2]) as yaml_file:
      i = yaml.safe_load(yaml_file)

    with open(sys.argv[1]) as md_file:
       md=md_file.read()

    patched_md = md.format(**i)
    if (sys.argv[3] == "-"):
        sys.stdout.write(patched_md)
    else:
        with open(sys.argv[3], "w") as mdout_file:
            mdout_file.write(patched_md)
