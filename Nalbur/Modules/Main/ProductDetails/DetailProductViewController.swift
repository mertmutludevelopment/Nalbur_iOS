//
//  DeatilProductViewController.swift
//  Nalbur
//
//

import Foundation
import UIKit

class DetailProductViewController : UIViewController {
    
    @IBOutlet private weak var btnBack: UIBarButtonItem!
    @IBOutlet private weak var labelProductName: UILabel!
    @IBOutlet private weak var imageProduct: UIImageView!
    @IBOutlet private weak var labelProductPrice: UILabel!
    @IBOutlet private weak var btnAddBasket: UIButton!
    
    var product:Products?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialize()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
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
    @IBAction private func actionBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func actionBtnAddBasket(_ sender: Any) {
        if let p = product {
            print("\(p.productName!) Detaydan eklendi")

        }
    }
}
