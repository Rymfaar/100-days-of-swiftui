import UIKit

let skillet = ["John", "Jen", "Korey", "Seth"]

// When that code is run, Swift will check whether `b` has a value, and if it’s `nil` the rest of the line will be ignored – Swift will return `nil` immediately. But if it has a value, it will be unwrapped and execution will continue.
skillet.first?.uppercased()
