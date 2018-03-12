# Set working directory
# setwd("F:/R/R Programming/Week4-Programming")
rankall <- function (outcome="heart attack", num = "best"){
        #read outcome data
        df <- read.csv("outcome-of-care-measures.csv", colClasses = "character", head=TRUE)
        #subset the df
        subname <- c("Provider.Number", 
                     "Hospital.Name",
                     "State",
                     "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
                     "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
                     "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
        )
        df <- subset(df, select = subname)
        names(df) <- c("Provider.Number", 
                       "Hospital.Name", 
                       "State",
                       "heart attack", 
                       "heart failure", 
                       "pneumonia")
        # Check the state and outcome are valid
        diseases <- c("heart attack", "heart failure", "pneumonia")
        statesvectors <- unique(df$State)
        statesvectors <- sort(statesvectors)
        if( ! outcome %in% diseases  ){
                stop("invalid outcome")
        }
        
        mydata <- data.frame(hospital= character(),
                             state =character())
        for(state0 in statesvectors){
                # save the data of a certain state into a new dataframe outcomestate
                outcomebystate <- split(df, df$State)
                outcomeforstate <- outcomebystate[[state0]]
                
                #Remove the rows with "Not Available" input.
                outcomeforstate <- subset(outcomeforstate, outcomeforstate[[outcome]]!= "Not Available")               
                # Check the validity of its arguments
                maxsize = nrow(outcomeforstate)
                if(num == "best"){
                        num = 1   
                }
                else if(num == "worst"){
                        num = maxsize
                }
                else if(num > maxsize){
                        de<- data.frame("hospital"= NA, "state"= state0)
                        mydata <- rbind(mydata, de)
                        next
                }
                
                rankings <-  order( as.numeric( outcomeforstate[[outcome]] ) ) 
                hospitalname <- outcomeforstate[["Hospital.Name"]][rankings[num]]
                de<- data.frame(hospitalname, state0)
                names(de) <- c("hospital", "state")
                mydata <- rbind(mydata, de)
        }
        mydata
}
