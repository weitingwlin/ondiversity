# Use a fluid Bootstrap layout
fluidPage(    
    
    # Give the page a title
    titlePanel("Diversity of a group"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
        
        # Define the sidebar with one input
        sidebarPanel(
            selectInput("group", "Group:", 
                        choices = c( "groupA", "groupB")) ,
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
          tableOutput("values"),
          p("Richness: the number of kinds"),
          p("IER: the probability that one encounter a member of a different kind"),
          hr(),
          plotOutput("phonePlot")
        )
    ) # sidebarLayout
    
   
) # fluidPage