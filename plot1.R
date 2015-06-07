##################################################
#  Plot1.R code
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
 data1<-filter(xdata, strptime(as.character(xdata$Date),"%d/%m/%y") ==strptime("01/02/2007","%d/%m/%y"))
 data2<-filter(xdata, strptime(as.character(xdata$Date),"%d/%m/%y")==strptime("02/02/2007","%d/%m/%y"))
 data<-rbind(data1,data2)

###############################################
#  This section plots the data
#  also allows for checking the output
x<-as.numeric(data$Global_active_power)
xlab="Global Active Power (kilowatts)"
col<-"red"
hist(x,xlab=xlab, col=col,main="Global Active Power")

########################################
#   Now copy the plot to the output file
#
dev.copy(png,file="plot1.png")
dev.off()

