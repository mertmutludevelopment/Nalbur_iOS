//
//  ProductCell.swift
//  Nalbur
//
//  Created by MERT MUTLU on 3.04.2024.
//

import UIKit

protocol CellProtocol{
    func btnClckAddBasket(indexPath:IndexPath)
    
}

class ProductCell: UITableViewCell {

    @IBOutlet weak var cellBackground: UIView!
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var stackViewProduct: UIStackView!
    @IBOutlet weak var labelProductName: UILabel!
    @IBOutlet weak var labelProductPrice: UILabel!
    @IBOutlet weak var btnAddBasket: UIButton!
    
    var cellProtocol : CellProtocol?
    var indexPath : IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
   
    @IBAction func actionBtnAddBasket(_ sender: Any) {
        cellProtocol?.btnClckAddBasket(indexPath: indexPath!)
    }
    
    
}
