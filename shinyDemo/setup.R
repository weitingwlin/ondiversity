
## setwd machin specific working directory
computer <- Sys.info()["nodename"]

if(grepl(computer, "WLIN_PC")){
  wd <- "C:/Users/Wei-Ting/Dropbox/DataCoding/onDiversity/shinyDemo"
  setwd(wd)
}

## install.packages('rsconnect')
## install.packages('shiny')
library(shiny)
library(rsconnect)

# connect app to shinyapp.io
rsconnect::setAccountInfo(name='weitingwlin',
                          token='BE4026989167FF4A30B94FD5B190B750', 
                          secret='C2z9Ds/+pg6dbTb5/5/IraTaijWOBqni4MXBjAu9')



# deploy app on shinyapp.io
rsconnect::deployApp(wd)