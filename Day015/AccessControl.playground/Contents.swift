import UIKit

class Warrior {
    // If you want to use “file private” access control, just write it as one word like so: `fileprivate`.
    private var name: String?
    
    init(named name: String? = nil) {
        self.name = name ?? "Unknown"
    }
}

var thrall = Warrior()

