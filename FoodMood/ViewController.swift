import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField2: UITextField!
    @IBOutlet weak var happinessField: UITextField!
    
    @IBAction func onClickAdd() {
        let name = nameField2.text
        let happiness = happinessField.text
        print("eaten \(name) with happiness \(happiness)!")
    }

}
