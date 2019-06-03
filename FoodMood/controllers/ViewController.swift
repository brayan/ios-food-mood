import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {
    
    @IBOutlet weak var nameField2: UITextField!
    @IBOutlet weak var happinessField: UITextField!
    var delegate: MealsTableViewController?
    var selected = Array<Item>()
    var items = [
        Item(name: "Sushi", calories: 10),
        Item(name: "Sashimi", calories: 10),
        Item(name: "Ceviche", calories: 10),
        Item(name: "Breaded Srimp", calories: 10)
    ]
    @IBOutlet var tableView: UITableView?
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "New Item", style: UIBarButtonItem.Style.plain, target: self, action: #selector(showNewItem))
        
        navigationItem.rightBarButtonItem = newItemButton
    }
    
    @objc func showNewItem() {
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        } else {
            Alert(controller: self).show()
        }
    }
    
    func add(_ item: Item) {
        items.append(item)
        if let table = tableView {
            table.reloadData()
        } else {
            Alert(controller: self).show(message: "Unable to update the table")
        }
    }
    
    @IBAction func onClickAdd() {
        if let meal = getMealFromForm() {
            if let meals = delegate {
                meals.add(meal)
                if let navigation = navigationController {
                    navigation.popViewController(animated: true)
                } else {
                    Alert(controller: self).show(message: "Unable to go back, but the meal was added.")
                }
                return
            }
        }
        Alert(controller: self).show()
    }
    
    private func getMealFromForm() -> Meal? {
        if let name: String = nameField2?.text {
            if let happiness = convertToInt(happinessField?.text) {
                
                let meal = Meal(name: name, happiness: happiness, items: selected)
                print("eaten \(meal.name) with happiness \(meal.happiness) with \(meal.items)!")
                
                return meal
            }
        }
        
        return nil
    }
    
    private func convertToInt(_ text: String?) -> Int? {
        if let number = text {
            return Int(number)
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = item.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if (cell.accessoryType == UITableViewCell.AccessoryType.none) {
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
                let item = items[indexPath.row]
                selected.append(item)
            } else {
                cell.accessoryType = UITableViewCell.AccessoryType.none
                let item = items[indexPath.row]
                if let position = selected.firstIndex(of: item) {
                    selected.remove(at: position)
                } else {
                    Alert(controller: self).show()
                }
            }
        } else {
            Alert(controller: self).show()
        }
    }

}
