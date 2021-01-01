import UIKit


// TERNARY
let isStarkDead: Bool = false
let levelOfLove: Int = isStarkDead == true ? 4000 : 3000

print(levelOfLove == 4000 ? "Daddy is dead" : "I love you \(levelOfLove)")
