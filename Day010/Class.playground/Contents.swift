import UIKit

enum Race: String {
    case Elv = "Elv"
    case Orc = "Orc"
    case Dwarf = "Dwarf"
    case Human = "Human"
}

enum Role {
    case DamageDealer
    case Tank
    case Healer
    case Buffer
}

class Character {
    let name: String // This way, this constant cannot be changed after initialisation
    var race: Race
    var archetype: Role

    init(_ name: String, race: Race = Race.Human, archetype: Role) {
        self.name = name
        self.race = race
        self.archetype = archetype
        print("\(self.name) (\(self.race)) is born!")
    }
    
    deinit {
        print("\(self.name) passed away!")
    }
    
    func action() {
        print("ATTACK !")
    }
}

// Swift gives us a final keyword just for this purpose: when you declare a class as being final, no other class can inherit from it. This means they can’t override your methods in order to change your behavior – they need to use your class the way it was written.
final class Warrior: Character {
    init(_ name: String, race: Race) {
        // `super.init()` will call parent init
        super.init(name, race: race, archetype: Role.Tank)
    }
    
    deinit {
        print("\(self.name) accessed the Valhallah")
    }
    
    // Method overriding allows us to change the implementation of `action()` for the `Warrior` class.
    override func action() {
        print("CHARGE !")
    }
}

let me = Warrior("Rymfire", race: Race.Orc)
let you = me

print(me.archetype)
me.action()

// The third difference between classes and structs is how they are copied. When you copy a struct, both the original and the copy are different things – changing one won’t change the other. When you copy a class, both the original and the copy point to the same thing, so changing one does change the other.
you.archetype = Role.DamageDealer
print(me.archetype)
