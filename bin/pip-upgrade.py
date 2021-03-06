#!/usr/bin/env python3


import argparse
import pip
from subprocess import call
import pickle
import pkg_resources

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="\
                        Alternatively use:\
                        pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U\
                        ")
    parser.add_argument("-v", "--pip_version",
                        default="3",
                        required=False)
    parser.add_argument("-U", "--user",
                        default=True,
                        required=False)
    args = vars(parser.parse_args())

    version = args['pip_version']
    user = args['user']

    pipargs = ""
    if user:
        pipargs += "--user"

    """
    dists = pip.get_installed_distributions()
    pickle.dump(dists, open('pip'+version+'_packages_before_update.pkl', 'wb'))

    #dists = pip.get_installed_distributions()
    dists = [d for d in pkg_resources.working_set]

    for dist in dists:
        call("pip" + version + " install --user --upgrade " + dist.project_name, shell=True)
    """

    command = "pip" +version+ " freeze --local "+pipargs+" | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install " +pipargs+ " \ "
    print('Use this:')
    print(command)
    #call(command, shell=True)
