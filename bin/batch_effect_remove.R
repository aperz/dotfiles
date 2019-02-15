#!/usr/bin/env Rscript

library(argparse, quietly=TRUE)

parser = ArgumentParser()
parser$add_argument("-i", "--input_file", type="character", required=TRUE,
    help="File path to the matrix of data affected by batch effect.")
parser$add_argument("-o", "--output_file", type="character", required=TRUE,
    help="Output file path.")
args = parser$parse_args()

ifile_path = args$input_file
ofile_path = args$output_file
#ifile_path = "data/abundance_matrix_gut_test_to_samples_prepr.tsv"

###

suppressMessages(library(sva))

remove_lowvar <- function(X, perc) {
    rv = rowVars(X)
    cv = rowVars(t(X))
    X = X[rv > quantile(rv, perc), cv > quantile(cv, perc)]
    X = X[rowSums(X) !=0, colSums(X) !=0]

    X
}

min_in_batch = 4
min_var = 0.1
batch_start = 4
batch_stop = 6

A = read.table(ifile_path, sep="\t", check.names=F, row.names=1)
#A = A[1:3000, 1:3000]
nrow_before = nrow(A)

# remove low variance observations - #TODO move to preprocessing
A = remove_lowvar(A, perc=min_var)
cat((nrow_before-nrow(A)),
    "observations (rows) have been removed because of low variation.", "\n")
nrow_before = nrow(A)

print(dim(A))
# batches with less than two observations - delete?
cat_A <- as.numeric(unlist(lapply(rownames(A), function(x) {substr(x,batch_start,batch_stop)}))) #TRY
delete = names(table(cat_A)[table(cat_A)<min_in_batch]) #TRY

for (d in delete) {
    A = A[!grepl(d, rownames(A)), ]
}
# remove taxa that are *now* zero...?
A = A[(rowSums(A) !=0) , (colSums(A) != 0)]
print(dim(A))

cat_A <- as.numeric(unlist(lapply(rownames(A), function(x) {substr(x,batch_start,batch_stop)}))) #TRY
delete = names(table(cat_A)[table(cat_A)<min_in_batch]) #TRY

for (d in delete) {
    A = A[!grepl(d, rownames(A)), ]
}
# remove taxa that are *now* zero...?
A = A[(rowSums(A) !=0) , (colSums(A) != 0)]
print(dim(A))


cat((nrow_before-nrow(A)),
    "observations (rows) have been removed since they belonged to a batch with only 1 observation", "\n")
cat("There are", nrow(A), "observations now", "\n")

print(dim(A))
print(summary(rowVars(A)))
print(summary(rowVars(t(A))))
print(sum(rowSums(A) == 0))
print(sum(colSums(A) == 0))
print(table(cat_A))


cat_A <- as.numeric(unlist(lapply(rownames(A), function(x) {substr(x,batch_start,batch_stop)}))) #TRY
A_combat <- t(ComBat(t(A), cat_A))

write.table(A_combat, ofile_path, sep="\t")
