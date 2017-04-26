library(ggplot2)


shinyServer(
  function(input, output, session) {

      # load demo or uploaded data file
      datasetInput <- reactive({
          if (input$group == "User-Upload"){
              inFile <- input$file1
              read.csv(inFile$datapath, header=input$header, sep=input$sep)
          } else {
              read.csv(paste(url, input$group,".csv", sep = ""), header  = TRUE)
          }
      })
      # formating the "kind" panel when the "update" bottom hit
      observeEvent(input$update, {
          data <- datasetInput()
          updateSelectInput(session, "kind", label = NULL, choices = names(data),
                            selected = NULL)
      })
    
      # working towards plotting when the "select kind" bottun hit
      observeEvent(input$plot, {
          # make summary table
          mytable <- reactive({
              data <- datasetInput()
              table(data[, input$kind])
          })
          # make data.frame
          mydf <- reactive({
              data <- datasetInput()
              as.data.frame(table(data[, input$kind])) 
          })
          # make a diversity summary table, using functions in `global.R`
          divtable <- reactive({
              data <- datasetInput()
              N <-  dim(data)[1]
              A <- data[, input$kind]
              data.frame(Population =N, Richness = richness(A), IER = simpsonIER(A))
          })
          
          # printing the table 
          output$values <- renderTable({
            divtable()
          })
          
          # printing the plot
          output$barPlot <- renderPlot({
              mydf <- mydf()
              names(mydf)[1] <- input$kind
              p <- ggplot(data=mydf, aes_string(x = input$kind, y = "Freq", fill = input$kind))
              p <- p + geom_bar(stat="identity")
              p <- p + theme_minimal()
              p <- p + theme(axis.text.x = element_text(angle = 30, hjust = 1),
                             axis.text=element_text(size=16),
                             axis.title=element_text(size=16,face="bold"),
                             legend.text = element_text(size=16),
                             legend.title = element_text(size=16))
              p
          })# renderPlot({
     }) #observeEvent(input$plot, {
      
  } # function
) # shinyserver