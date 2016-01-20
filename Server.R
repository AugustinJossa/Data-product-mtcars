library(ggplot2)

shinyServer(function(input, output, session) {
        
        # Combine the selected variables into a new data frame
        selectedData <- reactive({
                mtcars[, c(input$xcol, input$ycol)]
        })
        
        output$plot1 <- renderPlot({
                if(input$plot == "point"){
                ggplot(selectedData(), aes_string(x=input$xcol, y=input$ycol)) + geom_point()
                }
                else if (input$plot =="boxplot"){
                ggplot(selectedData(), aes_string(x=input$xcol, y=input$ycol)) + geom_boxplot()
                }
                else if (input$plot =="bar"){
                        ggplot(selectedData(), aes_string(x=input$xcol, y=input$ycol)) + geom_bar()                }
                
        })
        
        output$summary <- renderPrint({
                summary(mtcars)
        })
        
        output$table <- DT::renderDataTable({
                DT::datatable(mtcars)
        })
})