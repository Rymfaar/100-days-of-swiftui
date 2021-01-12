import UIKit

enum PasswordError: Error {
    case obvious
}

func displayHelp() {
    let message: String = """
    Welcome to MyApp!

    Run this app inside a directory of images and
    MyApp will resize them all into thumbnails
    """
    
    print(message)
}

func square(number: Int) {
    print(number * number)
}

func addOne(to: Int) -> Int {
    return to + 1
}

func sayHello(to name: String) {
    print("Hello \(name)!")
}

func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
    
}

func add(numbers: Int...) -> Int {
    var result: Int = 0
    
    for number in numbers {
        result += number
    }
    return result
}

func setPassword(to password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}

func double(number: inout Int) {
    number *= 2
}

displayHelp()
square(number: 2)
print(addOne(to: 41))
sayHello(to: "Rymfire")
greet("Gryms", nicely: false)
print(add(numbers: 15,15,10,1,1))
do {
    try setPassword(to: "password")
    print("That password is good!")
} catch {
    print("You can't use that password!")
}
var a: Int = 2
double(number: &a) // Passing `a` as a pointer
print(a)
