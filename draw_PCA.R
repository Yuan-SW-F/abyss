#!/usr/bin/env Rscript
# File Name: draw_PCA.R
# Author: root, Yuan-SW-F, yuanswf@163.com
# Created Time: 2021-03-04 11:12:51
args <- commandArgs(T)
file <- read.table(args[1],header=F)
nm = args[1]
names(file) = c("Fid","ID","PC1","PC2","PC3")

pdf (paste(nm, "pca.pdf", sep = "."))
split.screen(c(2,2))
par(mar=c(2,2,1,1))

clor_a = c("red", "purple", "cyan", "green", "blue")
group_a = c("Group A", "Group B", "Group C", "Group D", "Group E")

k = 0
for (i in 3:4){
        for (j in 4:5){
                if (i < j){
                        k = k + 1
                        screen(k)
                        a <- t(file[i])
                        b <- t(file[j])
                        c <- (paste("PCA ", i-2, "-", j-2, sep = ""))
                        par(mar=c(2,2,1,1))
                        plot(a, b, pch=1, col=c("red", "purple", "cyan", "green", "blue")[file$Fid], main=c, cex.lab=0.5, cex.axis = 0.5, cex.main = 1, tcl = 0.2, xaxt = "n", yaxt ="n", cex = 0.8)
                        axis(1, mgp = c(0, 0, 0), cex.axis = 0.5, tcl = 0.2)
                        axis(2, mgp = c(0, 0, 0), cex.axis = 0.5, tcl = 0.2)
                        title(xlab = (paste ("pc", i-2)), ylab = (paste ("pc", j-2)), line = 0.6, cex.lab=0.6)
                }
        }
}

screen(4)
par(mar=c(1,1,1,1))
plot (10, 10, type = "l", xaxt = "n", yaxt = "n", bty = "n")
legend("center", group_a, pch=1, col=c("red", "purple", "cyan", "green", "blue"), bty = "n", text.col = clor_a)

dev.off()
