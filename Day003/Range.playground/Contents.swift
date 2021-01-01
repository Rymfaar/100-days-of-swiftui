import UIKit


let examScore = 42
let maxScore = 50

// RANGES
switch examScore {
case 0..<25: // From 0 to 25 (including 0, excluding 25)
    print("You have failed!")
case 25..<40: // From 25 to 40 (including 25, excluding 40)
    print("You did OK.")
case 40...(maxScore - 1): // From 40 to 49 (including 40 and 49)
    print("Good job!")
default: // Else range
    print("Excellent work!")
}
