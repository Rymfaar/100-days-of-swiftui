import UIKit

class Person {  }

class Runner: Person {  }

class Skater: Person {
    func cruise() {
        print("Do a kickflip!")
    }
}

let persons = [Runner(), Skater(), Runner(), Skater()]

for person in persons {
    if let skater = person as? Skater {
        skater.cruise()
    }
}
