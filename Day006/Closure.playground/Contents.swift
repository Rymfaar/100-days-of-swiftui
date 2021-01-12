import UIKit

let hello = {
    print("Hello world!")
}
let driving = { (place: String) in
    print("I'm driving to \(place)")
}
let drivingWithReturn = { (place: String) -> String in
    return "I'm driving to \(place)"
}
let boarding = { (location: String) in
    print("The plane to \(location) is now boarding")
}
let message: String = drivingWithReturn("Sanctum Sanctorum")

func airport(action: (String) -> Void) {
    let locations: Array = ["Paris", "New York", "Berlin", "Sidney"]
    
    for location in locations {
        action(location)
    }
}


hello()
driving("Stark Tower")
print(message)
airport(action: boarding)

