import UIKit

class User {
    var username: String
    
    // Creating a `init?` means the init can fail / return nil
    init?(named username: String) {
        if username.count <= 9 {
            self.username = username
        } else {
            return nil
        }
    }
}

let me = User(named: "Rymfire") // Instance of `User`
let you = User(named: "WandaVision") // nil
