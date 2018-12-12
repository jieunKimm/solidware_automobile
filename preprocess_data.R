#read txt file and give header
txt_auto <- read.table("UCI_automobile_data.txt", header = FALSE, sep = ",")
colnames(txt_auto) <- c("symboling","normalized-losses", "make","fuel-type", "aspiration", "num-of-doors", "body-style",
                    "drive-wheels", "engine-location", "wheel-base", "length", "width", "height", "curb-weight", 
                    "engine-type", "num-of-cylinders", "engine-size", "fuel-system", "bore", "stroke", 
                    "compression-ratio", "horsepower", "peak-rpm", "city-mpg", "highway-mpg", "price")

#delete row which contain missing normalized-losses
txt_auto <- txt_auto[-c(which(txt_auto$`normalized-losses` == "?")),]

#save data to csv form
write.csv(txt_auto, file = "Processed_auto.csv",row.names=FALSE)
