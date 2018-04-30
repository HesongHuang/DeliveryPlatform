//
//  Dishes.swift
//  deliveryapp
//
//  Created by Hesong Huang on 2018/4/14.
//  Copyright © 2018年 Hesong Huang. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Orders{
    let Address:String!
    let Customer:String!
    let Food: String!
    let Phone: Int!
    let Price: Double!
    let Requirement: String!
    let Serial: Int!
    let Status: Int!
    let Time: String!
    let itemRef: DatabaseReference?
    init(Address:String!,Customer:String!,Food: String!,Phone:Int!,Price: Double!,Requirement:String!,Serial: Int!,Status: Int!,Time: String!)
    {
        self.Address = Address
        self.Customer = Customer
        self.Food = Food
        self.Phone = Phone
        self.Price = Price
        self.Requirement = Requirement
        self.Serial = Serial
        self.Status = Status
        self.Time = Time
        self.itemRef = nil
    }
    init (snapshot:DataSnapshot)
    {
        itemRef = snapshot.ref
        let snapshotValue = snapshot.value as? NSDictionary
        if let CustomerAddress = snapshotValue?["Address"] as? String
        {
            Address = CustomerAddress
        }else
        {
            Address = ""
        }
        if let CustomerName = snapshotValue?["Customer"] as? String
        {
            Customer = CustomerName
        }else
        {
            Customer = ""
        }
        if let OrderFood = snapshotValue?["Food"] as? String
        {
            Food = OrderFood
        }else
        {
            Food = ""
        }
        if let CustomerPhone = snapshotValue?["Phone"] as? Int
        {
            Phone = CustomerPhone
        }else
        {
            Phone = 0
        }
        if let CustomerRequirement = snapshotValue?["Requirement"] as? String
        {
           Requirement = CustomerRequirement
        }else
        {
            Requirement = ""
        }
        if let CustomerSerial = snapshotValue?["Serial"] as? Int
        {
            Serial = CustomerSerial
        }else
        {
            Serial = 0
        }
        if let OrderTime = snapshotValue?["Time"] as? String
        {
            Time = OrderTime
        }else
        {
            Time = ""
        }
        if let FoodPrice = snapshotValue?["Price"] as? Double
        {
            Price = FoodPrice
        }else
        {
            Price = 0.0
        }
        if let FoodStatus = snapshotValue?["Status"] as?  Int
        {
            Status = FoodStatus
        }else
        {
            Status = 0
        }
    }
}

