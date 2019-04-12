import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField2: UITextField!
    @IBOutlet weak var happinessField: UITextField!
    
    @IBAction func onClickAdd() {
        let name: String = nameField2.text!
        if let happiness = Int(happinessField.text!) {
            let meal = Meal(name: name, happiness: happiness)
            print("eaten \(meal.name) with happiness \(meal.happiness)!")
        }
       
    }

}
