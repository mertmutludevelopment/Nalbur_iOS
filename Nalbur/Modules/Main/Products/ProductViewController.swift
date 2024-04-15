//
//  MainViewController.swift
//  Nalbur
//
//

import Foundation
import UIKit

class ProductViewController : UIViewController , UITabBarControllerDelegate{
    
    
    @IBOutlet private weak var productsTableView: UITableView!
    @IBOutlet private weak var topView: UIView!
    
    private var producList = [Products]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
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
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PVCtoDPVC" {
            if let destinationVC = segue.destination as? DetailProductViewController,
               let product = sender as? Products {
                destinationVC.product = product
            }
        }
    }

    
    
    private func initialize(){
       
        
        self.title = "main.navbar.title.text".localized
        topView.backgroundColor = UIColor(hex: "#4D0DD0")
        
        productsTableView.delegate = self
        productsTableView.dataSource = self
        
        let p1 = Products(id:1, productName: "cable-roll" , productImage: "cable-roll" , productPrice: 600)
        let p2 = Products(id:2, productName: "drill" , productImage: "drill" , productPrice: 1200)
        let p3 = Products(id:3, productName: "hammer" , productImage: "hammer" , productPrice: 120)
        let p4 = Products(id:4, productName: "meter" , productImage: "meter" , productPrice: 65)
        let p5 = Products(id:5, productName: "nail" , productImage: "nail" , productPrice: 35)
        let p6 = Products(id:6, productName: "screwdriver" , productImage: "screwdriver" , productPrice: 20)
        
        producList.append(p1)
        producList.append(p2)
        producList.append(p3)
        producList.append(p4)
        producList.append(p5)
        producList.append(p6)

        productsTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
    }
}


extension ProductViewController : UITableViewDelegate , UITableViewDataSource ,CellProtocol{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return producList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = producList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productsCell") as! ProductCell
        
        cell.selectionStyle = .none
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        cell.imageProduct.image = UIImage(named: product.productImage!)
        cell.labelProductName.text = product.productName
        cell.labelProductPrice.text = "\(product.productPrice!) ₺"
        
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        cell.cellBackground.backgroundColor = UIColor.white
        cell.cellBackground.layer.cornerRadius = 10.0
        
        cell.imageProduct.backgroundColor = UIColor.clear
        
        cell.stackViewProduct.backgroundColor = UIColor.clear
        
        cell.labelProductName.font = UIFont.bold(size: 20)
        
        cell.labelProductPrice.font = UIFont.regular(size: 16)
        
        cell.btnAddBasket.setTitle("Add Basket", for: .normal)
        cell.btnAddBasket.setTitleColor(UIColor.white, for: .normal)
        cell.btnAddBasket.backgroundColor = UIColor(hex: "#4D0DD0")
        cell.btnAddBasket.layer.borderWidth = 0.5
        cell.btnAddBasket.layer.cornerRadius = 10.0

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
        let product = producList[indexPath.row]
        performSegue(withIdentifier: "PVCtoDPVC", sender: product)
        
    }
    
    func btnClckAddBasket(indexPath: IndexPath) {
        let product = producList[indexPath.row]
        print("\(product.productName!) added to basket")
    }
}
