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
    
    @IBOutlet weak var Phone: UITextField!
    
    var DishesName:String!
    var Price:Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference().child("Restaurants").child("NVayeSmP3OR9RsKbYw0zMNZt11J3").child("Orders")
        ClientName.delegate = self
        ClientAddress.delegate = self
        CardNumber.delegate = self
        Password.delegate = self
        Phone.delegate = self
        Requirement.delegate = self
    }
  
    func getTimeString() -> String{
        
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        let year = components.year
        let month = components.month
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        let second = components.second
        
        let today_string = String(day!)  + "/" + String(month!) + "/" + String(year!) + " " + String(hour!)  + ":" + String(minute!) + ":" +  String(second!)
        
        return today_string
        
    }

    
    @IBAction func Submit(_ sender: Any) {
        let time = getTimeString()
        let message = [
            "Address" : ClientAddress.text!,
            "Customer" : ClientName.text!,
            "Food" : DishesName,
            "Phone" : Int(Phone.text!),
            "Price": Price,
            "Requirement": Requirement.text!,
            "Serial": 10007584,
            "Status":0,
            "Time":time
        ] as [String:Any]
        ref?.childByAutoId().setValue(message)
    }
    
    
}
extension SubmitViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField:UITextField) ->Bool{
        textField.resignFirstResponder()
        return true
    }
}
