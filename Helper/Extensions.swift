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
    @objc func menuButtonAction(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menu = storyboard.instantiateViewController(withIdentifier: "left_menu") as! SideMenuNavigationController
        menu.sideMenuManager.menuFadeStatusBar = false
        present(menu, animated: true, completion: nil)
    }
    // to write message
    
    @objc func writeMessageButtonAction(_ sender: UIBarButtonItem) {
        // fix me
        print("To write a message")
    }
    
    @objc func settingButtonAction(_ sender: UIBarButtonItem) {
        // fix me
        print("To setting profile")
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
    
    func showBasicAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func runActivityIndicator(){
        let indicatorView = UIActivityIndicatorView()
        indicatorView.startAnimating()
        indicatorView.style = .large
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.tag = 420
        self.view.addSubview(indicatorView)
        indicatorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        indicatorView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        self.view.isUserInteractionEnabled = false
    }
    
    func stopActivityIndicator(){
        if let subViews = self.view.viewWithTag(420) {
            subViews.removeFromSuperview()
            self.view.isUserInteractionEnabled = true
        }
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

