arget_date1 <- as.Date("2007/02/01")
target_date2 <- as.Date("2007/02/02")
power<-read.csv("household_power_consumption.txt", header=TRUE, sep=";")
# keey entries only for target dates
power_target<-power[as.Date(power$Date, "%d/%m/%Y")==target_date1 | as.Date(power$Date, "%d/%m/%Y")==target_date2,]

# numerify global active power
power_target$Global_active_power<-as.numeric(levels(power_target$Global_active_power))[power_target$Global_active_power]
png("plot1.png")
hist(power_dt$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()
