#clustering

#### kmeans (Euclidean Distance)
data<-read.csv("C:\\Users\\prith\\Documents\\Python Scripts\\ads assignment2\\ClusterInputData.csv")

data1<-read.csv("C:\\Users\\prith\\Documents\\Python Scripts\\ads assignment2\\ClusterInputData.csv")
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

#for(i in c("sub_grade","derived_int_rate","derived_annual_inc","application_type","Derived_term","FICO","derived_emp_length","addr_state","total_acc","loan_amnt","verification_status","home_ownership","acc_open_past_24mths","revol_bal","derived_mths_since_last_delinq")){
#  data[,i]=as.factor(data[,i])
#}

library(sqldf)

data<-scale(data)

km.out<-kmeans(data,4,nstart=10)
names(km.out)
km.out$cluster # kmeans results
plot(data, col=(km.out$cluster), main="K-mean result for k=4") #Scatterplot matrix

getwd()

data <- data.frame(data1, km.out$cluster)

head(data)

colnames(data)[17] <- "cluster"
cluster_1 <- sqldf("select * from data where cluster = 1")
write.csv(cluster_1, "Algo_cluster_1.csv")
cluster_2 <- sqldf("select * from data where cluster = 2")
write.csv(cluster_2, "Algo_cluster_2.csv")
cluster_3 <- sqldf("select * from data where cluster = 3")
write.csv(cluster_3, "Algo_cluster_3.csv")
cluster_4 <- sqldf("select * from data where cluster = 4")
write.csv(cluster_4, "Algo_cluster_4.csv")



