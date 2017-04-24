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
    
      divtable <- reactive({
        data <- datasetInput()
        A <- data[, input$kind]
        data.frame(richness = richness(A))
      })
      
     

    # Fill in the spot we created for a plot
        output$phonePlot <- renderPlot({
    
        # data <- read.csv(paste(url, group,".csv", sep = ""), header  = TRUE)
          barplot( mytable()/sum( mytable()))
        #  names(data) <- c("gender", "age", "amount")
        })
      
        output$values <- renderTable({
          divtable()
        })
      
    })
    

}
)