import UIKit

let result = travel()

func travel() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

result("London")
result("London")
result("London")
result("London")
result("London")
travel()("London")

// I don't understand why `travel("London")` doesn't work...
