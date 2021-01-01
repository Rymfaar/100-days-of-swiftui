import UIKit


// IF-ELSE STATEMENTS
let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}


// CONDITIONS COMBINTIONS
let age1 = 18
let age2 = 21

if age1 >= 18 && age2 >= 18 {
    print("They are both over 18")
}

let age3 = 7
let age4 = 31

if age3 < 18 || age4 < 18 {
    print("One of them is not over 18")
}
