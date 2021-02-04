import UIKit

let answer: String = "42"
let num = Int(answer)! // Force unwrap optional — will not work if `answer` is nil

print(num)
