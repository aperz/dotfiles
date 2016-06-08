#!/usr/bin/env Rscript

library(argparse, quietly=TRUE)

parser = ArgumentParser(description = "This script allows to save a list of currently installed packages in R (from CRAN, Bioconductor, and github) and to restore it from the saved object.")
parser$add_argument("-s", "--save", action = 'store_true', default = FALSE,
    help="Set to save the list of currently installed packages.")
parser$add_argument("-r", "--restore", action = 'store_true', default = FALSE,
    help="Set to restore from a previoulsy saved file.")
parser$add_argument("-d", "--odir", required = TRUE,
    help="The directory (folder!) in which to save the list file.")

#parser$set_defaults(save_f = FALSE, restore_f = FALSE)
args = parser$parse_args()

restore_f = args$restore
save_f = args$save
odir = args$odir

ofile = paste0(odir, "R_packages_installed_old.rda")
message(paste("Saving to", ofile))

if (save_f) {
    tmp <- installed.packages(fields = "RemoteType")
    installedpkgs_old <- as.vector(tmp[is.na(tmp[,"Priority"]), 1])
    installedpkgs_github_old <- tmp[tmp[, "RemoteType"] %in% "github", "Package"]
    save(installedpkgs_old, installedpkgs_github_old, file=ofile)
    #message(paste(installedpkgs_old, collapse=" "))
}


if (restore_f) {
    library(devtools)

    load(ofile)
    tmp <- installed.packages(fields = "RemoteType")
    installedpkgs_new <- as.vector(tmp[is.na(tmp[,"Priority"]), 1])
    installedpkgs_github_new <- installedpkgs_new[installedpkgs_new[, "RemoteType"] %in% "github", "Package"]
    missing <- setdiff(installedpkgs_old, installedpkgs_new)
    missing_guthub <- setdiff(installedpkgs_github_old, installedpkgs_github_new)

    # install from CRAN
    install.packages(missing)
    update.packages()

    # refresh and restore missing pkgs from Bioconductor
    tmp <- installed.packages()
    installedpkgs_new <- as.vector(tmp[is.na(tmp[,"Priority"]), 1])
    missing <- setdiff(installedpkgs_old, installedpkgs_new)

    #?biocLite() 
    source("https://bioconductor.org/biocLite.R")
    for (i in 1:length(missing)) {
        biocLite(missing[i])
    }
    update.packages()

    # restore from github
    message(paste("Restoring", length(missing_guthub), "packages from github"))
    for (i in length(missing_guthub)) {
        install_github(missing_guthub[i])
    }

    # say if any couldn't be restored
    tmp <- installed.packages()
    installedpkgs_new <- as.vector(tmp[is.na(tmp[,"Priority"]), 1])
    missing <- setdiff(installedpkgs_old, installedpkgs_new)
    message(paste("These were not restored:",
        paste(missing, collapse=" "))
    )
}

