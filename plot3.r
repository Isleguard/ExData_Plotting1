##################################################
#  Plot3.R code
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
#  This section plots the data
#  also allows for checking the output
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
 
########################################
#   Now copy the plot to the output file
#
dev.copy(png,file="plot3.png")
dev.off()