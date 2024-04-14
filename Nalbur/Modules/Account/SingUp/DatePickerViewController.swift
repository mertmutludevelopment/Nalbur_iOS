//
//  DatePickerViewController.swift
//  Nalbur
//
//  Created by MERT MUTLU on 28.02.2024.
//

import Foundation
import UIKit


class DatePickerViewController  : UIViewController {
    
    @IBOutlet weak var popupView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    
    private func initialize(){
        self.view.backgroundColor = UIColor.clear
        
        popupView.backgroundColor = UIColor(hex: "#E5D3FC")
        popupView.layer.cornerRadius = 10.0
        popupView.layer.masksToBounds = true
    }
}


