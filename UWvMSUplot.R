library(rowr)

#reading the data in as a variable GameScores
GameScores <- read.table("UWvMSU_1-22-13.txt", header = TRUE, sep = "\t", stringsAsFactors = FALSE)

#subsetting to create data frames for each score and the respective times
UW_Data <- GameScores[GameScores$team == "UW",]
MSU_Data <- GameScores[GameScores$team == "MSU",]

#pulling out the scores for each team
UW_Scores <- cumsum(UW_Data$score)
MSU_Scores <- cumsum(MSU_Data$score)

#making data frame to match up each team's scores with their respective times
UW_Scores_and_time <- data.frame(UW_Data$time, UW_Scores)
MSU_Scores_and_time <- data.frame(MSU_Data$time, MSU_Scores)

#renamed columns
colnames(UW_Scores_and_time) <- c("UW_time","UW_Scores")
colnames(MSU_Scores_and_time) <- c("MSU_time","MSU_Scores")

#combined data using rowr package function cbind.fill()
allData <- cbind.fill(UW_Scores_and_time, MSU_Scores_and_time,fill=NA)

#plotting first the UW score by its time values, then overlaying MSU and its times. Adding legend
plot(x=allData$UW_time, y=allData$UW_Scores, type = "l", col = "red", 
     xlab="Time(minutes)", ylab="Score", main="UW vs MSU (1/22/13)")
lines(x=allData$MSU_time, y=allData$MSU_Scores, type = "l", col = "dark green")
legend(5, 45, legend=c("UW", "MSU"),col=c("red", "dark green"), lty=1:1, cex=0.8)