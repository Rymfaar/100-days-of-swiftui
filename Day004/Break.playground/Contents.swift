import UIKit

let result: Int = 81
var nb: Int = 0


// BREAK – Used to exit a loop

while true {
    if nb * nb == result {
        print("\(nb) is \(result)'s square root")
        break // Exits the current loop
    }
    print("\(nb) is not \(result)'s square root")
    nb += 1
}


// If we wanted to exit part-way through we need to do two things. First, we give the outside loop a label. Second, add our condition inside the inner loop, then use break outerLoop to exit both loops at the same time.
outerLoop: for i in 1...10 {
    for j in 1...10 {
        let result: Int = i * j
        if result == 42 {
            print("Eurêka! This is the answer to life itself!")
            break outerLoop // Exits the outer loop
        }
        print("\(i) x \(j) = \(result)")
    }
}
