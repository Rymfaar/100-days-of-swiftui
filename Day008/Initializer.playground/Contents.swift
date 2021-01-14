import UIKit

struct TwitterAccount {
    var name: String
    var tweets: Int
    
    init(name: String) {
        self.name = name
        tweets = 0
        print("Welcome to Tweeter @\(self.name)!")
    }
}

var me = TwitterAccount(name: "Rymfire")

me.name
me.tweets
