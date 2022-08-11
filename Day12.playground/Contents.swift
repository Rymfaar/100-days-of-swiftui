import UIKit

/// Day 12
/// Link: https://www.hackingwithswift.com/100/swiftui/12

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    override init(legs: Int) {
        super.init(legs: legs)
    }
    
    func speak() -> Void {
        print("Bark bark!")
    }
}

class Cat: Animal {
    let isTamed: Bool

    init(legs: Int, isTamed: Bool) {
        self.isTamed = isTamed
        super.init(legs: legs)
    }
    
    func speak() -> Void {
        print("Moew moew!")
    }
}

class Corgi: Dog {
    override init(legs: Int) {
        super.init(legs: legs)
    }
}

class Poodle: Dog {
    override init(legs: Int) {
        super.init(legs: legs)
    }
}

class Persian: Cat {
    init(legs: Int) {
        super.init(legs: legs, isTamed: true)
    }
}

class Lion: Cat {
    init(legs: Int) {
        super.init(legs: legs, isTamed: false)
    }
}
