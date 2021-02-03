import UIKit

extension Collection {
    func summarize() {
        print("There are \(self.count) items:")
        for elem in self {
            print(elem)
        }
    }
}

let skillet: Array = ["John", "Jen", "Korey", "Seth"]
let normandie: Set = Set(["Philip", "Hakan", "Anton"])

skillet.summarize()
normandie.summarize()
