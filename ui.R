library(shiny)
library(ggplot2)  # for the diamonds dataset

shinyUI(pageWithSidebar(
    headerPanel('Shiny Application'),
    sidebarPanel(
        
        checkboxGroupInput('show_vars', 'Columns in Iris to show:', names(iris),
                           selected = names(iris)),
               actionButton("goButton","Show Columns  !!"),
        helpText('Note : This button is to show selected columns in iris tab only.')
        
    ),
    mainPanel(
        tabsetPanel(
            
            tabPanel('Iris',
			    br(),
				h4("Data Table output for selected columns "),
				br(),
                     dataTableOutput("iris1")),
                     
            tabPanel('Summary',
   			    br(),
   				h4(" Summary of dataset for selected columns "),
   				br(),
                      verbatimTextOutput("summary")),
            tabPanel('Plot/Graph',
	    			    br(),
	    				h4(" Graph plot for selected columns "),
	    				br(),
                     plotOutput("plotOut")),
		             tabPanel('Help',
					# includeMarkdown("ShinyAppHelp1.Rmd"),
		                     includeHTML("ShinyAppHelp1.html")),
					h6('Refer : Shiny Turorial'),a(' http://rstudio.github.io/shiny/tutorial ' )
            
            
        
            
        )
    )
	
    
))