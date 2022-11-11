//
//  ViewController.swift
//  shoppingList
//
//  Created by JAMES DURCAN on 10/31/22.
//

import UIKit

class AppData{
    static var shoppingList = [ShoppingItem]()
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var newItemOutlet: UITextField!
    @IBOutlet weak var sectionOutlet: UISegmentedControl!
    @IBOutlet weak var addButtonOutlet: UIButton!
    var sectionChoice = ShoppingItem.area.deli
    let encoder = JSONEncoder()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        if let items = UserDefaults.standard.data(forKey: "myList") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ShoppingItem].self, from: items) {
                AppData.shoppingList = decoded
            }
        }
        }
        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.shoppingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "theCell") as! WackyCell
        cell.configure(inShop: AppData.shoppingList[indexPath.row], inCounter: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            AppData.shoppingList.remove(at: indexPath.row)
            if let encoded = try? encoder.encode(AppData.shoppingList) {
                UserDefaults.standard.set(encoded, forKey: "myList")
                print("save")
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
        
    }
    
    
    @IBAction func buyButton(_ sender: UIButton) {
        print("buy")
        for i in 0..<AppData.shoppingList.count{
            print("\(i) \(AppData.shoppingList[i].bought)")
        }
        myTableView.reloadData()
        if let encoded = try? encoder.encode(AppData.shoppingList) {
            UserDefaults.standard.set(encoded, forKey: "myList")
            print("save")
        }
        
    }
    
    
    
    @IBAction func segmentedControllerChange(_ sender: UISegmentedControl) {
        let select = sender.selectedSegmentIndex
        switch select {
        case 0: sectionChoice = .deli
        case 1: sectionChoice = .produce
        case 2: sectionChoice = .grains
        case 3: sectionChoice = .freezer
        default: sectionChoice = .deli
        }
        print (sectionChoice)
    }
    
    
    
    
    
    @IBAction func addButtonOutlet(_ sender: Any){
        var add = true
        if let texter = newItemOutlet.text{
            for i in 0..<AppData.shoppingList.count {
                if AppData.shoppingList[i].title.lowercased() == texter.lowercased(){
                    let alert = UIAlertController(title: "Hey!", message: "You have already added this!", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    add = false
                }
            }
            if add{
                AppData.shoppingList.append(ShoppingItem(title: texter, place: sectionChoice))
                myTableView.reloadData()
                if let encoded = try? encoder.encode(AppData.shoppingList) {
                    UserDefaults.standard.set(encoded, forKey: "myList")
                    print("save")
                }
                print("add")
                for i in 0..<AppData.shoppingList.count{
                    print("\(i) + \(AppData.shoppingList[i].bought)")
                }

            }
        }
        else{
            let alert = UIAlertController(title: "Please", message: "Enter something in the new bar", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    }
    
