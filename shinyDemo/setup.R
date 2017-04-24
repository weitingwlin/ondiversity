
## setwd
computer <- Sys.info()["nodename"]

if(grepl(computer, "WLIN_PC")){
  wd <- "C:/Users/Wei-Ting/Dropbox/DataCoding/onDiversity/shinyDemo"
  setwd(wd)
}

## install.packages('rsconnect')
library(shiny)
library('rsconnect')

rsconnect::setAccountInfo(name='weitingwlin',
                          token='BE4026989167FF4A30B94FD5B190B750', 
                          secret='C2z9Ds/+pg6dbTb5/5/IraTaijWOBqni4MXBjAu9')

library(rsconnect)
rsconnect::deployApp(wd)