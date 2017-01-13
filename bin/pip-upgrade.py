import argparse
import pip
from subprocess import call

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="\
                        Run with python2 or 3, e.g. 'python2 pip-upgrade -v 2'\
                        or use\
                        pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U\
                        ")
    parser.add_argument("-v", "--pip_version",
                        default="3",
                        required=False)
    args = vars(parser.parse_args())

    version = args['pip_version']


for dist in pip.get_installed_distributions():
    call("pip" + version + " install --user --upgrade " + dist.project_name, shell=True)
