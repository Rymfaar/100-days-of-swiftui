import UIKit

// DICTIONNARY – Can contain any type of the same data type accessible with a key of any same type
let avengers:[String: Int] = [
    "Avengers": 2012,
    "Avengers: Age of Ultron": 2015,
    "Avengers: Infinity War": 2018,
    "Avengers: Endgame": 2019,
]
avengers["Avengers: Endgame"] // Access value by key
avengers["Avengers 2", default: -1] // Give default value to unknown key (rather than nil)
var faction = [String: String]() // Create empty dictionnary
var _faction = Dictionary<String, String>() // Same
faction["Rymfire"] = "Horde" // Add new items
