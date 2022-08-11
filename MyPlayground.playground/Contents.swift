import UIKit

/// Day 6
/// Link: https://www.hackingwithswift.com/quick-start/beginners/checkpoint-3

func FizzBuzz(_ number: Int) -> Void {
    if number.isMultiple(of: 3) && number.isMultiple(of: 5) {
        print("FizzBuzz")
    } else if number.isMultiple(of: 5) {
        print("Buzz")
    } else if number.isMultiple(of: 3) {
        print("Fizz")
    } else {
        print("\(number)")
    }
}

for it in 1...100 {
    FizzBuzz(it)
}

/// Day 8
/// Link: https://www.hackingwithswift.com/quick-start/beginners/checkpoint-4

enum SqrtError: Error {
    case outOfBounds(String)
    case noRoot(String)
}

func mySqrt(_ number: Int) throws -> Int {
    if (number <= 0) {
        throw SqrtError.outOfBounds("Out of range: number is < 1")
    }
    if number > 10_000 {
        throw SqrtError.outOfBounds("Out of range: number is > 10.000")
    }
    for it in 1...100 {
        if it * it == number {
            return it;
        }
    }
    throw SqrtError.noRoot("No root")
}

do {
    print(try mySqrt(9))
} catch SqrtError.outOfBounds(let message) {
    print(message);
} catch SqrtError.noRoot(let message) {
    print(message)
}

/// Day 9
/// Link: https://www.hackingwithswift.com/100/swiftui/9

/// Variable build from function called "closure"
/// It takes a name String as parameter and returns String
/// Closure starts at the `in` keyword if there is arguments
let hello = { (name: String) -> Void in
    print("Hello \(name)")
}

hello("Alexis")

// Passing function to a variable
func amIMajor(at age: Int) -> Bool {
    if age < 18 {
        return false
    } else {
        return true
    }
}

let majorCopy: (Int) -> Bool = amIMajor

print(majorCopy(18))

// Closure as an argument
let group = ["Seth", "John", "Jen", "Korey"]

/// Swift knows that [name1] and b are Strings and the function returns a bool because of code. Therefore, not needed.
/// Swift also knows that it is the first and last parameter, so remove the armument
/// Finally, we could replace name1 and name2 by $0 and $1, respectively
let sortedGroup = group.sorted {
    if $0 == "John" {
        return true
    } else if $1 == "John" {
        return false
    } else {
        return $0 < $1
    }
}

print(sortedGroup)

// Trailing closure and short sythax

/// Will uppercase every word one by one
let uppercasedGroup = group.map { $0.uppercased() }

// Passing functions as parameters

func showArray(_ array: Array<Int>, using apply: (Int) -> Int) -> Void {
    for (element) in array {
        print(apply(element))
    }
}

showArray([1,2,3,4,5,6,7,8,9,0]) {
    return $0 % 2
}

// Checkpoint
let numbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let luckyNumbers = numbers
    .filter {
        if $0 % 2 == 0 {
            return false
        } else {
            return true
        }
    }
    .sorted()
    .map {
        return "\($0) is a lucky number"
    }

luckyNumbers.forEach { print($0) }

/// Day 11
/// Link: https://www.hackingwithswift.com/100/swiftui/11

struct Car {
    init(model: String, wheels: Int, gear: Int = 1) {
        self.model = model
        self.wheels = wheels
        self.gear = gear
    }
    
    let model: String;
    let wheels: Int;
    private var gear: Int = 1;

    mutating func gearDown() -> Int {
        self.gear -= 1
        if self.gear <= 0 {
            self.gear = 1
        }
        return self.gear
    }

    mutating func gearUp() -> Int {
        self.gear += 1
        if self.gear > 10 {
            self.gear = 10
        }
        return self.gear
    }
}

var car = Car(model: "Just a car", wheels: 4)

print(car.gearUp())
