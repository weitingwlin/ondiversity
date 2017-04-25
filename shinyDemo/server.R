library(ggplot2)


shinyServer(
  function(input, output, session) {
  

    url <- 'https://raw.githubusercontent.com/weitingwlin/ondiversity/master/Data/'
    # 
    # data <-  read.csv(paste(url, "groupA.csv", sep = ""), header  = TRUE) 
    # A <- data[,"ethnicity"]
   
    
    terms <- reactive({
        # Change when the "update" button is pressed...
        input$update
        # ...but not for anything else
        isolate({
          data <- read.csv(paste(url, input$group,".csv", sep = ""), header  = TRUE)
          mytable <-table(data[,input$kind])
            # names(data) <- c("gender", "age", "amount")
            })
    })
    
    datasetInput <- reactive({
      read.csv(paste(url, input$group,".csv", sep = ""), header  = TRUE)
    })

    observeEvent(input$update, {
     
     # insertUI(
     #   selector = "#update",
     #   where = "afterEnd",
     #   ui = actionButton("clear", "Clear")
     # )
       data <- datasetInput()
       updateSelectInput(session, "kind", label = NULL, choices = names(data),
                        selected = NULL)
    })
    
    observeEvent(input$plot, {
      
      mytable <- reactive({
        data <- datasetInput()
        table(data[, input$kind])
      })
      # make data.frame
      mydf <- reactive({
        data <- datasetInput()
        as.data.frame(table(data[, input$kind])) 
      })
      
      divtable <- reactive({
        data <- datasetInput()
        A <- data[, input$kind]
        data.frame(richness = richness(A), IER = simpsonIER(A))

      })
      
     

    # Fill in the spot we created for a plot
        output$phonePlot <- renderPlot({
          mydf <- mydf()
          names(mydf)[1] <- input$kind
          p <- ggplot(data=mydf, aes_string(x = input$kind, y = "Freq", fill = input$kind))
          p <- p + geom_bar(stat="identity")
          p <- p + theme_minimal()
                 p   + theme(axis.text.x = element_text(angle = 45, hjust = 1),
                             axis.text=element_text(size=16),
                             axis.title=element_text(size=16,face="bold"),
                             legend.text = element_text(size=16),
                             legend.title = element_text(size=16))
        
        #  barplot( mytable()/sum( mytable()))
       
        })
      
        output$values <- renderTable({
          divtable()
        })
      
    })
    

}
)