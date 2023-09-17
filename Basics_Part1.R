###NMC471/2001H1S Winter 2022

#-----------------------------------------------------------------
### Lesson 1, Intro to R, Basics
###Assigning Variables, Data Types, Functions
#-----------------------------------------------------------------

#Part 1: Basics

#Note: the character # is ignored by R, so anything on a line following # will be ignored

#Setting working directory
#Navigate to directory on bottom right, under files tab; 
#then More-->Set as working directory 
#OR type directly into console:
setwd("D:/Teaching/NMC471-2001_DataScience/RCode")

#Change working directory permanently by going to Tools->Global Options
#Then navigate to the right folder under "Default working directory"

#Create R script: File->New File->R Script OR Ctrl+Shift+N
#Save R script: File->Save As (after saving the first time,
#use Save button above or CTRL+S)

#Note: to run single line of code, cursor on relevant line then CTRL+Enter
#OR: press the Run button above
#OR: Code --> Run selected lines
#To run multiple lines of code, select relevant lines, then CTRL+Enter
#OR: select relevant lines, then press the Run button
#OR: Code--> Run selected lines

#Calculator
3+6
5*7
10/2
5**2
5^3

#Creating variables using <- or = 
#<- is preferred because = can be used in other contexts, so can be confusing
x<-5
y<-7
z=2

#Use camelCase to name your items
myNumber <- 42
anotherNumber<- 56
someText <- "Here is some text"
someMoreText <- 'Here is some more text'
apostrophe <- "won't"
apostrophe <- 'won\'t'
apostrophe

# Use snake_case to name your items
#Any text must have quotes
first_number <- 17
second_number <- 72
decimal_value <- 7.6666666666666666
first_text <- "Some extra text goes here"

#See value in environment tab (top right) OR
show(x)
print(y)
z

#Find data type of variable (important for troubleshooting!)
#Technically, all values are stored as vectors
#Single variables are of length = 1 (shown as [1] when dispaying values)
class(x)
class(someText)
class(3.5)

#Basic data types in R include character, numeric, integer, and logical
#Other data types do exist in R, such as double, complex, etc.
class(TRUE)
class(NA) #used for designating missing values
class(F)

#Testing logic (test for equality using ==)
first_number == 12
first_number >15
first_number < 15

class(2)
class(2L)
is.numeric(2)
is.numeric(2L)
is.integer(2)
class("text")

#Forcing specific data types
x<-as.integer(5)
class(x)
x<-5L
class(x)
as.numeric(TRUE) #converts logical value TRUE to a numeric
as.numeric(FALSE)
x<-as.character(4)
x
class(x)
x<-"4.5"
class(x)
x<-as.numeric("4.5")
x
class(x)
x<-as.numeric("text")
x
x<-as.integer(4.6)
x

# Calculations using variables
myNumber+anotherNumber
first_number*second_number
someText+first_text #gives error
TRUE+TRUE

#Different ways to use powers
myNumber^2
first_number**3

#Clearing the Environment
rm(list =ls())

#-----------------
#Part 2: Functions

#Create a list; c = combine
myList<-c(2,5,6,9,6,-9)
myList

#Create a sequence
sequenceList<-5:10
sequenceList

decreasingList<-10:5
decreasingList

reverseSequenceList<-rev(sequenceList)
reverseSequenceList

#Create sequence by increments (from, to, by)
incrementSequenceList<-seq(2,10,2)
incrementSequenceList

?seq
seq(5)
seq(2,10)
seq(from=10, to=100, by=10)

#Repeat sequence
repeatSequence<-rep(1:5, times=3)
repeatSequence

#Selecting elements in list [use square brackets]
myList
myList[2]
myList[3:5]

# mean from first principles
length(myList)
sum(myList)
sum(myList)/length(myList)

#mean
mean(myList)

#Lists of text values
countries<-c("Turkey", "Syria", "Iraq", "Iran")
countries
length(countries)
nchar(countries)
countrymean<-mean(countries)
countrymean

#Dealing with missing values
#NA not in quotation marks
mylistNA <- c(3,6,NA,6,10,NA,11)
mean(mylistNA)
?mean #get help with missing values
mean(mylistNA,na.rm=TRUE)


#-----------------------
#Other Data Types

#Factors (categorical values)
countryFactor<-as.factor(countries)
countryFactor

duplicateCountries<-c("Turkey", "Syria", "Iraq", "Turkey", "Iran","Syria")
duplicateCountries
duplicateFactor<-as.factor(duplicateCountries)
duplicateFactor

#Dates
date1<-as.Date("2021-06-27")
date2<-as.Date("2021-12-31")
class(date1)
date2-date1

#Clearing the Environment
rm(list =ls())
