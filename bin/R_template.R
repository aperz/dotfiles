#!/usr/bin/env Rscript

library(argparse, quietly=TRUE)

parser = ArgumentParser(description="")
parser$add_argument("-i", "--input_file", type="character", required=TRUE,
    help="File path to the matrix of data affected by batch effect.")
parser$add_argument("-o", "--output_file", type="character", required=TRUE,
    help="Output file path.")
args = parser$parse_args()

ifile_path = args$input_file
ofile_path = args$output_file

###

#suppressMessages(library())

