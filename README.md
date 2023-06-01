# thingo

A wee shell script for getting started on wee Python scripts:

- creates a new project directory directly under the current working directory
- sets up a minimal virtual environment with `pip` upgraded to latest
- downloads a standard Python `.gitignore` from GitHub
- Adds a README.md file with the name of the project
- Adds a barebones `thingo.py` with a single function
- Does an initial `git` commit

For any sort of more serious project template, you'll want to look at [cookiecutter](https://cookiecutter.readthedocs.io/en/stable/). But whipping up a 'quick and dirty' little utility script now and then, this might be just the lightweight thingo you've been looking for. And in any case, it works for me and I like to share things I find useful like this.

## Installation

Clone this repo, then:

```sh
# Symbolic link thingo.zsh to somewhere in your $PATH, e.g.:
$ ln -s ${PWD}/thingo.zsh /usr/local/bin/thingo
# You're going to want to source it rather than exec it later,
#   but making it executable lets it turn up in which(1).
$ chmod +x /usr/local/bin/thingo
```

Obviously, there are some assumptions made, like that if you didn't have Git and Python 3 installed I don't know why you'd be here. The one requirement that's a bit non-standard is [httpie](https://httpie.io/cli) which is highly recommended anyway.

## Usage
As the last step of the script drops you into the resulting project directory and activates the virtual environment, you'll want to `source` it, so that the virtualenv is loaded into your active shell. `thingo` takes your project name as a command-line argument; this is optional. If you do not provide a project name, it will grab a randomly-generated one from <https://us-central1-whereami-map.cloudfunctions.net/namer>.

As mentioned in a shell comment above, but important enough to reiterate here in the main text: you want to `source` this script, not execute it, so that environment variables that get set when activating the virtualenv are applied to your active shell. Since you've placed the script in your `$PATH` above, you can do this from anywhere:

```sh
$ . thingo [$PROJECTNAME]
```

and the new project will be set up under the current working directory.
