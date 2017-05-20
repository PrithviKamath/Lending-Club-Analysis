##Bend graph
data<-read.csv("C:\\Users\\prith\\Documents\\Python Scripts\\ads assignment2\\ClusterInputData.csv")

head(data)

data$sub_grade<-as.integer(data$sub_grade)
data$derived_int_rate<-as.integer(data$derived_int_rate)
data$derived_annual_inc<-as.integer(data$derived_annual_inc)
data$issue_year<-as.integer(data$issue_year)
data$application_type<-as.integer(data$application_type)
data$Derived_term<-as.integer(data$Derived_term)
data$FICO<-as.integer(data$FICO)
data$derived_emp_length<-as.integer(data$derived_emp_length)
data$addr_state<-as.integer(data$addr_state)
data$total_acc<-as.integer(data$total_acc)
data$loan_amnt<-as.integer(data$loan_amnt)
data$verification_status<-as.integer(data$verification_status)
data$home_ownership<-as.integer(data$home_ownership)
data$acc_open_past_24mths<-as.integer(data$acc_open_past_24mths)
data$revol_bal<-as.integer(data$revol_bal)
data$derived_mths_since_last_delinq<-as.integer(data$derived_mths_since_last_delinq)

any(is.na(data))

wss <- nrow((data)-1)*sum(apply(data,2,var)) 
for (i in 2:15) 
{
  wss[i] <- sum(kmeans(data,centers=i)$withinss) # Within Sum of Squared for 
  # different number of clusters
}  

plot(1:15, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares")
