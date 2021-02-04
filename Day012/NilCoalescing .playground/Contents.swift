import UIKit

func username(for user: Int) -> String? {
    if user < 0 {
        return nil
    } else {
        return "User\(user)"
    }
}

let name: String = username(for: -1) ?? "Anomymous" // If return is nil, attibute "Anonymous"
