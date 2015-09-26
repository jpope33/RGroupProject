#This script imports and displays a tab delimited file
importedData=read.table(file.choose(), header = T, sep = "\t")
importedData