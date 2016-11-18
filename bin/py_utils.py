'''
A helpful file with utility functions and initial settings for python
'''
clever_things = {
    1 : "from os.path import splitext",
    2 : "from math import isnan",
    }

def takeoff():
    '''
    Set some initial settings
    '''
    # misc imports
    import save_ipython_variables

    #pandas
    import pandas as pd
    pd.set_option("display.width", False)
    terminal_n_col = pd.util.terminal.get_terminal_size()[0]

    # numpy
    import numpy as np
    np.set_printoptions(linewidth = terminal_n_col)




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

