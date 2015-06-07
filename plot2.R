##################################################
#  Plot2.R code
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
data3<-rbind(data1,data2)
##################################
#  Perform the plot
xlab<-"Thur                     Fri                     Sat"
ylab<- "Global Active Power (kilowats)"
x<-as.numeric(as.character(data3$Global_active_power),na.omit=T)
plot(x, type="l",ylab=ylab,xlab=xlab,main="")

##################################
#   Make the PNG file
dev.copy(png,file="plot2.png")
dev.off()
