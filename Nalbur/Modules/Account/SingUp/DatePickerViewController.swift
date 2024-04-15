//
//  DatePickerViewController.swift
//  Nalbur
//
//

import Foundation
import UIKit


class DatePickerViewController  : UIViewController {
    
    @IBOutlet weak var popupView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        self.view.backgroundColor = UIColor.clear
        
        popupView.backgroundColor = UIColor(hex: "#E5D3FC")
        popupView.layer.cornerRadius = 10.0
        popupView.layer.masksToBounds = true
    }
}


