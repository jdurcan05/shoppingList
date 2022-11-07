//
//  WackyCell.swift
//  shoppingList
//
//  Created by JAMES DURCAN on 11/1/22.
//

import Foundation
import UIKit

class WackyCell: UITableViewCell{
    
    var shopper: ShoppingItem?
    var counter: Int?
    @IBOutlet weak var itemOutlet: UILabel!
    @IBOutlet weak var areaOutlet: UILabel!
    @IBOutlet weak var finishedButton: UIButton!
    @IBOutlet weak var checkMarkOutlet: UIImageView!
    
    func configure (inShop: ShoppingItem, inCounter: Int){
        shopper = inShop
        itemOutlet.text = shopper!.title
        areaOutlet.text = "\(shopper!.place)"
        counter = inCounter
        
        if shopper!.bought{
            print(shopper!.title)
            checkMarkOutlet.image = UIImage(named: "CHECKMARK")
        }
    }

    
    @IBAction func boughtButton(_ sender: UIButton) {
        AppData.shoppingList[counter!].bought = true
    }
}
