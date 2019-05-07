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
        }
    }
    
    func add(_ item: Item) {
        items.append(item)
        if let table = tableView {
            table.reloadData()
        }
    }
    
    @IBAction func onClickAdd() {
        let name: String = nameField2.text!
        if let happiness = Int(happinessField.text!) {
            let meal = Meal(name: name, happiness: happiness, items: selected)
            print("eaten \(meal.name) with happiness \(meal.happiness) with \(meal.items)!")
            
            if (delegate == nil) {
                return
            }
            
            delegate!.add(meal)
            
            if let navigation = navigationController {
                navigation.popViewController(animated: true)
            }
            
        }
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
                }
            }
        }
    }

}
