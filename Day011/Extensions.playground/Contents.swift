import UIKit

extension Int {
    func squared() -> Int {
        return self * self
    }
}

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

var a: Int = 42
print(a.squared())
print(a.isEven)
