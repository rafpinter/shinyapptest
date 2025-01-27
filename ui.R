library(shiny)
options(shiny.sanitize.errors = FALSE)

ui <- fluidPage(
  HTML(
    '<h1>Teste</h1>'
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