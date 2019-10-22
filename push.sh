#!/bin/bash

rsync -avze ssh --delete wiki/ jwright@hasborg:public_html/sec504.org/instructor/
