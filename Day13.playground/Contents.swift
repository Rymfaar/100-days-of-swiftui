import UIKit

/// Day 13
/// Link: https://www.hackingwithswift.com/100/swiftui/13

protocol Building {
    var rooms: Int { get }
    var cost: Int { get set }
    var estateAgentName: String { get set }
    
    func sumUp() -> Void
}

class House: Building {
    var rooms: Int = 0
    
    var cost: Int = 0
    
    var estateAgentName: String = ""
    
    init(rooms: Int, cost: Int, agentName: String) {
        self.rooms = rooms
        self.cost = cost
        self.estateAgentName = agentName
    }
    
    func sumUp() {
        print("\(rooms) - \(cost) - \(estateAgentName)")
    }
}

class Office: Building {
    var rooms: Int = 0
    
    var cost: Int
    
    var estateAgentName: String
    
    init(rooms: Int, cost: Int, agentName: String) {
        self.rooms = rooms
        self.cost = cost
        self.estateAgentName = agentName
    }
    
    func sumUp() {
        print("""
        This is a nice office!
        Rooms: \(rooms)
        Cost: \(cost)
        Agent: \(estateAgentName)
        """)
    }
}

let house = House(rooms: 3, cost: 350_000, agentName: "Andreas")

let office = Office(rooms: 25, cost: 2_500_000, agentName: "Theo")

let a = house.sumUp()
print(office.sumUp())

print(a)
