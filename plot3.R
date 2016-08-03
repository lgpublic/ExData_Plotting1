target_date1 <- as.Date("2007/02/01")
target_date2 <- as.Date("2007/02/02")
power<-read.csv("household_power_consumption.txt", header=TRUE, sep=";")
# keey entries only for target dates
power_target<-power[as.Date(power$Date, "%d/%m/%Y")==target_date1 | as.Date(power$Date, "%d/%m/%Y")==target_date2,]

# get datetime column
datetime<-strptime(paste(power_target$Date, power_target$Time), "%d/%m/%Y %H:%M:%S")
power_dt<-cbind(power_target, datetime)

# numerify 2 columns that is factor to be plot
power_dt$Sub_metering_1<-as.numeric(levels(power_dt$Sub_metering_1))[power_dt$Sub_metering_1]
power_dt$Sub_metering_2<-as.numeric(levels(power_dt$Sub_metering_2))[power_dt$Sub_metering_2]
# metering_3 is already numeric
#power_dt$Sub_metering_3<-as.numeric(levels(power_dt$Sub_metering_3))[power_dt$Sub_metering_3]

png("plot3.png")
plot(power_dt$datetime, power_dt$Sub_metering_1, type='l', ylab="Energy sub melting", xlab="", col="black", ylim=c(0.0,40.0))
# disable overwritting plot
par(new=T)
plot(power_dt$datetime, power_dt$Sub_metering_2, type='l', col="red", xlab='', ylab='', axes=F, ylim=c(0.0,40.0))
par(new=T)
plot(power_dt$datetime, power_dt$Sub_metering_3, type='l', col="blue", xlab='', ylab='', axes=F, ylim=c(0.0,40.0))
# turn on plot overwriting again
par(new=F)
# add legend'
legend("topright", pch=c("-","-","-"), col=c("black","red","blue"), legend=c("Sub_melting_1", "Sub_melting_2", "Sub_melting_3"))
dev.off()
