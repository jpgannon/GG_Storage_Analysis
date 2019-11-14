#P is the name of the dataset
# it has column "date" that has the date for each record
# it also has a column "Pmm" which is precipitation in mm

#The code below groups by day and month, you have to also group my month
#because your data spans two months. We include year just so we have the year later.

#In words, below is what the following line does
#Give P to group_by. Consider values with the same day and month as part 
#of the same group, then summarize those groups by summing all values
#assign the result to a new dataframe called "dailyP"
# if you wanted means you would just replace sum with mean
#to get daily ranges you could do max(Pmm) - min(Pmm)
P %>% group_by(day(date), month(date), year(date)) %>%
  summarize(sum(Pmm)) -> dailyP

#change the column names of the new dataframe to ones that make sense
colnames(dailyP) <- c("day","month","year","Pmm")  

#create a new date column that just has the date
dailyP$date <- dmy(paste(dailyP$day, dailyP$month, dailyP$year))

#dailyP will act weird if we don't "ungroup" the values
#this line removes the grouping
dailyP <- ungroup(dailyP)