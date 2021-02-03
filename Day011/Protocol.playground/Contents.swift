import UIKit

protocol Identifiable {
    var id: String { get set }
}

struct Person: Identifiable {
    var id: String
}

struct Animal: Identifiable {
    var id: String
}

func display(thing: Identifiable) {
    print("ID: \(thing.id)")
}

var person = Person(id: "Rymfire")
var animal = Animal(id: "Rex")
display(thing: person)
display(thing: animal)

