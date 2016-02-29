library(shiny)

shinyServer(function(input, output) {
    
    
    
    # customize the length drop-down menu; display 5 rows per page by default
    output$iris1 = renderDataTable({
        input$goButton
        #iris
        library(ggplot2)
        isolate({iris[, input$show_vars, drop = FALSE]})
    }, options = list(aLengthMenu = c(5, 10, 20,30,40,50), iDisplayLength = 5))
  
    iris2 <- reactive({
      switch (input$dataset,
          'IRIS' = iris
      )  
    })

    
    output$summary <- renderPrint({
        dataset <- iris[, input$show_vars, drop = FALSE]
        #dataset <- renderDataoutput$
        summary(dataset)
    })  
    
    output$plotOut <- renderPlot({
        plot(iris[, input$show_vars, drop = FALSE])  
    })

})