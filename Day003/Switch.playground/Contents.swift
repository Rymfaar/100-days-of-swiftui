import UIKit


enum Weather {
    case rain
    case sunny
    case snow
    case windy
}

let paris = Weather.rain

switch paris {
case Weather.rain:
    print("Bring an umbrella!")
case Weather.snow:
    print("Wrap up warm!")
case Weather.sunny:
    print("Wear sunglasses!")
default:
    print("Have a nice day!")
}
// Swift will only run the code inside each case. If you want execution to continue on to the next case, use the fallthrough keyword
