
# Set working directory
# setwd("F:/R/R Programming/Week4-Programming")


# Finding the best hospital in a state
best <- function(state, outcome) {
        # Read outcome data
        df <- read.csv("outcome-of-care-measures.csv", colClasses = "character", head=TRUE)
        #subset the df
        subname <- c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure","Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"   )
        df <- subset(df, select = subname)
        names(df) <- c("Hospital.Name", "State","heart attack", "heart failure", "pneumonia")
        # Check the state and outcome are valid
        diseases <- c("heart attack", "heart failure", "pneumonia")
        statesvectors <- unique(df$State)
        if(! state %in% statesvectors ){
                stop("invalid state")
        }
        if( ! outcome %in% diseases  ){
                stop("invalid outcome")
        }
        
        # save the data of a certain state into a new dataframe outcomestate
        outcomebystate <- split(df, df$State)
        outcomeforstate <- outcomebystate[[state]]
        #Remove the rows with "Not Available" input.
        outcomeforstate <- subset(outcomeforstate, outcomeforstate[[outcome]]!= "Not Available")
        
        rankings <-  order( as.numeric( outcomeforstate[[outcome]] ) ) 
        outcomeforstate[["Hospital.Name"]][ rankings[1]]
        
}



