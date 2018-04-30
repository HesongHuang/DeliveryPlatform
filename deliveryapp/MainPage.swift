//
//  MainPage.swift
//  deliveryapp
//
//  Created by Hesong Huang on 2018/4/30.
//  Copyright © 2018年 Hesong Huang. All rights reserved.
//


import UIKit
import FirebaseDatabase
import FirebaseAuth
class MainPageViewController: UIViewController {
    

    
    
    @IBAction func LogOutMain(_ sender: Any) {
        try!Auth.auth().signOut()
        performSegue(withIdentifier: "segue3", sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }
    
}

