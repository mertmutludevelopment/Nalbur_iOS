//
//  DeatilProductViewController.swift
//  Nalbur
//
//  Created by MERT MUTLU on 3.04.2024.
//

import Foundation
import UIKit

class DetailProductViewController : UIViewController {
    
    @IBOutlet weak var labelProductName: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var labelProductPrice: UILabel!
    @IBOutlet weak var btnAddToBasket: UIButton!
    
    var product:Products?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialize()
    }
    private func initialize(){
        
        
    }
}
