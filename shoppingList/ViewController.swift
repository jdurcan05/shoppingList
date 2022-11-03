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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.shoppingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "theCell") as! WackyCell
        return cell
    }
    
    
    @IBAction func addButtonOutlet(_ sender: Any) {
        
        
    }
    
}

