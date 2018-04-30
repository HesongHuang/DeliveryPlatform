//
//  OrderTabelCell.swift
//  deliveryapp
//
//  Created by Hesong Huang on 2018/4/30.
//  Copyright © 2018年 Hesong Huang. All rights reserved.
//

import UIKit

class OrderTablecell: UITableViewCell {
    
    

    @IBOutlet weak var FoodName: UILabel!
    
    @IBOutlet weak var Status: UILabel!
    
    @IBOutlet weak var OrderPrice: UILabel!
    
    @IBOutlet weak var PlacedTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
