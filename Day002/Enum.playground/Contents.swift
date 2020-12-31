import UIKit

// ENUM – grouping related values to use them without spelling mistakes
enum Result {
    case success
    case failure
}
let result:Result = Result.failure // Assign enum value

// Enum can associate more data to each value for more information
enum Activity {
    case bored
    case running(destination: String)
    case talking(to: String)
    case playing(what: String)
}
let activity:Activity = Activity.playing(what: "ESO")

// Enum can associate raw value to each enum value
enum Planet: Int {
    case mercury
    case venus = 3
    case earth
    case mars
}
let mercury = Planet(rawValue: 0)
let earth = Planet(rawValue: 4)
