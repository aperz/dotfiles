# A helpful sourceable file with a few utility functions and initial settings for R

library(TeachingDemos)
loadhistory(".Rhistory_autosave")
rhistory_autosave_con = file(".Rhistory_autosave", open="a")
txtStart('ignoreme',commands=TRUE,results=FALSE, append=TRUE, cmdfile=rhistory_autosave_con) 

tropical <- c("darkorange", "dodgerblue", "hotpink", "limegreen", "yellow")
palette(tropical)
par(mfrow = c(3,5), pch=19)

read_cols_into_df <- function(file_path, ncols=c(), sep="\t") {
    # not necessarily working
    data_frame = data.frame(
        do.call(cbind, 
            lapply(ncols, function(n) {
                system(paste0("cut -f", n, " ", file_path), intern=TRUE)
            })
        )
    )

    names(data_frame) = data_frame[1, ]
    data_frame = data_frame[2:nrow(data_frame), ]

    data_frame
}

plot_sampled <- function(M, n=15, FUN=function (m) { sort(m/mean(m)) }) {
    lapply(sample(M, n), FUN=function(x) {
            plot(FUN(x))
        }
    )
}
