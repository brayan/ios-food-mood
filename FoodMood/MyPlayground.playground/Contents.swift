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
