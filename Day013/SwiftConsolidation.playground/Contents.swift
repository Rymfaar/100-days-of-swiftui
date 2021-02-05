import UIKit


// VARIABLES & CONSTANTS

var str = "Hello, playground" // Can change its value
str = "Hello, world"
let answer = 42 // Cannot change its value
// Prefer using let constant if its content never changes


// VARIABLES TYPES

var name: String // Create a String
name = "Tim Cook" // Assign (only) a String
let _name = "Time Cook" // Inferred as String

var lucky: Int // Create an Int
lucky = 15 // Assign (only) an Int
let _lucky = 15 // Inferred as Int

var latitude: Double // Create a Double
latitude = 36.166667 // Assign (only) a Double
let _latitude = 36.166667 // Inferred as Double
var longitude: Float // Create a Float
longitude = -86.783333 // Assign (only) a Float
let _longitude = -86.783333 // Inferred as Float
// Float has a smaller precision than Double

var truth: Bool // Create a Bool
truth = true // Assign (only) a Bool
let _truth = true // Inferred as Bool

var a: Any // Create a variable that can contain Any type of data
a = 42 // Assign an Int
a = "Steve Jobs" // Asign a String
a = ["John", "Jen", "Korey", "Seth"] // Assign an Array<String>
// Try to avoid using Any as such


// STRING INTERPOLATION

let tim = "Cook"
let age = 60
let size = 1.83
print("Name: \(tim)")
print("Age: \(age)")
print("Size: \(size)")
print("You are \(age) years old. In another \(age) years you will be \(age * 2).")


// LOOPS

for it in 1...10 { // Loops from 1 to 10 (included)
    print("\(it) x 0 = \(it * 0)")
}

for it in 1..<11 { // Loops from 1 to 11 (excluded)
    print("\(it) x 0 = \(it * 0)")
}

var haters = "Haters gonna "
for _ in 1...5 { // Loops from 1 to 5 but value is never stored
    haters += "hate "
}
print(haters)

let skate = ["skate", "cruise", "skate", "cruise"]
for elem in skate { // Iterates through array elements
    print("I like to \(elem)")
}
for it in 0..<skate.count {
    print("I like to \(skate[it])") // Accessing value using ranks
}

