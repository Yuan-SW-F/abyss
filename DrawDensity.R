#!/usr/bin/env Rscript
# File Name: DrawDensity.R
# Author: Yuan-SW-F, yuanswf@163.com
# Created Time: 2021-04-01 10:41:07

args <- commandArgs(T)
file <- read.table(args[1], sep="\t")
a <- t(file[8])

nm = args[1]
pdf (paste(nm, "all.pdf", sep = "."))
wind = 1000
plot(density(a, bw=wind), col="red", lwd=3, ylim = c(0, 0.0005), xlim = c(-50000, 50000))

j = 1
col_a = c("red", "purple", "cyan", "green", "blue", "black")
for (i in 2:length(args)){
        file <- read.table(args[i], sep="\t")
        a <- t(file[8])
        j = j + 1
        print (j)
        lines(density(a, bw=wind), col=col_a[j], lwd=3, xaxt = "n", yaxt = "n", xlim = c(-50000, 50000), ylim = c(0, 0.0005))
}

#legend("center", group_a, pch=1, col=c("red", "purple", "cyan", "green", "blue"), bty = "n", text.col = clor_a)
