//
//  SettingsViewController.swift
//  Nalbur
//
//

import Foundation
import UIKit


class SettingsViewController : UIViewController {
    
    @IBOutlet private weak var settingsTableView: UITableView!
    @IBOutlet private weak var topView: UIView!
    private let settingsList = [
        ["Ekran Süresi", "Ekran Paylaşımı"],
        ["Genel","Erişebilirlik","Gizlilik ve Güvenlik"],
        ["Gelişmiş","Dil"]
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
            initialize()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
   
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
   
    }
    
    private func initialize(){
        self.view.backgroundColor = UIColor.white
        
        topView.backgroundColor = UIColor(hex: "#4D0DD0")

        settingsTableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        settingsTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
    }
}

extension SettingsViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsList[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let element = settingsList[indexPath.section][indexPath.row]
        
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: "settingsCell" ) as! SettingsCell
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        cell.uiView.backgroundColor = UIColor.white
        cell.uiView.layer.cornerRadius = 10.0
        
        cell.lblSettingsName.backgroundColor = UIColor.clear
        cell.lblSettingsName.text = element
        cell.lblSettingsName.font = UIFont.bold(size: 16)
        
        cell.arrowImage.backgroundColor = UIColor.clear
        cell.arrowImage.image = UIImage(named: "next")
        
        
        return cell
    }
    

    
}
