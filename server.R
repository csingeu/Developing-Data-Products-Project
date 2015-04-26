# Coursera - Developing Data Products
# Course Project - Shiny Application
# ====================================

library(shiny)
library(MASS)

# Formula to predict fuel consumption
# (as estimated in regression model course)
data(mtcars)

model <- lm(mpg ~ wt+cyl+disp+hp+am, mtcars)
step <- stepAIC(model)


mpg <- function(wt, cyl, hp){
        out <- step$coeff[1] + step$coeff[2] * wt + step$coeff[3] * cyl + step$coeff[4] * hp
        round(out,2)
}

monthly_distance <- function(distance, days) {
        distance <- distance * 2 * days
        distance
}

cars <- data.frame(rownames(mtcars), mtcars)
colnames(cars)[1]="name"
cars <- cars[,c(1,2)]
cars$color <- "gray"

shinyServer(
        function(input, output){
                
                # Render output
                output$distance <- renderUI({ 
                        HTML(paste("If you work <b>", input$days, "</b> days a month, you will at least travel <b><font color='red'>", monthly_distance(input$distance, input$days), " miles a month</font></b> (including return trip home)."))
                })
                
                output$mpg <- renderUI({ 
                        HTML(paste("Your car (with <b>", input$wt * 1000, " lbs, ", 
                                   input$hp ," hp and ", input$cyl," cylinders</b>) is predicted to have a fuel economy of <font color='red'><b>", 
                                   mpg(input$wt, as.numeric(input$cyl), input$hp), " Miles/(US) gallon (mpg).</b></font>"))
                })
                
                output$m_cost <- renderUI({ 
                        HTML(paste("At estimated petrol cost of <b>$",input$cost, " and monthly trip distance of  ", monthly_distance(input$distance, input$days), " miles</b>, ", 
                                   "you will need to spend at least <b><font color='red'>$", round(monthly_distance(input$distance, input$days) / mpg(input$wt, as.numeric(input$cyl), input$hp) * input$cost,2), "</b></font> a month on petrol."
                                   ))
                })
                
                output$y_cost <- renderUI({
                        HTML(paste("And that is almost <b><font color='red'>$", round(monthly_distance(input$distance, input$days) / mpg(input$wt, as.numeric(input$cyl), input$hp) * input$cost * 12,2), "</b></font> a year, just on petrol."))
                })
                
                
                
                output$compare <- renderPlot({
                        cars[1]<- lapply(cars[1], as.character)
                        you <- c("You", mpg(input$wt, as.numeric(input$cyl), input$hp), "red")
                        cars <- rbind(cars, you)
                        cars[2] <- lapply(cars[2], as.numeric)
                        cars <-cars[order(cars[,2]),]
                        
                        # Fitting Labels 
                        par(las=2) # make label text perpendicular to axis
                        par(mar=c(5,8,4,2)) # increase y-axis margin.
                        barplot(cars$mpg, names.arg=cars$name, col = cars$color, 
                                main="How you car compares to others (in mpg)",
                                xlab="mpg",
                                
                                cex.names=0.9, cex.axis=1.0,
                                horiz=TRUE,  las=1)
                        
                })
        }
)