//
//  SettingViewController.swift
//  Helper
//
//  Created by Евгений Шварцкопф on 29.05.2020.
//  Copyright © 2020 vTeam. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming
import MaterialComponents.MaterialColorScheme
import FirebaseDatabase
import FirebaseAuth

class SettingViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var ref: DatabaseReference!
    var user: User!
    
    var nameLabel = UILabel()
    var nameUser = UITextField()
    var lastNameLabel = UILabel()
    var lastNameUser = UITextField()
    var mailLabel = UILabel()
    var mailUser = UITextField()
    var phoneLabel = UILabel()
    var phoneUser = UITextField()
    var aboutLabel = UILabel()
    var aboutUser = UITextField()
    var forgetSettingButton = MDCButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Настройки"
        
        self.view.addSubview(scrollView)
        
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor , constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        scrollView.isScrollEnabled = true
        
        addSubviewElements()
        setupElements()
        
        setupNameLabel()
        setupNameUser()
        setupLastNameLabel()
        setupLastNameUser()
        setupMailLabel()
        setupMailUser()
        setupPhoneLabel()
        setupPhoneUser()
        setupAboutLabel()
        setupAboutUser()
        setupForgetSetting()
        
        nameUser.placeholder = user.name
        lastNameUser.placeholder = user.lastName
        mailUser.placeholder = user.email
        phoneUser.placeholder = user.phone
        aboutUser.placeholder = user.about
    }
    
    private func addSubviewElements() {
        scrollView.addSubview(nameLabel)
        scrollView.addSubview(nameUser)
        scrollView.addSubview(lastNameLabel)
        scrollView.addSubview(lastNameUser)
        scrollView.addSubview(mailLabel)
        scrollView.addSubview(mailUser)
        scrollView.addSubview(phoneLabel)
        scrollView.addSubview(phoneUser)
        scrollView.addSubview(aboutLabel)
        scrollView.addSubview(aboutUser)
        scrollView.addSubview(forgetSettingButton)
    }
    
    private func setupElements() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameUser.translatesAutoresizingMaskIntoConstraints = false
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        lastNameUser.translatesAutoresizingMaskIntoConstraints = false
        mailLabel.translatesAutoresizingMaskIntoConstraints = false
        mailUser.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneUser.translatesAutoresizingMaskIntoConstraints = false
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutUser.translatesAutoresizingMaskIntoConstraints = false
        forgetSettingButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupNameLabel() {
        nameLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        nameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        nameLabel.textAlignment = .left
        nameLabel.textColor = CustomColor.shared.grayText
        nameLabel.text = "Имя"
    }
    
    private func setupNameUser() {
        nameUser.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        nameUser.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        nameUser.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 1).isActive = true
        
        nameUser.inputAccessoryView = getToolBar()
        nameUser.font = UIFont.systemFont(ofSize: 20)
        nameUser.textAlignment = .left
        nameUser.textColor = CustomColor.shared.grayText
        nameUser.alpha = 54/100
    }
    
    private func setupLastNameLabel() {
        lastNameLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        lastNameLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        lastNameLabel.topAnchor.constraint(equalTo: nameUser.bottomAnchor, constant: 20).isActive = true
        
        lastNameLabel.font = UIFont.systemFont(ofSize: 18)
        lastNameLabel.textAlignment = .left
        lastNameLabel.textColor = CustomColor.shared.grayText
        lastNameLabel.text = "Фамилия"
    }
    
    private func setupLastNameUser() {
        lastNameUser.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        lastNameUser.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        lastNameUser.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 1).isActive = true
        
        lastNameUser.inputAccessoryView = getToolBar()
        lastNameUser.font = UIFont.systemFont(ofSize: 20)
        lastNameUser.textAlignment = .left
        lastNameUser.textColor = CustomColor.shared.grayText
        lastNameUser.alpha = 54/100
    }
    
    private func setupMailLabel() {
        mailLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        mailLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        mailLabel.topAnchor.constraint(equalTo: lastNameUser.bottomAnchor, constant: 20).isActive = true
        
        mailLabel.font = UIFont.systemFont(ofSize: 18)
        mailLabel.textAlignment = .left
        mailLabel.textColor = CustomColor.shared.grayText
        mailLabel.text = "Email"
    }
    
    private func setupMailUser() {
        mailUser.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        mailUser.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        mailUser.topAnchor.constraint(equalTo: mailLabel.bottomAnchor, constant: 1).isActive = true
        
        mailUser.inputAccessoryView = getToolBar()
        mailUser.font = UIFont.systemFont(ofSize: 20)
        mailUser.textAlignment = .left
        mailUser.textColor = CustomColor.shared.grayText
        mailUser.alpha = 54/100
    }
    
    private func setupPhoneLabel() {
        phoneLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        phoneLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        phoneLabel.topAnchor.constraint(equalTo: mailUser.bottomAnchor, constant: 20).isActive = true
        
        phoneLabel.font = UIFont.systemFont(ofSize: 18)
        phoneLabel.textAlignment = .left
        phoneLabel.textColor = CustomColor.shared.grayText
        phoneLabel.text = "Телефон"
    }
    
    private func setupPhoneUser() {
        phoneUser.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        phoneUser.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        phoneUser.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 1).isActive = true
        
        phoneUser.inputAccessoryView = getToolBar()
        phoneUser.font = UIFont.systemFont(ofSize: 20)
        phoneUser.textAlignment = .left
        phoneUser.textColor = CustomColor.shared.grayText
        phoneUser.alpha = 54/100
    }
    
    private func setupAboutLabel() {
        aboutLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        aboutLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        aboutLabel.topAnchor.constraint(equalTo: phoneUser.bottomAnchor, constant: 20).isActive = true
        
        aboutLabel.font = UIFont.systemFont(ofSize: 18)
        aboutLabel.textAlignment = .left
        aboutLabel.textColor = CustomColor.shared.grayText
        aboutLabel.text = "О себе"
    }
    
    private func setupAboutUser() {
        aboutUser.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        aboutUser.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        aboutUser.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 1).isActive = true
        
        aboutUser.inputAccessoryView = getToolBar()
        aboutUser.font = UIFont.systemFont(ofSize: 20)
        aboutUser.textAlignment = .left
        aboutUser.textColor = CustomColor.shared.grayText
        aboutUser.alpha = 54/100
    }
    
    private func setupForgetSetting() {
        forgetSettingButton.topAnchor.constraint(equalTo: aboutUser.bottomAnchor, constant: 150).isActive = true
        forgetSettingButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        forgetSettingButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        forgetSettingButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10).isActive = true
        forgetSettingButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        forgetSettingButton.setTitle("ИЗМЕНИТЬ", for: .normal)
        forgetSettingButton.setElevation(ShadowElevation(rawValue: 6), for: .normal)
        forgetSettingButton.setElevation(ShadowElevation(rawValue: 12), for: .highlighted)
        let containerScheme = MDCContainerScheme()
        containerScheme.colorScheme.primaryColor = CustomColor.shared.marineButton
        forgetSettingButton.applyContainedTheme(withScheme: containerScheme)
        forgetSettingButton.addTarget(self, action: #selector(settingButtonAction(_:)), for: .touchUpInside)
    }
}

extension SettingViewController {
    
    @objc func settingButtonAction(_ sender: UIBarButtonItem) {
        self.runActivityIndicator()
        guard let name = nameUser.text, let lastName = lastNameUser.text,
            let phone = phoneUser.text, let email = mailUser.text,
            let about = aboutUser.text else { return }
        
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        if !email.isEmpty {
            
            let newUser = [
                "name" : name,
                "lastName" : lastName,
                "email" : email,
                "phone" : phone,
                "about" : about
            ]
            let childUpdates = ["/users/\(userID)": newUser]
            ref.updateChildValues(childUpdates)
            self.stopActivityIndicator()
            self.showBasicAlert(title: "Успешно", message: "Изменения сохранены")
            
        } else {
            
            let newUser = [
                "name" : name,
                "lastName" : lastName,
                "phone" : phone,
                "about" : about
            ]
            
            let childUpdates = ["/users/\(userID)": newUser]
            ref.updateChildValues(childUpdates)
            self.stopActivityIndicator()
            self.showBasicAlert(title: "Успешно", message: "Изменения сохранены")
        }
    }
}


