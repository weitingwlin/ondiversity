# Use a fluid Bootstrap layout
fluidPage(    
    
    # Give the page a title
    titlePanel("Diversity of a group"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
        
        # Define the sidebar with one input
        sidebarPanel(
            selectInput("group", "Group:", 
                        choices = c( "groupA")) ,
            actionButton("update", "Select group")
           # actionButton("clear", "Clear"),
           
           # hr(),
         #  helpText("(gender, ethinicity, ...)")
        #    submitButton("Update View")
        ),
        
        # Create a spot for the barplot

        mainPanel(
          plotOutput("phonePlot"),  
          tableOutput("values")
        )
    ) # sidebarLayout
    
   
) # fluidPage