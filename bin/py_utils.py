def eAnd(*args):
    return [all(tuple) for tuple in zip(*args)]
