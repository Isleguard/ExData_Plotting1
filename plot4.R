##################################################
#  Plot4.R code
#
#  author:  Gary Baggett
#
#  
##################################################
#  Make all the library calls here
source (libcall.r)
libcall()
#Load the data:  This piece will be at the top of all the .R files
xdata<-read.csv2("./household_power_consumption.txt")   # Note that the delimeter is a semi-colon
#   filter the data according to date
data1<-filter(xdata, strptime(as.character(xdata$Date),"%d/%m/%Y") ==strptime("01/02/2007","%d/%m/%Y"))
data2<-filter(xdata, strptime(as.character(xdata$Date),"%d/%m/%Y")==strptime("02/02/2007","%d/%m/%Y"))
data<-rbind(data1,data2)

###############################################
# this plot is an accumulation of 4 plots.
# so lets divide the plot screen into 4 sections
# and then start the 4 separate plots
###############################################
# this command divides the plot area into 4 spaces
# since using "mfrow"  command, the plots will be 
# produced in this order: Upper-left, upper-right,
# lower-left and finally in the lower-right
par(mfrow=(2,2))   # 2 rows by 2 columns

##############################################
# now for plot 1
#   same information as plot 2
##############################################
xlab<-"Thur                     Fri                     Sat"
ylab<- "Global Active Power (kilowats)"
x<-as.numeric(as.character(data3$Global_active_power),na.omit=T)
plot(x, type="l",ylab=ylab,xlab=xlab,main="")


##############################################
# now for plot 2
#   new and different plot of the voltage changes
##############################################
x<-as.numeric(as.character(data3$Voltage),na.omit=TRUE)
xsublab<-"DateTime"
xlab<-"Thur                 Fri                 Sat"
ylabel<-"Voltage"
plot(x,ylab=ylabel,xlab=c(xlab,xsublab),main="", type="l")

##############################################
# now for plot 3
#   same as plot 3
#############################################
sub1<-as.numeric(as.character(data3$Sub_metering_1), na.omit=TRUE)
sub2<-as.numeric(as.character(dat3a$Sub_metering_2), na.omit=TRUE)
sub3<-as.numeric(as.character(data3$Sub_metering_3), na.omit=TRUE)
ylabel="Energy sub metering"
xlab<-"Thur                                 Fri                                 Sat"

#  call the plot routine to initialize the output
#  then come back and add/overlay the data
plot(sub1,y,ylim=ylimit,type="l",col="black",ylab=ylabel,xlab=xlab)
lines(sub2,type="l",col="red")
lines(sub3,type="l",col="blue")
#
#  now defind and add the legend
#
legnd<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright",legend=legnd, col=lgndcol)


#############################################
#  Now for plot 4
#    different plot of reactive power
#############################################
xsublab<-"DateTime"
xlab<-"Thur                 Fri                 Sat"
x<-as.numeric(as.character(data3$Global_reactive_power),na.omit=TRUE)
ylabel<-"Global_reactive_power"
plot(x,ylab=ylabel,xlab=c(xlab,xsublab),main="", type="l")

########################################
#   Now copy the plot to the output file
#
dev.copy(png,file="plot4.png")
dev.off()