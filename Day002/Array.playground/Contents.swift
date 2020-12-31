import UIKit

// ARRAY – Can contain any type of the same data type
let jen:String = "Jen Ledger"
let john:String = "John Cooper"
let korey:String = "Korey Cooper"
let seth:String = "Seth Morrison"
let skillet:[String] = [jen, john, korey, seth] // String array
skillet[1] // Access rank 1 value
var names = [String]() // Create empty array
var _names = Array<String>() // Same

// If you need a collection of values that can contain duplicates, or the order of your items matters, you should use an array:
let friends:[String] = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
