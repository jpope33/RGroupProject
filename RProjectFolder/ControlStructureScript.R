#This script generates a data frame via vectors and shows basic conditional statements

Names=c("Mike", "Susan", "David", "Thomas", "Nick", "Dana", "Simon", "Lisa")
Gender=c("M","F","M","M", "M", "F","M","F")
Age=c(27,33,44,39,33,26,44,49)
Smoker=c(F,F,T,F,T,F,F,T)
StudyParticipants=data.frame(Names, Gender, Age, Smoker)

maleSmokerPer=100*(sum(StudyParticipants$Gender=="M" & StudyParticipants$Smoker==T)/sum(StudyParticipants$Gender=="M"))
femaleSmokerPer=100*(sum(StudyParticipants$Gender=="F" & StudyParticipants$Smoker==T)/sum(StudyParticipants$Gender=="F"))

ifelse(maleSmokerPer>femaleSmokerPer, "Larger Percentage of Males Smoke", 
       ifelse(maleSmokerPer==femaleSmokerPer, "Equal Percentage of Males and Females Smoke", "Larger Percentage of Females Smoke"))

