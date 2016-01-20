shinyUI(navbarPage("Mtcars analysis",
        
        tabPanel("Exploratory Analysis",
                 headerPanel('Exploratory analysis'),
                 sidebarPanel(
                         selectInput('xcol', 'X Variable', names(mtcars)),
                         selectInput('ycol', 'Y Variable', names(mtcars), 
                                     selected=names(mtcars)[[2]]),
                         radioButtons("plot", "Plot", c("point", "boxplot","bar"))
                         
                 ),
                 mainPanel(
                         plotOutput('plot1')
                 )
                  
                   ),
        
        tabPanel("Summary",
        headerPanel('Summary'),
        verbatimTextOutput("summary")
                   ),
        
        tabPanel("Data Table",
                 headerPanel('Data Table'),
                 DT::dataTableOutput("table")
                 )
        
                   
                                                      
                                         
))
