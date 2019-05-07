import UIKit

class MealsTableViewController : UITableViewController, AddMealDelegate {
    
    var meals = [Meal(name: "Sashimi", happiness: 4),
                 Meal(name: "Ceviche", happiness: 5)]
    
    func add(_ meal: Meal) {
        meals.append(meal)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addMeal") {
            let view = segue.destination as! ViewController
            view.delegate = self
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel?.text = meal.name
        
        return cell
    }
    
    func myFunc(externalParamName internalParamName: String) {
        
    }
    
    
}
