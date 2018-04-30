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
    let Flavor:String!
    let image:String!
    let price: Double!
    let ingredient:String!
    let Name: String!
    let itemRef: DatabaseReference?
    init(Flavor:String,image:String,price:Double,ingredient:String,Name:String)
    {
        self.Flavor = Flavor
        self.image = image
        self.price = price
        self.ingredient = ingredient
        self.itemRef = nil
        self.Name = Name
    }
    init (snapshot:DataSnapshot)
    {
        itemRef = snapshot.ref
        let snapshotValue = snapshot.value as? NSDictionary
        if let DishesFlavor = snapshotValue?["Flavor"] as? String
        {
            Flavor = DishesFlavor
        }else
        {
            Flavor = ""
        }
        if let productImage = snapshotValue?["Image"] as? String
        {
            image = productImage
        }else
        {
            image = ""
        }
        if let productingredient = snapshotValue?["Ingredient"] as? String
        {
            ingredient = productingredient
        }else
        {
            ingredient = ""
        }
        if let DishesPrice = snapshotValue?["Price"] as? Double
        {
            price = DishesPrice
        }else
        {
            price = 0
        }
        if let productName = snapshotValue?["Name"] as? String
        {
            Name = productName
        }else
        {
            Name = ""
        }
    }
}
