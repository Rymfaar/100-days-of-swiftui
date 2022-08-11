import UIKit

func randomElementInArray(_ array: [Int]?) -> Int {
    return array?.randomElement() ?? Int.random(in: 1...100)
}

print(randomElementInArray([]))
print(randomElementInArray(nil))
print(randomElementInArray([1,2,3,4,5]))

var names: [String]? = ["Mario", "Luigi", "Wario", "Waluigi"]

func handlingOptionalValues() -> Void {
    if let unwrappedNames = names {
        print(unwrappedNames)
    } else {
        print("Error")
    }

    guard let unwrappedNames = names else {
        print("Error")
        return
    }

    print(names?[0] ?? "Error")
}
