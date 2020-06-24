#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("The Shiny Drake Equation"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        sliderInput("Rstar", label = "Mean rate of star formation in our galaxy (per year):",
                    min = 1, max = 5, value = 1.5, step = 0.5),
        
        sliderInput("fp", label = "Fraction of stars that have planets:",
                    min = 0.1, max = 1, value = 1, step = 0.01),
        
        sliderInput("ne", label = "Mean number of planets that could support life per star with planets:",
                    min = 0.2, max = 7, value = 1, step = 0.2),
        
        sliderInput("fl", label = "Fraction of the above that develop life:",
                    min = 0.1, max = 7, value = 1, step = 0.2),
        
        sliderInput("fi", label = "Fraction of the above that develops intelligent life:",
                    min = 0.01, max = 1, value = 0.5, step = 0.01),
        
        sliderInput("fc", label = "Fraction of the above that develop interstellar communication:",
                    min = 0.01, max = 1, value = 0.1, step = 0.01),
        
        sliderInput("L", label = "Length of time civilisation remains communicating (thousand years): ", 
                    min = 1, max = 1000, value = 10, step = 1)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        plotOutput("SETI"),
          textOutput("drake")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$SETI <- renderImage({
    list(src = "../drake-equation-1600px.jpg",
         width = 1200,
         height = 400)
  })
   
   output$drake <- renderText({
     expr = paste0("These parameters estimate that there are ", 
                   round(input$Rstar * input$fp * input$ne * input$fl * input$fi * input$fc * input$L),
                   " civilisations that we could communicate with")}
)
}
# Run the application 
shinyApp(ui = ui, server = server)

