import UIKit

enum LoginError: Error {
    case accountDoesntExist
}

func login(using account: String, password: String) throws -> Bool {
    if account == "@Rymfire" {
        if password == "born2code" {
            return true
        } else {
            return false
        }
    } else {
        throw LoginError.accountDoesntExist
    }
}

// Using `try?` changes throwing functions into functions that return an optional. If the function throws an error you’ll be sent `nil` as the result, otherwise you’ll get the return value wrapped as an optional.

if let result = try? login(using: "@NotRymfire", password: "born2code") {
    print("Result was \(result)")
} else {
    print("Meh!")
}

// The other alternative is `try!`, which you can use when you know for sure that the function will not fail. If the function does throw an error, your code will crash.
