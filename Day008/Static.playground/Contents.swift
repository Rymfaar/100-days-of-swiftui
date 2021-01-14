import UIKit

class Stormtrooper {
    static var nbClones: Int = 0 // property belongs to the struct itself rather than instances of the struct
    private var id: String // private variables cannot be accessed outside of the struct (need init())
    
    init(id: String) {
        self.id = id
        Stormtrooper.nbClones += 1
        print("Stormtrooper \(id) ready for combat!")
    }
}

var a = Stormtrooper(id: "AFE13A1")
var b = Stormtrooper(id: "AFE13A2")
var c = Stormtrooper(id: "AFE13A3")
print(Stormtrooper.nbClones)
