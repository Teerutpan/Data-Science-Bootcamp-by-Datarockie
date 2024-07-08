## 'pao ying chub' game project

play_game <- function() {
  print("Welcome to 'pao ying chub' game")
  print("game rule")
  print("hammer win scissor, scissor win paper, paper win hammer")
  print("-------------------------------------------------------")
  print("battle of 10 rounds between user and computer")
  
  ## create a dataframe
  id <- 1:3
  hands <- c("hammer", "scissor", "paper")
  df <- data.frame(id, hands)
  
  ## set paramiter start from zero
  game <- 0
  me_score <- 0
  com_score <- 0
  
  ## using while loop to determine 10 rounds number of the game
  while (game < 10) {
    v_me <- FALSE
    ## get input and check if it's in a database
    while (!v_me) {
      me <- readline("Choose your weapon, hammer = 1, scissor = 2, paper = 3:")
      if (me %in% id) {
        v_me <- TRUE
      } else {
        print("sorry!, please choose only 1, 2 and 3")
      }
    }
    
    com <- sample(1:3, 1)
    me1 <- df[id == me, 2]
    com1 <- df[id == com, 2]
    print(paste0(me1, " vs ", com1))
    
    ## using if clause to build the game role condition
    if (me == com) {
    } else if ((me == 1 & com == 2) | (me == 2 & com == 3) | (me == 3 & com == 1)) {
      me_score <- me_score + 1
    } else {
      com_score <- com_score +1
    }
    game <- game + 1
  }
  
  ## summarise the game result
  print("-------------------------------------------------------")
  print(paste0("The user score is : ", me_score, " point" ))
  print(paste0("The computer score is : ", com_score, " point"))
  if (me_score > com_score) {
    print("Congratulation! you win")
  } else if (me_score < com_score) {
    print("you loose, please try again!")
  } else {
    print("the result was a draw, cheers")
  }
}

play_game()
