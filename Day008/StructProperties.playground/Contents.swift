import UIKit

struct Movie {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
}

struct Character {
    // stored properties
    var name: String
    var age: Int {
        willSet {
            print("Tomorrow's \(name)'s birthday")
        }
        didSet {
            print("Today's \(name)'s birthday! \(name) is \(age) years old now")
        }
    }
    lazy var bestMovie = Movie("Avengers") // Lazy attributes are created at first mention (not at instance creation)
    var isFemale: Bool
    // computed properties
    var sexStatus: String {
        if isFemale == true {
            return "\(name) is a female"
        } else {
            return "\(name) is a male"
        }
    }
    
    mutating func happyBirthday() -> Int {
        age += 1
        return age
    }
}

var me = Character(name: "Rymfire", age: 0, isFemale: false)

me.name = "Rym"
print(me.name)
print(me.sexStatus)
me.happyBirthday()
me.happyBirthday()
print(me.bestMovie.name)
