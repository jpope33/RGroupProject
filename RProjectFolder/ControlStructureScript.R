#This script generates a data frame and shows basic conditional statements

Names=c("Mike", "Susan", "David", "Thomas", "Nick", "Dana", "Simon", "Lisa")
Gender=c("M","F","M","M", "M", "F","M","F")
Age=c(27,33,44,39,33,26,44,49)
Smoker=c(F,F,T,F,T,F,F,T)
StudyParticipants=data.frame(Names, Gender, Age, Smoker)

#Smoker % based on gender
maleSmokerPer=100*(sum(StudyParticipants$Gender=="M" & StudyParticipants$Smoker==T)/sum(StudyParticipants$Gender=="M"))
femaleSmokerPer=100*(sum(StudyParticipants$Gender=="F" & StudyParticipants$Smoker==T)/sum(StudyParticipants$Gender=="F"))

#if, else
if(nrow(StudyParticipants)>10){
  print("There are more than 10 participants in the study")
}else{
  print("There are less than or equal to 10 participants in the study")
}

#ifelse 
ifelse(maleSmokerPer>femaleSmokerPer, "Larger Percentage of Males Smoke", 
       ifelse(maleSmokerPer==femaleSmokerPer, "Equal Percentage of Males and Females Smoke", "Larger Percentage of Females Smoke"))

#while loop
iterations=0
randNum=as.integer(runif(1,0,10))
while(randNum!=7){
  randNum=as.integer(runif(1,0,10))
  print(randNum)
  iterations=iterations+1
}
cat("The random number generated equals 7, this took ",iterations, " iterations through the while loop")

#for loop
for(n in 1:10){
  print(n*5)
}