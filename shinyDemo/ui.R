# Use a fluid Bootstrap layout
fluidPage(    
    
    # Give the page a title
    titlePanel("Diversity of a group"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
        
        # Define the sidebar with one input
        sidebarPanel(
            fileInput('file1', 'Upload CSV File',
                      accept=c('text/csv', 
                             'text/comma-separated-values,text/plain', 
                             '.csv')),
            checkboxInput('header', 'Header', TRUE),
            radioButtons('sep', 'Separator',
                         c(Comma=',', Tab='\t'), ','),
            selectInput("group", "Or, select a demo group:", 
                        choices = c( "groupA", "groupB", "User-Upload"),
                        selected = "User-Upload") ,
            actionButton("update", "Load selected/uploaded file"),
            hr(),
         #  helpText("(gender, ethinicity, ...)")
        #    submitButton("Update View")
            selectInput("kind", "Kind:", 
                    choices = "na"),
            actionButton("plot", "select kind"),
            hr()
        ),
        
        # Create a spot for the barplot

        mainPanel(
          h2("Diversity in this group"),
          div(tableOutput("values"), style = "font-size:150%"),
         # tableOutput("values"),
          p("Richness: the number of kinds"),
          p("IER: the probability that one encounter a member of a different kind"),
          hr(),
          plotOutput("barPlot")
        )
    ) # sidebarLayout
    
   
) # fluidPage