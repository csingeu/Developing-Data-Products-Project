---
title: "Documentation"
output: html_document
---

## Fuel Cost Calculator

The "Fuel Cost Calculator" app was developed for the "Developing Data Products Course" on Coursera.

This app aims to help you to calculate the estimated mpg of your car, based on your car's weight, number of cylinders and horsepower. It uses a linear regression model based on the mtcars dataset from R. With your estimated mpg, and your monthly work trip distance and petrol cost, it will compute for you your monthly and yearly petrol costs. It also gives an indication of your car's mileage ranking among the other cars in mtcars dataset. 

1. You need to inform the distance of your home to work trip and your average working days in a month. With these information, it will calculate your total work trip distance (including return home trips) in a month.

2. You can select the weight, cylinders and horsepower of your car and it will try to estimate your car's mpg based on the step-wise linear regression model on the mtcars dataset. You can also see how your car compares to the other cars (in terms of mpg).

3. Finally, you can set the prevailing petrol cost, to have an estimation of your monthly and yearly petrol costs, based on your expected monthly work travel distance and your car's fuel economy.

Source code for ui.R and server.R files are available on the [GitHub](https://github.com/csingeu/Developing-Data-Products-Project).