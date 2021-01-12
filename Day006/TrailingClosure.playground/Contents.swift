import UIKit

// Here’s our travel() function again. It accepts an action closure so that it can be run between two print() calls:
func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    print(action("London"))
    print("I arrived!")
}

// Because its last parameter is a closure, we can call travel() using trailing closure syntax like this:
travel() { (location: String) -> String in
    return "I'm driving to \(location) in my car"
}

// In fact, because there aren’t any other parameters, we can eliminate the parentheses entirely:
travel { (location: String) -> String in
    return "I'm driving to \(location) in my car"
}

// Swift knows the parameter to that closure must be a string, so we can remove it. It also knows the closure must return a string, so we can remove that. As the closure only has one line of code that must be the one that returns the value, so Swift lets us remove the return keyword too. Swift has a shorthand syntax that lets you go even shorter. Rather than writing location in we can let Swift provide automatic names for the closure’s parameters. These are named with a dollar sign, then a number counting from 0.
travel {
    "I'm driving to \($0) in my car"
}
