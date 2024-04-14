//
//  PolicyViewController.swift
//  Nalbur
//
//  Created by MERT MUTLU on 20.02.2024.
//

import Foundation
import UIKit

protocol PolicyViewControllerDelegate{
    
    func approvedPolicy()
    
}


class PolicyViewController : UIViewController {
    
    var delegate : PolicyViewControllerDelegate!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var btnPolicyDelete: UIButton!
    @IBOutlet weak var btnPolicyOk: UIButton!
    @IBOutlet weak var lblPolicyDescirption: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
    private func initialize() {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        popupView.backgroundColor = UIColor(hex: "#E5D3FC")
        popupView.layer.cornerRadius = 10.0
        popupView.layer.masksToBounds = true
        
        btnPolicyOk.backgroundColor = UIColor(hex: "#4D0DD0")
        btnPolicyOk.setTitle("policy.btnPolicyOk.title".localized , for: .normal)
        btnPolicyOk.setTitleColor(UIColor.white, for: .normal)
        btnPolicyOk.titleLabel?.font = UIFont.regular()
        btnPolicyOk.layer.borderWidth = 0.15
        btnPolicyOk.layer.cornerRadius = 10.0
        
        
        btnPolicyDelete.backgroundColor = UIColor(hex: "#4D0DD0")
        btnPolicyDelete.setTitle("X", for: .normal)
        btnPolicyDelete.setTitleColor(UIColor.white, for: .normal)
        btnPolicyDelete.titleLabel?.font = UIFont.regular(size: 14)
        btnPolicyDelete.layer.borderWidth = 0.05
        btnPolicyDelete.layer.cornerRadius = 5.0

        lblPolicyDescirption.backgroundColor = UIColor.clear
        lblPolicyDescirption.textAlignment = .center
        lblPolicyDescirption.font = UIFont.regular(size: 18)
        lblPolicyDescirption.text = "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going "
        lblPolicyDescirption.adjustsFontSizeToFitWidth = true
        lblPolicyDescirption.minimumScaleFactor = 0.9

    }
    
}

extension PolicyViewController{
    
    @IBAction func actionApprovedPolicy(_ sender:UIButton){
        self.delegate.approvedPolicy()
        self.dismiss(animated: true)
    }
    
    @IBAction func actionClosedPolicy(_ sender: UIButton){
        AnimationManager.shared().removeAnimation(.popup, view: self.view)
    }
}
