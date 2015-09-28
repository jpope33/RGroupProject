#This script imports and displays a tab delimited file and a comma seperated file
importedDataTAB=read.table(file.choose(), header = T, sep = "\t")
importedDataTAB

importedDataCSV=read.csv(file.choose(), header = T)
importedDataCSV