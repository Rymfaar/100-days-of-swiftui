import UIKit

// SET - Can contain any type of the same data type
// Sets are unordered
// Sets ignores duplicates
let colors = Set(["red", "blue", "green"]) // String set
let _colors = Set(["red", "blue", "green", "blue", "green"]) // Duplicated items are ignored
var id = Set<Int>() // Create empty set

// If you need a collection of values that must be unique or you need to be able to check whether a specific item is in there extremely quickly, you should use a set:
let brand:Set = Set(["Apple", "Samsung", "Google", "OnePlus", "Microsoft"])
