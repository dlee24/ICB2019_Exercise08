CorrectNumber <- as.numeric(sample(1:100,1))
TotalGuesses = 0

while(TotalGuesses < 10){
  TotalGuesses = TotalGuesses + 1
  YourGuess = as.numeric(readline(prompt = "What is your guess? "))
  if(YourGuess==CorrectNumber){
    print("You are correct. Great job!")
    break
  }else if(TotalGuesses==10){
    print("Sorry, that's not correct, and you're out of guesses. You lose!")
    break
  }else if(YourGuess < CorrectNumber){
    print("Guess a higher number!")
  }else if(YourGuess > CorrectNumber){
    print("Guess a lower number!")
  }
}