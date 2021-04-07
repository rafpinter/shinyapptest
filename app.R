library(shiny)


ui <- fluidPage(
  HTML(
    '<h1>Carai que incrível</h1>'
    ),
  tags$hr(),
  sliderInput(inputId = "num",
              label = "Choose a number",
              value = 25, min = 1, max = 100),
  textInput(inputId = "title", label = "Write a title", value = "Histogram" ),
  actionButton(inputId = "go", label = "Update"),
  plotOutput("hist"),
  plotOutput("bar"),
  verbatimTextOutput("stats")
)

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
