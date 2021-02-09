import UIKit

struct AnswerToLife {
    var nb: Int {
        willSet { // Will be triggered right before changing the value
            displayUpdate("Changing the answer to life from \(nb) to \(newValue)")
        }
        
        didSet { // Will be triggered right after changing the value
            displayUpdate("Changed the answer to life from \(oldValue) to \(nb)")
        }
    }
}

func displayUpdate(_ msg: String) {
    print(msg)
}

var answer = AnswerToLife(nb: 42)
answer.nb = 15
