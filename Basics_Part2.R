#------------------
#Part 3: Importing and Examining Datasets

#Data Frames
#Constructing a data frame manually
ID<-as.integer(1:4) #forcing id to be an integer
firstName<-c("George","Paul","John","Ringo")
lastName<-c("Harrison","McCartney","Lennon","Starr")
score<-seq(10,40,10)
d<-data.frame(ID,firstName,lastName,score) #creating a dataframe
d
class(d) #type of d
colnames(d)  #name of the columns
names(d)<-c("ID", "First", "Last", "Score") #changing col headings name using names and c functions
colnames(d)
d
str(d) #get info about d

#Note: when creating a data frame, the number of observations in each of your
#variables must be equal, other wise you will get an error.

age<-c(43, 26, 75)
df<-data.frame(ID, firstName, lastName, age) #this is causing an error cause age has 3 eternities but id,name and last name have 4


#Importing a dataset
#Remember to check your working directory!
getwd()

#Import dataset
FAOSTAT <- read.csv("FAOSTAT.csv")
class(FAOSTAT)

#Examining a datset
dim(FAOSTAT) #finding the dimentions of the data set
colnames(FAOSTAT) #headers (col) names
str(FAOSTAT) #structure functions helps to learn more about the dataframe
head(FAOSTAT) #head functions give us the first few enteries in the dataframe
View(FAOSTAT) #opens the table in a seperate tab
summary(FAOSTAT) #summerieses the dataframe 

#Selecting individual rows and elements
FAOSTAT[18,] #gives the 18th row
FAOSTAT[10:15,] #gives 10 to 15th rows
FAOSTAT[42,4] #value 42 of col 4
FAOSTAT[42,"Area"] #value 42 of col area
FAOSTAT[35:37,2:3] #rows 35-37 values 2-3

#Another way to select data
head(FAOSTAT$Area, 5) #$ shows we are interested in a particular variables, values 5 of area 
FAOSTAT$Area[12] #intersted in areas form row 12

#Applying a function
mean(FAOSTAT$Value) #means yield of the table
sd(FAOSTAT$Value) #sd of the table 

# Finding a maximum 
max(FAOSTAT$Value) #max values of the whole table
which.max(FAOSTAT$Value) #row675347 has that max values
FAOSTAT[675347,"Area"] 
FAOSTAT[675347,4:10]

FAOSTAT[which.max(FAOSTAT$Value),4:10] #summeries all the above things in 1 line

#Adding a new variable 
FAOSTAT$Yield <- FAOSTAT$Value/10 #we want a new col called "yield' and assigning data to it, which is value col/10
head(FAOSTAT)

#Renaming a variable
names(FAOSTAT)[names(FAOSTAT) == "Yield"]<- "YieldKg" #renaming the header/col
names(FAOSTAT)

#Adding a new variable based on a condition
FAOSTAT$BigYield <- FAOSTAT$YieldKg >=10000 #checking if a valis bigger than 1000 (is this true or not)
head(FAOSTAT$BigYield) #first few enteries
View(FAOSTAT)

#Removing a variable
FAOSTAT$BigYield <- NULL #removing a col from data table
colnames(FAOSTAT)

#Creating a subset of results
syria <- subset(FAOSTAT, FAOSTAT$Area == "Syrian Arab Republic") #all entire that have SAR as thier country
class(syria)
syria_wheat <- subset(syria, syria$Item == "Wheat") #substet of SAR where item is wheat
min(syria_wheat$Year)
max(syria_wheat$Year)
mean(syria_wheat$YieldKg)
min(syria_wheat$YieldKg)
max(syria_wheat$YieldKg)

iraqiran<- subset(FAOSTAT, (FAOSTAT$Area == "Iraq" | FAOSTAT$Area == "Iran (Islamic Republic of)"))
iraqiranwheat <-FAOSTAT[(FAOSTAT$Area == "Iraq" | FAOSTAT$Area == "Iran (Islamic Republic of)") & (FAOSTAT$Item == "Wheat"),]

#EXERCISE
#1. Find the minimum, maximum and average yield in kg/ha for barley ("Barley") for Jordan ("Jordan").
jordan <- subset(FAOSTAT, FAOSTAT$Area == "Jordan")
jordan_barley <- subset(jordan, jordan$Item == "Barley")
max(jordan_barley$YieldKg)
mean(jordan_barley$YieldKg)
min(jordan_barley$YieldKg)
#2.  What year did Jordan have its largest barley yield in this dataset? What year did it have its smallest barley yield?
min(jordan_barley$Year)
max(jordan_barley$Year)
#3. What crop had the maximum yield in Jordan for the year 2003? What crop had the minimum yield in Jordan for the same yield?

