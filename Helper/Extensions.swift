//
//  Extensions.swift
//  Helper
//
//  Created by Kolchedantsev Alexey on 16.05.2020.
//  Copyright © 2020 vTeam. All rights reserved.
//

import Foundation
import UIKit
import SideMenu

extension UIViewController {
    
    // menu action
    @objc func menuButtonAction(_ sender: UIBarButtonItem){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menu = storyboard.instantiateViewController(withIdentifier: "left_menu") as! SideMenuNavigationController
        menu.sideMenuManager.menuFadeStatusBar = false
        present(menu, animated: true, completion: nil)
    }
    
    func getToolBar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(self.hideKeyboard))
        doneButton.title = "Готово"
        toolBar.setItems([doneButton], animated: false)
        return toolBar
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
}

extension UITextField {
    func setIcon(_ image: UIImage){
        let iconView = UIImageView(frame: CGRect(x: 10, y: 7.5, width: 15, height: 15))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}
