library(ggplot2)
shinyServer(
  function(input, output, session) {
  

    url <- 'C:/Users/Wei-Ting/Dropbox/DataCoding/onDiversity/Data/'
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
      insertUI(
        selector = "#update",
        where = "afterEnd",
        ui = selectInput("kind", "Kind:", 
                         choices = names( datasetInput()))
      )
      insertUI(
        selector = "#update",
        where = "afterEnd",
        ui = hr()
      )
      insertUI(
        selector = "#update",
        where = "afterEnd",
        ui = helpText("(gender, ethinicity, ...)")
      )
      
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