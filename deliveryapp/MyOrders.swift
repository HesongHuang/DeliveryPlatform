//
//  MainPage.swift
//  deliveryapp
//
//  Created by Hesong Huang on 2018/4/29.
//  Copyright © 2018年 Hesong Huang. All rights reserved.
//


import UIKit
var myIndex1 = 0
var postOrders = [Orders]()
import FirebaseDatabase
import FirebaseAuth

class MyOrdersViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var MyOrders: UITableView!
    
    var ref: DatabaseReference?
    var databaseHandle:DatabaseHandle?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        MyOrders.delegate = self
        MyOrders.rowHeight = 370
        MyOrders.dataSource = self
        ref = Database.database().reference().child("Restaurants").child("NVayeSmP3OR9RsKbYw0zMNZt11J3").child("Orders")
        ref?.observe(.value, with: {(snapshot:DataSnapshot) in
            var newOrders = [Orders]()
            for products in snapshot.children{
                let productObject = Orders(snapshot: products as! DataSnapshot)
                newOrders.append(productObject)
            }
            postOrders = newOrders
            self.MyOrders.reloadData()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postOrders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTablecell") as! OrderTablecell
        cell.FoodName.text = postOrders[indexPath.row].Food
        let status = postOrders[indexPath.row].Status
        if status == 0 {
            cell.Status.text = "Your order is confirmed"
        } else
        if status == 1 {
            cell.Status.text = "Your dish is being preparing"
        } else
        if status == 2 {
            cell.Status.text = "Your order is delivering"
        } else
        if status == 3 {
            cell.Status.text = "Your order is delivered"
        }
        return cell
    }
}
