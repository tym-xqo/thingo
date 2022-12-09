#!/bin/zsh
set -euxo pipefail
## ====
# thomas@yager-madden.com 2022-09-23
## ====
# create boilerplate little new python project
# in a randomly-named directory under $PWD
# Installation/usage -- save it somewhere on your $PATH, 
# then `source` it, don't just run it --
#   so you get the virtualenv activated in the parent shell
## ===

# Get random project name from TYM namer service
# Or let user specify as command-line argument
if [ $# -eq 0 ]
  then
    DEFAULTVALUE=$(http -b https://us-central1-whereami-map.cloudfunctions.net/namer)
fi
PROJECT="${1:-$DEFAULTVALUE}"

# Create project directory
mkdir $PROJECT

# Create virtualenv in project directory, upgrade pip and install wheel
python -m venv --clear $PROJECT/.venv
$PROJECT/.venv/bin/python -m pip install --upgrade pip wheel

# Set up empty README and dotenv files
echo "# $PROJECT" > $PROJECT/README.md
touch $PROJECT/.env
chmod 0600 $PROJECT/.env

# Create dummy python file in project with function boilerplate
cat <<EOF >> $PROJECT/thingo.py
#!/usr/bin/env python
# -*- coding: utf-8 -*-


def thingo():
    pass


if __name__ == "__main__":
    thingo()
EOF

# add gitignore and initialize repo
http -q -d https://raw.githubusercontent.com/github/gitignore/main/Python.gitignore \
  -o $PROJECT/.gitignore
git init $PROJECT

# activate the virtualenv
set +eux
source $PROJECT/.venv/bin/activate

# cd into the project directory and do an initial commit into git
cd $PROJECT
git add -A && git commit -m "Initial commit"
