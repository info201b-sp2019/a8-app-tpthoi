UFO_data <- read.csv("data/UFOCoords.csv.bz2", stringsAsFactors = FALSE)
library(ggplot2)
library(dplyr)
library(lubridate)
library(tidyr)
View(UFO_data)

D_C <- UFO_data %>% 
  select(Date, Country,State)
USA <- subset(D_C, Country == "USA")
View(USA)

USA$date <- lubridate::mdy(USA$Date)
USA$month <- lubridate::month(USA$date)
USA$dayofwk <- lubridate::wday(USA$date)
USA$dayofmonth <- lubridate::day(USA$date)
USA$Month <- lubridate::month(USA$date, label=TRUE)
USA$Weekday <- lubridate::wday(USA$date, label=TRUE)



server <- function(input, output) {
  output$msg <- renderText({
    input$text
  })
  output$PLOT <- renderPlot({
    
    ggplot(data = USA[USA$State == input$state,], aes(Month, color=factor(month))) + 
      geom_bar() + 
      scale_color_brewer(palette = "Set1") +
      ggtitle("Number of sightings of UFO's in your State by each month")  + 
      xlab(label = "Month") + ylab("# of sighting") +
      coord_flip()
    
  
    
  })
}