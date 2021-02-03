import UIKit


protocol Object2D {
    var hitbox: Bool { get set }
    mutating func changeHitboxMode()
}

extension Object2D {
    mutating func changeHitboxMode() {
        self.hitbox = !self.hitbox
        print("Hitbox now set to: \(self.hitbox)")
    }
}

struct Box: Object2D {
    var hitbox: Bool
}

var box = Box(hitbox: false)
box.changeHitboxMode()
