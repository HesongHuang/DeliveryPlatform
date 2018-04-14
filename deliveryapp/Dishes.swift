//
//  Dishes.swift
//  deliveryapp
//
//  Created by Hesong Huang on 2018/4/14.
//  Copyright © 2018年 Hesong Huang. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Dishes{
   
    let image:String!
    let image1:String!
    let price: String!
    let introduction:String!
    let itemRef: DatabaseReference?
    init(image:String,image1:String,price:String,introduction:String)
    {
        self.image = image
        self.image1 = image1
        self.price = price
        self.introduction = introduction
        self.itemRef = nil
    }
    init (snapshot:DataSnapshot)
    {
        itemRef = snapshot.ref
        let snapshotValue = snapshot.value as? NSDictionary
        if let productImage = snapshotValue?["image"] as? String
        {
            image = productImage
        }else
        {
            image = ""
        }
        if let productImage1 = snapshotValue?["image1"] as? String
        {
            image1 = productImage1
        }else
        {
            image1 = ""
        }
        if let productIntroduction = snapshotValue?["introduction"] as? String
        {
            introduction = productIntroduction
        }else
        {
            introduction = ""
        }
        if let productPrice = snapshotValue?["price"] as? String
        {
            price = productPrice
        }else
        {
            price = ""
        }
        
    }
    func toAnyObject() -> Any {
        return ["image":image,"image1":image1,"price":price,"introduction":introduction]
    }
}
