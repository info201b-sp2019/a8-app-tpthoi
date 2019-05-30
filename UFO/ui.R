library(shiny)
library(ggplot2)
data <- read.csv("data/UFOCoords.csv.bz2", stringsAsFactors = FALSE)

ui <- fluidPage(    
  
  # Give the page a title
  titlePanel("Sightings of UFO by State"),
  fluidRow(
    column(6,
           textInput("text", "Compare and Contrast between the states and their months?")
    ),
    column(6,
           textOutput("msg")
    )
  ),
  textOutput("pwd"),
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("state", "State:", 
                  choices=unique(data$State)),
      hr(),
      helpText("Selected subset contains less than 5027 entries and is
               is derived from the actual data of 5177 observations.")
      ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("PLOT")  
    )
    
    )
)