import UIKit

protocol Payable {
    func pay() -> Int
}

protocol NeedsTraining {
    func train()
}

protocol HasVacation {
    func takeVacation(for duration: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation {  }
