# Coursera - Developing Data Products
# Course Project - Shiny Application
# ====================================

library(shiny)
library(markdown)

shinyUI(fluidPage(
        # Application title
        titlePanel("Fuel Cost Calculator"),
        helpText("Calculate your estimated monthly petrol cost for driving to work"),
        
        sidebarLayout(
                sidebarPanel(        
                        helpText("Provide information about your home-to-work distance, your car and estimated petrol cost"),
                        h3("Your work trip:"),
                        sliderInput('distance', 'Home to work distance (in miles):',value=20, min = 1, max = 100, step=1),
                        sliderInput('days', 'Average number of work days (in a month):', value=20, min = 1, max = 28, step=1),
                        
                        h3("Your car:"),
                        sliderInput("wt", "Weight (1000lbs)",
                                    min=1.5, max=5.5, value=3.3),
                        sliderInput("hp", "Gross horsepower",
                                    min=52.0, max=335.0, value=150.0, step=1),
                        selectInput("cyl", "# of cylinders",
                                    choices = list("4" = 4, "6" = 6, "8" = 8), selected=4),
                        
                        h3("Estimated petrol cost:"),
                        sliderInput('cost', 'Petrol Price (per gallon):', value=2.25, min = 2, max = 4, step=0.01)
                     
                        
                ),
                
                mainPanel(
                        tabsetPanel(
                                 
                                tabPanel("Application",
                                         h3("Results of prediction"),
                              
                                         h4("Based on the information you have provided:"),
                      
                                         htmlOutput("distance"),
                                         htmlOutput("mpg"),
                                         htmlOutput("m_cost"),
                                         htmlOutput("y_cost"),
                                         plotOutput("compare")
                                                           
                                ),
                                tabPanel("Documentation",
                                         mainPanel(
                                                 includeMarkdown("about.md")
                                         )
                                )
                        )            
                )
        )
))