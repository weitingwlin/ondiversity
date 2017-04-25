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
          #  radioButtons('quote', 'Quote',
           #              c(None='',
            #               'Double Quote'='"',
            #               'Single Quote'="'"),
            #             '"')
            selectInput("group", "Group:", 
                        choices = c( "groupA", "groupB", "User-Upload"),
                        selected = "User-Upload") ,
            actionButton("update", "Select group"),
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
          plotOutput("phonePlot")
        )
    ) # sidebarLayout
    
   
) # fluidPage