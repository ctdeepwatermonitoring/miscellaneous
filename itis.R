library(jsonlite)
library(stringr)

# Get data for a particular taxon from ITIS
data <- fromJSON("https://services.itis.gov/?q=tsn:3860")

# Subset data to get hierarchy with ranks
hier <- str_split(data$response$docs$hierarchySoFarWRanks[[1]],"[$]")

# Get length of list
length(hier[[1]])

# Parse out ranks to build master taxa list
str_split(hier[[1]][1],":")[[1]][1]
str_split(hier[[1]][1],":")[[1]][2]

str_split(hier[[1]][2],":")[[1]][1]
str_split(hier[[1]][2],":")[[1]][2]



