## create new restaurant.db database

## load library
library(tidyverse)
library(RSQLite)

## create the database and open connection
res <- dbConnect(SQLite(), "reataurant.db")

## create dataframe
staff <- data.frame(
  staff_id = 1:5,
  staff_name = c("essan", "minkjung", "ingjung", "tatakung", "kogajung"),
  hire_date = c("2022-09-27", "2020-07-14", "2022-01-01", "2019-10-23", "2021-04-09")
)

transaction <- data.frame(
  transaction_id = 1:10,
  staff_id = c(3, 2, 3, 4, 5, 1, 2, 3, 4, 5),
  menu_id = c(6, 7, 3, 4, 1, 6, 7, 1, 2, 3),
  customer_id = 1:10,
  transaction_date =c("2024-02-13", "2022-07-21", "2023-01-01", "2022-06-10", "2023-06-19", "2022-01-07", "2024-01-14", "2023-06-07", "2022-07-02", "2022-08-14")
)

menu <- data.frame(
  menu_id = 1:7,
  menu_name = c("pizza", "burger", "frenchfried", "fried rice", "fried noodle", "omelette", "fried fish"),
  price = c(12.5, 7.5, 3.0, 6.0, 6.5, 4.5, 9.5)
)

customer <- data.frame(
  customer_id = 1:12,
  customer_name = c("david", "jane", "john", "emily", "mike", "sara", "tom", "jennifer", "david", "jane", "john", "emily"),
  sex = c("male", "female", "male", "female", "male", "female", "male", "female", "male", "female", "male", "female"),
  age = c(20, 25, 14, 17, 7, 45, 52, 33, 19, 9, 67, 21)
)

## write table into a database
dbWriteTable(res, "staffs", staff)
dbWriteTable(res, "transactions", transaction)
dbWriteTable(res, "menus", menu)
dbWriteTable(res, "customers", customer)

## check table in the database
dbListTables(res)

## check column name in the table
dbListFields(res, "staffs")

## get data from the table
dbGetQuery(res, "select * from customers")

## function for remove table
dbRemoveTable(res, "transactions")

## close connection
dbDisconnect(res)


