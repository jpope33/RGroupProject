#Imports and displays tab delimited file
importedDataTAB=read.table(file.choose(), header = T, sep = "\t")
importedDataTAB

#Imports and displays comma separated file
importedDataCSV=read.csv(file.choose(), header = T)
importedDataCSV

Names=c("Mike", "Susan", "David", "Tom", "Nick", "Dana", "Simon", "Lisa")
Gender=c("M","F","M","M", "M", "F","M","F")
Age=c(27,33,44,39,33,26,44,49)
Smoker=c(F,F,T,F,T,F,F,T)
StudyParticipants=data.frame(Names, Gender, Age, Smoker)

#Exports file as tab delimited file named testTAB
write.table(StudyParticipants, "/Users/jonathanpope/Desktop/writeTo/testTAB.txt", sep="\t", row.names = F)

#More robust export that retains column alignment format
capture.output(print(StudyParticipants, print.gap=3), file="/Users/jonathanpope/Desktop/writeTo/testTABformat.txt")

#Exports table as comma separated file named testCSV
write.csv(StudyParticipants, "/Users/jonathanpope/Desktop/writeTo/testCSV.csv")

#Input/Output using readline
fun <- function() {
  
  name <- readline("Enter your name ")
  age <- readline("Enter your age ")
  smoke <- readline("Do you smoke? (yes, no) ")
  
  cat("Your name is ",name," and your age is", age, ". \n Smoking is a ", smoke, " for you.")
  
}

if(interactive()) fun()
