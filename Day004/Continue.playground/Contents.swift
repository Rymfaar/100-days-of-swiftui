import UIKit

// CONTINUE – Used to skip a loop step

for nb in 1...10 {
    if nb % 2 == 1 {
        continue
    }
}

// Continue an upper loop
eureka: for i in 1...10 {
    for j in 1...10 {
        let result: Int = i * j
        if result == 42 {
            print("Eurêka! This is the answer to life itself!")
            continue eureka // Continue the outer loop
        }
        print("\(i) x \(j) = \(result)")
    }
}
