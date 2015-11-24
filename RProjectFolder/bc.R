#R Term Project - ITCS 4102/5102 - UNC-Charlotte
#Joshua Locklear, Jonathan Pope, Charles Heiser, James Getsinger
#Date last modified - 11/23/2015

#The purpose of this program is to demonstrate the capabilities of the R
#language.  A dataset relating to breast cancer is used as input with the 
#goal of using R to help predict in the diagnosis of malignant and benign cases.
#The results are presented in a Shiny application with different graphs to
#compare the different variables within the dataset.

##Loading of csv file
b.cancer = read.csv("breastcancer.csv")

##Removal of unnecessary ID column
b.cancer<-b.cancer[-1]

##Creation of factor and more descriptive label
b.cancer$Diagnosis <- factor(b.cancer$Diagnosis, levels = c("B","M"), labels = c("Benign", "Malignant"))
summary(b.cancer)
benign <- b.cancer$Mean.Radius..µm.[b.cancer$Diagnosis=="Benign"]
mali <- b.cancer$Mean.Radius..µm.[b.cancer$Diagnosis=="Malignant"]

##T Test staistics of diagnosis/ mean radius
t.test(benign, mali)

##Displaying percentage of Benign, Malignant Cases
round(prop.table(table(b.cancer$Diagnosis)) * 100, digits = 1)

##Provides mean
mean(b.cancer$Mean.Radius..µm.)

##Provides range
range(b.cancer$Mean.Radius..µm.)

##Provides quantile
quantile(b.cancer$Mean.Radius..µm.)


##Box plot diagram comparing variables of diagnosis and radius
boxplot(Mean.Radius..µm. ~ Diagnosis, data=b.cancer)




radiusDens <- density(b.cancer$Mean.Radius..µm.)
##histogram created using breaks to specify the bars
hist(b.cancer$Mean.Radius..µm., breaks=c(0,5,10,15,20,25,30), col='red', freq=FALSE)
lines(radiusDens)

##Creation of normal function to make data easier to compare
normal <- function(x) { return ((x-min(x))/(max(x)-min(x)))}

##Applying normal function to b.cancer dataset
b.cancern <- as.data.frame(lapply(b.cancer[2:31], normal))
##Add in the diagnosis left out from normal function
b.cancern[31] <- b.cancer[1]
##Display new dataset with normal applied
fix(b.cancern)

##Shiny package install
install.packages("shiny")
library(shiny)
##Shiny user interface
ui <- fluidPage(
  h1("Breast Cancer"),
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a dataset:",
                  choices = c("Breast Cancer"),
                  selected = "Breast Cancer")
      
    ),
    sidebarLayout(
    sidebarPanel(
      selectInput("comparison", "Choose a comparison:",
                  choices = c("Histogram Radius", "boxplot diagnosis~radius","diagnosis~radius", "mean~radius"),
                  selected = "diagnosis~radius")
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
))

server <- function(input,output){
  datasetInput <- reactive ({
    switch(input$dataset,
           "Breast Cancer" = b.cancer
           )
    
  })
  
##This provides a summary of data - to be inserted later  
##  output$summary <- renderPrint({
##    dataset <- datasetInput()
##    summary(dataset, input$comparison)
##  })
  output$plot <- renderPlot({
    dataset <- datasetInput()
    data <- switch(input$comparison,
                   "diagnosis~radius" = plot(dataset$Mean.Radius..µm., dataset$Diagnosis, main = "Plot of Mean Radius µm and Diagnosis", 
                                             xlab = "Mean Radius µm", ylab = "Diagnosis (1 = Benign, 2 = Malignant)"),
                   "mean~radius" = plot(dataset$Mean.Radius..µm., dataset$Mean.Area..µm²., main = "Plot of Mean Radius µm and Mean Area µm²", 
                                        xlab = "Mean Radius µm", ylab = "Mean Area µm²"),
                   "boxplot diagnosis~radius" = boxplot(dataset$Mean.Radius..µm. ~ dataset$Diagnosis, main = "Boxplot of Radius and Diagnosis", 
                                                        xlab = "Diagnosis", ylab = "Mean Radius µm"),
                   "Histogram Radius" = hist(dataset$Mean.Radius..µm., main = "Histogram of Mean Cell Radius", 
                                             xlab = "Mean Radius µm", breaks=c(0,5,10,15,20,25,30), col='red', freq=FALSE)
                   
                   
                                          )  
                            })
}
shinyApp(ui,server)
