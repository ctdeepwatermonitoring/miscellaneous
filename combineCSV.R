setwd<-''#set a working directory
csv_dir <- ''#specify directory where csvs 
files <- list.files(csv_dir,'*.csv'); #only csv files extensions
m <- length(files);

temp<-  data.frame(ProbeID=character(), SID=integer(), Date_Time=character(),
                   Temp=double(),UOM=character(),Collector=character(),ProbeType=character())

for (i in 1:m){#for each csv files in the directory}
  data <- read.table(paste(csv_dir,files[j],sep=''),sep=',',header=T, stringsAsFactors=F,
                     na.strings=c("","NA"));
  #reorder by column name for insert to match the SQLite DB
  data <- data[c("ProbeID", "SID", "Date_Time","Temp","UOM","Collector","ProbeType")]
  temp<-rbind(temp,data)
}


write.csv(temp,"temp.csv",row.names=FALSE)