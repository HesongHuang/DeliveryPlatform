//
//  Dishes.swift
//  deliveryapp
//
//  Created by Hesong Huang on 2018/4/14.
//  Copyright © 2018年 Hesong Huang. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Info{
    let Address:String!
    let Email:String!
    let Name: String!
    let Phone:String!
    let itemRef: DatabaseReference?
    init(Address:String,Email:String,Name:String,Phone:String)
    {
        self.Address = Address
        self.Email = Email
        self.Name = Name
        self.Phone = Phone
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
        if let CustomerEmail = snapshotValue?["Email"] as? String
        {
            Email = CustomerEmail
        }else
        {
            Email  = ""
        }
        if let CustomerName = snapshotValue?["Name"] as? String
        {
            Name = CustomerName
        }else
        {
            Name = ""
        }
        if let CustomerPhone = snapshotValue?["Phone"] as? String
        {
           Phone = CustomerPhone
        }else
        {
            Phone = ""
        }
    }
    
}

