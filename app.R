library(shiny)
library(shinythemes)
library(rsconnect)

ui <- fluidPage(
  
  theme = shinytheme("superhero"),
  
  titlePanel("Zadanie 5"),
  
  sidebarLayout(
    sidebarPanel(
      
      textInput("text", "Wpisz tekst poniżej:"),
      numericInput("numer", "Wybierz numer od 0 do 100:", value = "50", min = "0", max = "100", step = "1"),
      selectInput("litera", "Wybierz literę od A do K:", choices = LETTERS[1:11])
      
    ),
    
    mainPanel(
      
      h3("Poniżej wpisany tekst, wybrany numer i litera"),
      code(textOutput("text_output")),
      strong(textOutput("numer_output")),
      em(textOutput("litera_output"))
      
    )
  )
)

server <- function(input, output) {
  
  output$text_output <-
    renderText(
      paste("Wpisany tekst:", input$text)
    )
  
  output$numer_output <-
    renderText(
      paste("Wybrany numer:", input$numer)
    )
  
  output$litera_output <-
    renderText(
      paste("Wybrana litera:", input$litera)
    )
  
}

shinyApp(ui, server)