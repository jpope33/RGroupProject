#creation of a Vector
cars <- c("bmw" = 55,"chevrolet" = 42,"ford" = 51,"toyota" = 22)
#vector subsetting
american <- c(cars[2],cars[3])
american
foreign <- c(cars[1],cars[4])
foreign

#Using cars vector to demonstrate Matrix
car_lot <- matrix(cars, nrow = 4, ncol = 1)
rownames(car_lot) <- names(cars)
colnames(car_lot) <- c("# of Cars")
car_lot

#Using a new vector to demonstrate Factor
grades <- c("A","C","B","A","A","D","C","B")
#factor creation with ordered set to true since grades are weighted
grade_factor <- factor(grades, ordered=TRUE, levels = c("F", "D", "C", "B", "A"))
grade_factor

#Creation of a List which allows storing of different object types
dealership_data <- list("Tuesday", 5, 1)
names(dealership_data) <- c("Day", "customers", "cars sold")
str(dealership_data)
#Select a single element from a list and display it as a vector
cars_sold <- dealership_data[[3]]
cars_sold


#Creation of a data frame
car_make <- c("BMW", "Chevrolet", "Ford", "Toyota")
car_model <- c("335i", "Camaro", "Mustang", "4Runner")
on_sale <- c(TRUE, TRUE, FALSE, FALSE)
ad <- data.frame(car_make, car_model, on_sale)
ad
ad[2:3]
#Add a column to data frame
price <- c(35000, 32000, 28000, 29000)
ad_price <- cbind(ad, price)
names(ad_price) <- c("Make","Model","Sale","Price")
ad_price
#Sort data frame low to high by Price
low_high <- order(ad_price$"Price")
ad_price[low_high,]
#Sort data frame high to low by Price
ad_price[order(ad_price$"Price", decreasing = TRUE)]

#Using plot to display plot of car model, car price
plot(ad$car_model, ad_price$Price)

#Using histogram to display car price
hist(ad_price$Price)