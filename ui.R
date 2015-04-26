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
                                         h3("Fuel Cost Calculator"),
                                         
                                         p("The 'Fuel Cost Calculator' app was developed 
                                           for the 'Developing Data Products Course' on Coursera."),
                                         
                                         p("This app aims to help you to calculate the estimated mpg of your car, 
                                           based on your car's weight, number of cylinders and horsepower. 
                                           It uses a linear regression model based on the mtcars dataset from R. 
                                           With your estimated mpg, and your monthly work trip distance and petrol cost, 
                                           it will compute for you your monthly and yearly petrol costs. 
                                           It also gives an indication of your car's mileage ranking among the other cars in mtcars dataset. "),
                                         
                                         p("1. You need to inform the distance of your home to work trip and your average working days in a month. 
                                           With these information, it will calculate your total work trip distance (including return home trips) in a month."),
                                         
                                         p("2. You can select the weight, cylinders and horsepower of your car and it will try to estimate your car's mpg based on 
                                           the step-wise linear regression model on the mtcars dataset. 
                                           You can also see how your car compares to the other cars (in terms of mpg)."),
                                         
                                         p("3. Finally, you can set the prevailing petrol cost, to have an estimation of your monthly and yearly petrol costs, 
                                           based on your expected monthly work travel distance and your car's fuel economy."),
                                         
                                         p("Source code for ui.R and server.R files are available on the [GitHub](https://github.com/csingeu/Developing-Data-Products-Project).")
                                )
                        )            
                )
        )
))