## chatbot order pizza project

pizza1 <- function() {
  ## create vector and dataframe
  pizza <- c("supreme", "hawaian", "seafood", "italian", "island")
  p_price <- c(7.5, 6.75, 8, 7.25, 6.5)
  drink <- c("coke", "water", "juice", "milk", "coffee")
  d_price <- c(2.25, 1.5, 3, 2.75, 2.5)
  df_pizza <- data.frame(pizza, p_price, drink, d_price)
  
  print("Hello, welcome to essopizzer restaurant")
  print("Please see below for the menu")
  
  ## present menu to a user
  print("---------------------------------------")
  print(df_pizza)
  print("---------------------------------------")
  
  ## get menu input and check if it's in a database
  vp_order <- FALSE
  while (!vp_order) {
    p_order <- readline("What type of pizza are you would like to order? :")
    if (p_order %in% pizza) {
      vp_order <- TRUE
    } else {
      print("no this menu, pleae order again")
    }
  }
  
  ## get drink input and check if it's in a database
  vd_order <- FALSE
  while (!vd_order) {
    d_order <- readline("What type of drink are you would like to order? :")
    if (d_order %in% drink) {
      vd_order <- TRUE
    } else {
      print("no this drink, please order again")
    }
  }
  
  ## match and calculate the total price from the order 
  if (p_order %in% pizza) {
    price_p <- df_pizza[pizza == p_order,"p_price"]
  } 
  if (d_order %in% drink) {
    price_d <- df_pizza[drink == d_order,"d_price"]
  } 
  print(paste0("The total price is ", price_p + price_d, " $"))
  print("Thank you very much for your order, have a nice day")
}

pizza1()
