import UIKit

// TUPLE – Can store several values together in a single value
// Tuples can’t add or remove items; they are fixed in size
// Tuples can’t change the type of items inside
// Tuples can access items using numerical positions or by naming them
let origin:(x:Int, y:Int) = (x: 0, y: 0) // Double-int tuple
origin.0 // Access value by numerical position
origin.x // Access value by name position

// If you need a specific, fixed collection of related values where each item has a precise position or name, you should use a tuple:
let address:(number:Int, street:String, city:String) = (number: 1, street: "Apple Park Way", city: "Cupertino")
