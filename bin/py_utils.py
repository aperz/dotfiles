'''
A helpful file with utility functions and initial settings for python
'''
from math import isnan

def takeoff():
    import pandas as pd
    pd.set_option("display.width", False)
    terminal_n_col = pd.util.terminal.get_terminal_size()[0]

    import numpy as np
    np.set_printoptions(linewidth = terminal_n_col)


def eAnd(*args):
    return [all(tuple) for tuple in zip(*args)]


def summ(*args, what="shape"):
    if what == "shape":
        return [i.shape for i in args]
    if what == "columns":
        return [i.columns for i in args]
    if what == "index":
        return [i.index for i in args]
