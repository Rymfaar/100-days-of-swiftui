import UIKit

protocol Identifiable {
    var name: String? { get set }
    func login()
    // func logout()
}

class User: Identifiable {
    var age: Int?
    var name: String?
    
    init(named name: String? = nil) {
        self.age = nil
        self.name = name
    }
    
    func login() {
        guard let unwrapped = self.name else {
            print("Missing name")
            return
        }
        print("User logged in is \(unwrapped.uppercased())")
    }
}

var me = User(named: "Rym")
me.age = 42
me.login()
