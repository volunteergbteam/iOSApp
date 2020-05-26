//
//  SideMenu.swift
//  Helper
//
//  Created by Kolchedantsev Alexey on 16.05.2020.
//  Copyright © 2020 vTeam. All rights reserved.
//

import Foundation
import SideMenu
import MaterialComponents.MaterialDialogs
import SwiftKeychainWrapper

class MenuVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgView: UIImageView!
    
    let rowsArray = ["", "Все просьбы", "История", "Профиль", "О нас", "Выход"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 98
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "avatar_cell") as! SideMenuTableViewCell
            cell.nameLabel.text = "Test User"
            return cell
        } else {
            let cell = UITableViewCell()
            cell.textLabel?.text = rowsArray[indexPath.row]
            cell.textLabel?.textColor = UIColor.white.withAlphaComponent(0.6)
            cell.backgroundColor = .clear
            cell.tag = indexPath.row
            return cell
        }
    }
    
    @IBAction func cancel(_ sender: UITabBarItem){
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        cell?.textLabel?.textColor = .white
        
        // тут будут переходы в зависимости от тега строки
        var segToPass = ""
        switch cell?.tag {
        case 1:
            segToPass = "TODO_SEGUE"
        case 2:
            segToPass = "TODO_SEGUE"
        case 3:
            segToPass = "TODO_SEGUE"
        case 4:
            segToPass = "TODO_SEGUE"
        case 5:
            logOutAction()
        default:
            break
        }
        
        if segToPass != ""{
            self.dismiss(animated: true) {
                NotificationCenter.default.post(name: NotificationNames.shared.segueNotification, object: nil, userInfo: ["seg": segToPass])
            }
        }
    }
    
    func logOutAction(){
        let scheme = MDCContainerScheme()
        scheme.colorScheme.primaryColor = CustomColor.shared.blueButton
        scheme.colorScheme.secondaryColor = .black
        
        let alertController = MDCAlertController(title: "Подтвердите выход", message: "")
        let action = MDCAlertAction(title:"Выйти", emphasis: .high) {
            (action) in
            KeychainWrapper.standard.removeObject(forKey: "UID")
            let navigationView = SignInNavigationController()
            let signInView = SignInViewController()
            navigationView.viewControllers = [signInView]
            navigationView.modalPresentationStyle = .fullScreen
            self.navigationController?.present(navigationView, animated: true, completion: nil)
        }
        
        let cancel = MDCAlertAction(title:"Отмена", emphasis: .low){
            (cancel) in
            self.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(action)
        alertController.addAction(cancel)
        alertController.applyTheme(withScheme: scheme)
        
        present(alertController, animated:true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.textLabel?.textColor = UIColor.white.withAlphaComponent(0.6)
    }
}
