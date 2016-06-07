# A helpful reference file for exploratry analyses

tropical <- c("darkorange", "dodgerblue", "hotpink", "limegreen", "yellow")
palette(tropical)
par(mfrow = c(3,5), pch=19)
png(width = 2000, height = 1200)

file_path = ""
M = read.table(file_path, sep="\t", header=T, check.names=F)

lapply(sample(M, 15), FUN=function(x) {
        plot(sort(x/mean(x)))
    }
)

plot(sort(colSums(M)))
plot(sort(rowSums(M)))

### S-A-C

by(meta_gs, meta_gs[, "Study_id"], summary)
