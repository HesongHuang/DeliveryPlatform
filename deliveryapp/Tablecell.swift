//
//  Tablecell.swift
//  deliveryapp
//
//  Created by Hesong Huang on 2018/4/14.
//  Copyright © 2018年 Hesong Huang. All rights reserved.
//

import UIKit

class Tablecell: UITableViewCell {
    
   

    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
