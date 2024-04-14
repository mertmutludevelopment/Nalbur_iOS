//
//  DeatilProductViewController.swift
//  Nalbur
//
//  Created by MERT MUTLU on 3.04.2024.
//

import Foundation
import UIKit

class DetailProductViewController : UIViewController {
    
    @IBOutlet weak var btnBack: UIBarButtonItem!
    @IBOutlet weak var labelProductName: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var labelProductPrice: UILabel!
    @IBOutlet weak var btnAddBasket: UIButton!
    
    var product:Products?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialize()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)

    }
    private func initialize(){
        
        btnBack.image = UIImage(named: "backbutton")
        
        if let p = product {
            labelProductName.text = p.productName
            labelProductName.font = UIFont.bold(size: 32)
            
            imageProduct.image = UIImage(named: p.productImage!)
            
            labelProductPrice.text = "\(p.productPrice!) ₺"
            labelProductPrice.font = UIFont.regular(size: 24)
            
            btnAddBasket.setTitle("Add Basket ", for: .normal)
            btnAddBasket.setTitleColor(UIColor.white, for: .normal)
            btnAddBasket.backgroundColor = UIColor(hex: "#4D0DD0")
            btnAddBasket.layer.borderWidth = 0.5
            btnAddBasket.layer.cornerRadius = 20.0
            
        }
        
    }
    @IBAction func actionBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionBtnAddBasket(_ sender: Any) {
        if let p = product {
            print("\(p.productName!) Detaydan eklendi")

        }
    }
}
