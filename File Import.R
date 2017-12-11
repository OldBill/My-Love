?read.fwf
r<-read.fwf("city.txt",widths = c(29,4,9,7,7,6,6),header = T)

filename<-"000014.SZ.csv"
foldername<-"E:/Talent Project/csv2/"
filelist<-dir(foldername)
autoInput<-function(filename,filefolder){
  dt<-read.table(paste0(foldername,filename),sep = ",",header = T,
                 colClasses=c("character","character","character",
                              "numeric","numeric","numeric",
                              "numeric","numeric"))
  names(dt)<-c("code","codename","date","preclose","close","range","turnover")
  dt<-dt[,-8]
  return(dt)
}
autoInput(filename,foldername)
l<-lapply(filelist,autoInput,foldername)
ds<-do.call(rbind,l)