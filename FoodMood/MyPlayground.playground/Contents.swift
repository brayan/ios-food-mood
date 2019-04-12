import UIKit

// Playground
var name = "Brayan"
let project: String = "FoodMood"

name = "Else"

print(name)

func helloCalories() {
    print("Hello")
}

helloCalories()
helloCalories()
helloCalories()

func add(name: String, calories: Double) {
    print("Adding \(name) with \(calories)")
}

add(name: "Brayan", calories: 350.6)


let totalCalories = [50.5, 100, 300, 500]
print(totalCalories)

for i in 0...3 {
    print(totalCalories[i])
}

// for is inclusive: from 0 to 5
for i in 0...totalCalories.count {
    //print(calories[i])
}

for calories in totalCalories {
    print(calories)
}

let emptyArray: Array<Double> = []


func allColories(calories: Array<Double>) -> Double {
    var total: Double = 0
    for c in calories {
        total += c
    }
    return total
}

allColories(calories: [10.5, 100, 300, 500])

var values = [1, 2]


class Meal {
    var happiness: Int
    var name: String
    var items = Array<Item>()
    
    // Good Citizen: Init all the dependencies with a constructor
    init(name: String, happiness: Int) {
        self.name = name
        self.happiness = happiness
    }
    
    func allCalories() -> Double {
        var total = 0.0
        for i in items {
            total += i.calories
        }
        return total
    }
}

class Item {
    var name: String
    var calories: Double
    
    init(name: String, calories: Double) {
        self.name = name
        self.calories = calories
    }
}

// Optionals: ?(doesn't crash when nil) and !(crash when nil)

let brownie = Meal(name: "Brownie", happiness: 5)

let item1 = Item(name: "brownie", calories: 115)
let item2 = Item(name: "vegan cream", calories: 40)
brownie.items.append(item1)
brownie.items.append(item2)

//brownie.name = Optional("asdf")
print(brownie.allCalories())

/*if let name = brownie.name {
    print("Name: \(name)")
} else {
    print("Name is empty!")
}*/

if brownie.name != nil {
    
}

let optionalInt: Int? = Int("5")
