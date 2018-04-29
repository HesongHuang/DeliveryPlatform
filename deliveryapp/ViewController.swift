//
//  ViewController.swift
//  deliveryapp
//
//  Created by Hesong Huang on 2018/4/8.
//  Copyright © 2018年 Hesong Huang. All rights reserved.
//

import UIKit
import FirebaseDatabase
var myIndex = 0
var postData = [Dishes]()
import FirebaseAuth
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func Logout(_ sender: Any) {
        try!Auth.auth().signOut()
        performSegue(withIdentifier: "segue2", sender: self)
    }
    var ref: DatabaseReference?
    var databaseHandle:DatabaseHandle?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.rowHeight = 370
        tableView.dataSource = self
        ref = Database.database().reference().child("Dishes")
        ref?.observe(.value, with: {(snapshot:DataSnapshot) in
            var newDishes = [Dishes]()
            for products in snapshot.children{
                let productObject = Dishes(snapshot: products as! DataSnapshot)
                newDishes.append(productObject)
            }
            postData = newDishes
            self.tableView.reloadData()
        })
      
    }

    @IBAction func Refresh(_ sender: Any) {
        ref?.observe(.value, with: {(snapshot:DataSnapshot) in
            var newDishes = [Dishes]()
            for products in snapshot.children{
                let productObject = Dishes(snapshot: products as! DataSnapshot)
                newDishes.append(productObject)
            }
            postData = newDishes
            self.tableView.reloadData()
        })
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "toPay", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue,sender:Any?) {
        if segue.identifier == "toPay" {
            if let guest = segue.destination as? SubmitViewController{
                guest.DishesName = postData[myIndex].ID
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! Tablecell
        let url = URL(string:postData[indexPath.row].image)
        let data = try? Data(contentsOf: url!)
        cell.myImage.image = UIImage(data: data!)
        cell.myLabel.text = postData[indexPath.row].introduction
        return cell
    }
    
}

