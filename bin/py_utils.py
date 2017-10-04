'''
A helpful file with utility functions and initial settings for python
'''

########################################

import pandas as pd
import numpy as np

from os.path import splitext
import os

########################################

#pandas
pd.set_option("display.width", False)
terminal_n_col = pd.util.terminal.get_terminal_size()[0]

# numpy
np.set_printoptions(linewidth = terminal_n_col)

########################################

clever_things = [
    "from os.path import splitext",
    "from math import isnan",
    "%load_ext autoreload",
    "%autoreload 2",
    ]

#def takeoff():
#    '''
#    et some initial settings
#    '''

def mkdir(dirname):
    if not os.path.isdir(dirname):
        os.mkdir(dirname)

def import_all_from(module_list):
    for m in module_list:
        exec('from ' + m + 'import *')


def eAnd(*args):
    '''
    Returns a bool (all()) for each pair in an iterable
    '''
    return [all(tuple) for tuple in zip(*args)]


def summ(*args, what="shape"):
    '''
    Prints out information for multiple pandas DataFrames:
    shape, columns, or index
    '''

    if what == "shape":
        return [i.shape for i in args]
    if what == "columns":
        return [i.columns for i in args]
    if what == "index":
        return [i.index for i in args]

