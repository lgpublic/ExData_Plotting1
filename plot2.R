arget_date1 <- as.Date("2007/02/01")
target_date2 <- as.Date("2007/02/02")
power<-read.csv("household_power_consumption.txt", header=TRUE, sep=";")
# keey entries only for target dates
power_target<-power[as.Date(power$Date, "%d/%m/%Y")==target_date1 | as.Date(power$Date, "%d/%m/%Y")==target_date2,]

# get datetime column
datetime<-strptime(paste(power_target$Date, power_target$Time), "%d/%m/%Y %H:%M:%S")
power_dt<-cbind(power_target, datetime)

# numerify global active power
power_dt$Global_active_power<-as.numeric(levels(power_dt$Global_active_power))[power_dt$Global_active_power]
png("plot2.png")
plot(power_dt$datetime, power_dt$Global_active_power, type='l', ylab="Global Active Power (kilowatts)", xlab="")
dev.off()