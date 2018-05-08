#!/usr/bin/env python2


import argparse
import pip
from subprocess import call

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="\
                        Alternatively use:\
                        pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U\
                        ")
    #parser.add_argument("-v", "--pip_version",
    #                    default="3",
    #                    required=False)
    args = vars(parser.parse_args())

    #version = args['pip_version']
    version = "2"


for dist in pip.get_installed_distributions():
    call("pip" + version + " install --user --upgrade " + dist.project_name, shell=True)
