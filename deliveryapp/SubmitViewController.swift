//
//  SubmitPage.swift
//  deliveryapp
//
//  Created by Hesong Huang on 2018/4/10.
//  Copyright © 2018年 Hesong Huang. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class SubmitViewController: UIViewController{
    
    var ref:DatabaseReference?
    
    @IBOutlet weak var ClientName: UITextField!
    
    @IBOutlet weak var ClientAddress: UITextField!
    
    @IBOutlet weak var CardNumber: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var Requirement: UITextField!
    
    var DishesName:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        ClientName.delegate = self
        ClientAddress.delegate = self
        CardNumber.delegate = self
        Password.delegate = self
        Requirement.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
  
    @IBAction func Submit(_ sender: Any) {
        ref?.child("Order").child("UserName").setValue(ClientName.text!)
        ref?.child("Order").child("Address").setValue(ClientAddress.text!)
        ref?.child("Order").child("CardNumber").setValue(CardNumber.text!)
        ref?.child("Order").child("Password").setValue(ClientName.text!)
        ref?.child("Order").child("Requirement").setValue(Requirement.text!)
        ref?.child("Order").child("ID").setValue(DishesName)
    }
    
    
}
extension SubmitViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField:UITextField) ->Bool{
        textField.resignFirstResponder()
        return true
    }
}
