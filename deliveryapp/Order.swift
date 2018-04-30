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
    let Phone:String!
    let Price: String!
    let Requirement: String!
    let Serial: Int!
    let Status: Int!
    let Time: String!
    let itemRef: DatabaseReference?
    init(Address:String!,Customer:String!,Food: String!,Phone:String!,Price: String!,Requirement:String!,Serial: Int!,Status: Int!,Time: String!)
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
    func toAnyObject() -> Any {
        return ["Address":Address,"Customer":Customer,"Food":Food,"Phone":Phone,"Price":Price,"Requirement":Requirement,"Serial":Serial,"Status":Status,"Time":Time]
    }
}

