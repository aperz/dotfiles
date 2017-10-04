#!/usr/bin/env Rscript

library(argparse, quietly=TRUE)

parser = ArgumentParser(description = "This script allows to save a list of currently installed packages in R (from CRAN, Bioconductor, and github) and to restore it from the saved object. Probably needs to be called with a sudo?")
parser$add_argument("-u", "--upgrade", action = 'store_true', default = FALSE,
    help="Just upgrade all packages.")
parser$add_argument("-s", "--save", action = 'store_true', default = FALSE,
    help="Set to save the list of currently installed packages.")
parser$add_argument("-r", "--restore", action = 'store_true', default = FALSE,
    help="Set to restore from a previoulsy saved file.")
parser$add_argument("-d", "--odir", required = FALSE,
    help="The directory (folder!) in which to save the list file.")

#parser$set_defaults(save_f = FALSE, restore_f = FALSE)
args = parser$parse_args()

upgrade = args$upgrade
restore_f = args$restore
save_f = args$save
odir = args$odir

ofile = paste0(odir, "R_packages_installed_old.rda")

#biocValid() checks if everythiong is fine (TRUE if fine)
# TODO list and save all packages installed from biocLite()

if (upgrade) {
    ##install.packages( 
    #    lib  = lib <- .libPaths()[1],
    #    pkgs = as.data.frame(installed.packages(lib), stringsAsFactors=FALSE)$Package,
    #    type = 'source'
    #    )

    source("https://bioconductor.org/biocLite.R")
    biocLite()
    #stop("Upgraded, perhaps there were errors but I don't know")
}

if (save_f) {
    message(paste("Saving to", ofile))
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
    print(installedpkgs_new)
    installedpkgs_github_new <- installedpkgs_new[installedpkgs_new %in% c("github", "Package")]
    missing <- setdiff(installedpkgs_old, installedpkgs_new)
    missing_github <- setdiff(installedpkgs_github_old, installedpkgs_github_new)

    # install from CRAN (three runs)
    # WARNING: don't use the built-in manager, use biocLite() instead!
    #install.packages(missing, repos='http://cran.us.r-project.org')
    #update.packages()

    # refresh and restore missing pkgs from Bioconductor
    #tmp <- installed.packages()
    #installedpkgs_new <- as.vector(tmp[is.na(tmp[,"Priority"]), 1])
    #missing <- setdiff(installedpkgs_old, installedpkgs_new)

    #biocLite() 
    source("https://bioconductor.org/biocLite.R")
    biocLite("BiocUpgrade")
    biocLite("BiocInstaller")
    for (i in 1:length(missing)) {
        biocLite(missing[i])
    }
    biocLite()
    #update.packages()

    # restore from github
    # devtools::install_githuB
    message(paste("Restoring", length(missing_github), "packages from github"))
    message("the list should have entries like: IRkernel/IRkernel, TODO")
    for (i in length(missing_github)) {
        devtools::install_github(missing_github[i])
    }
    IRkernel::install_spec() # register kernel for Jupyter notebooks
    message("reinstall from github: ")
    print(missing_github)

    # say if any couldn't be restored
    tmp <- installed.packages()
    installedpkgs_new <- as.vector(tmp[is.na(tmp[,"Priority"]), 1])
    missing <- setdiff(installedpkgs_old, installedpkgs_new)
    message(paste("These were not restored:",
        paste(missing, collapse=" "))
    )
}

