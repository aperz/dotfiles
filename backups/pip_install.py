import pip
from subprocess import call

if __name__ == "__main__":
    pkg_list_fp= input("Requirements file path: ")

    # upgrade installed
    for dist in pip.get_installed_distributions():
        call("sudo -H pip3 install --upgrade " + dist.project_name, shell=True)

    # read requirements.txt file, create list of package names (not from freeze, but from pip list)
    with open(pkg_list_fp, "r") as pkg_list:
        for package in pkg_list:
            print(package.split()[0])
            #call("sudo -H pip3 install " + package.split()[0], shell=True)

    # upgrade
    for dist in pip.get_installed_distributions():
        call("sudo -H pip3 install --upgrade " + dist.project_name, shell=True)
