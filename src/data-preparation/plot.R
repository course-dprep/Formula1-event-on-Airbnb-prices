final_airbnb_dataset <- read.csv("final_airbnb_dataset.csv")
pdf("boxplot.pdf")
boxplot(final_airbnb_dataset$price)
dev.off()