
server <- function(input, output) {
  
  rv <- reactiveValues(data = rnorm(25))
  
  observeEvent(input$go, {
    rv$data <- rnorm(input$num)
  })
  
  rt <- reactiveValues(title = "Histogram")
  
  observeEvent(input$go, {
    rt$title <- input$title
  })
  
  output$hist <- renderPlot({ 
    hist(rv$data, main = rt$title)
  })
  
  output$stats <- renderPrint({
    summary(rv$data)
  })
  
  output$bar <- renderPlot({
    plot(rv$data)
  })
}

shinyApp(ui = ui, server = server)
