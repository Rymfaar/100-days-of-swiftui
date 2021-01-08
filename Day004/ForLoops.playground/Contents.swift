import UIKit

let countdown = 0...10
let songs = ["Awakening", "White Flag", "Holy Water"]


// LOOP ON RANGE
for nb in countdown {
    print(nb)
}

// To reverse loop, use the `reversed()` method.
for nb in countdown.reversed() {
    print(nb)
}


// LOOP ON ARRAYS
for song in songs {
    print("\(song) is a song from Normandie")
}

// To reverse loop, use the `reversed()` method.
for song in songs.reversed() {
    print("\(song) is a song from Normandie")
}


// LOOP ON RANGE WITHOUT USING ITERATOR
for _ in 15...42 {
    print("Hello world!")
}

// To reverse loop, use the `reversed()` method.
for _ in (15...42).reversed() {
    print("Hello world!")
}
