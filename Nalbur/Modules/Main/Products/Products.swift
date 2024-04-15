//
//  Products.swift
//  Nalbur
//
//  Created by MERT MUTLU on 3.04.2024.
//

import Foundation


class Products {
    
    var id:Int?
    var productName:String?
    var productImage:String?
    var productPrice:Int?
    
    init(id: Int , productName: String, productImage: String, productPrice: Int) {
        self.id = id
        self.productName = productName
        self.productImage = productImage
        self.productPrice = productPrice
    }
    
}
