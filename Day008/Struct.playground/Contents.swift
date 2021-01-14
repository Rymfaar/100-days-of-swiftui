import UIKit

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
