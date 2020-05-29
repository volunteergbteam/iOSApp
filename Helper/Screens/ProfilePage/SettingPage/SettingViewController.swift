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
    
    var nameLine = UIView()
    var lastNameLine = UIView()
    var mailLine = UIView()
    var phoneLine = UIView()
    var aboutLine = UIView()
    
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
        setupNameLine()
        setupLastNameLabel()
        setupLastNameUser()
        setupLastNameLine()
        setupMailLabel()
        setupMailUser()
        setupMailLine()
        setupPhoneLabel()
        setupPhoneUser()
        setupPhoneLine()
        setupAboutLabel()
        setupAboutUser()
        setupAboutLine()
        setupForgetSetting()
        
        nameUser.text = user.name
        lastNameUser.text = user.lastName
        mailUser.text = user.email
        phoneUser.text = user.phone
        aboutUser.text = user.about
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
        scrollView.addSubview(nameLine)
        scrollView.addSubview(lastNameLine)
        scrollView.addSubview(mailLine)
        scrollView.addSubview(phoneLine)
        scrollView.addSubview(aboutLine)
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
        nameLine.translatesAutoresizingMaskIntoConstraints = false
        lastNameLine.translatesAutoresizingMaskIntoConstraints = false
        mailLine.translatesAutoresizingMaskIntoConstraints = false
        phoneLine.translatesAutoresizingMaskIntoConstraints = false
        aboutLine.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupNameLabel() {
        nameLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        nameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
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
    
    private func setupNameLine() {
        nameLine.topAnchor.constraint(equalTo: nameUser.bottomAnchor, constant: 1).isActive = true
        nameLine.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        nameLine.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        nameLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        nameLine.alpha = 12/100
        
        nameLine.backgroundColor = CustomColor.shared.grayText
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
    
    private func setupLastNameLine() {
        lastNameLine.topAnchor.constraint(equalTo: lastNameUser.bottomAnchor, constant: 1).isActive = true
        lastNameLine.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        lastNameLine.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        lastNameLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        lastNameLine.alpha = 12/100
        
        lastNameLine.backgroundColor = CustomColor.shared.grayText
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
    
    private func setupMailLine() {
        mailLine.topAnchor.constraint(equalTo: mailUser.bottomAnchor, constant: 1).isActive = true
        mailLine.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        mailLine.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        mailLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        mailLine.alpha = 12/100
        
        mailLine.backgroundColor = CustomColor.shared.grayText
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
    
    private func setupPhoneLine() {
        phoneLine.topAnchor.constraint(equalTo: phoneUser.bottomAnchor, constant: 1).isActive = true
        phoneLine.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        phoneLine.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        phoneLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        phoneLine.alpha = 12/100
        
        phoneLine.backgroundColor = CustomColor.shared.grayText
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
    
    private func setupAboutLine() {
        aboutLine.topAnchor.constraint(equalTo: aboutUser.bottomAnchor, constant: 1).isActive = true
        aboutLine.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        aboutLine.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        aboutLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        aboutLine.alpha = 12/100
        
        aboutLine.backgroundColor = CustomColor.shared.grayText
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.contentSize.height = forgetSettingButton.frame.maxY - 100
    }
    
    @objc func settingButtonAction(_ sender: UIBarButtonItem) {
        self.runActivityIndicator()
        
        ref = Database.database().reference()
        
        guard var name = nameUser.text, var lastName = lastNameUser.text,
            var phone = phoneUser.text, var email = mailUser.text,
            var about = aboutUser.text else { return }
        
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        if name.count == 0 {
            name = user.name
        }
        if lastName.count == 0 {
            lastName = user.lastName
        }
        if email.count == 0 {
            email = user.email
        }
        if phone.count == 0 {
            phone = user.phone
        }
        if about.count == 0 {
            about = user.about
        }
        
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
        
    }
}



