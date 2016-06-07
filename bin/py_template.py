#!/usr/bin/env python3
'''
'''

import pandas as pd
import os
import argparse

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="")
    parser.add_argument("-i", "--input_path",
                        help="",
                        required=True)
    parser.add_argument("-o", "--output_path",
                        help="",
                        required=True)
    args = vars(parser.parse_args())

    # arg1 = args['odir']

