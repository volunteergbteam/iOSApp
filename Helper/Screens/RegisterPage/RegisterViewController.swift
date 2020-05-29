
import UIKit
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming
import MaterialComponents.MaterialColorScheme
import FirebaseAuth
import FirebaseDatabase

import SwiftKeychainWrapper
class RegisterViewController: UIViewController {
    
    var ref: DatabaseReference!

    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var loginLabel = UILabel()
    var loginTextField = UITextField()
    var loginLine = UIView()
    
    var numberLabel = UILabel()
    var numberTextField = UITextField()
    var numberLine = UIView()
    
    var passwordLabel = UILabel()
    var passwordTextField = UITextField()
    var passwordLine = UIView()
    
    var repPasswordLabel = UILabel()
    var repPasswordTextField = UITextField()
    var repPasswordLine = UIView()
    
    var checkmarkButton = UIButton()
    var checkmarkLabel = UILabel()
    
    var regButton = MDCButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Регистрация"
        
        view.backgroundColor = .white
        self.view.addSubview(scrollView)
        
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor , constant: -85).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        scrollView.isScrollEnabled = true
    
        addSubviewElements()
        setupElements()
        setupAllSetting()
    }
    
    private func setupAllSetting() {
        setupLogLabel()
        setupLogField()
        setupLogLine()
        setupNumLabel()
        setupNumField()
        setupNumLine()
        setupPasLable()
        setupPasField()
        setupPasLine()
        setupRepPasLable()
        setupRepPasField()
        setupRepPasLine()
        setupRegButton()
        setupCheckLabel()
        setupCheckButton()
    }
    
    private func addSubviewElements(){
        scrollView.addSubview(loginLabel)
        scrollView.addSubview(loginTextField)
        scrollView.addSubview(loginLine)
        scrollView.addSubview(passwordLabel)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(passwordLine)
        scrollView.addSubview(repPasswordLabel)
        scrollView.addSubview(repPasswordTextField)
        scrollView.addSubview(repPasswordLine)
        scrollView.addSubview(numberLabel)
        scrollView.addSubview(numberTextField)
        scrollView.addSubview(numberLine)
        scrollView.addSubview(checkmarkLabel)
        scrollView.addSubview(checkmarkButton)
        scrollView.addSubview(regButton)
    }
    
    private func setupElements() {
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginLine.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberTextField.translatesAutoresizingMaskIntoConstraints = false
        numberLine.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordLine.translatesAutoresizingMaskIntoConstraints = false
        repPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        repPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        repPasswordLine.translatesAutoresizingMaskIntoConstraints = false
        checkmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        checkmarkButton.translatesAutoresizingMaskIntoConstraints = false
        regButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private func setupLogLabel() {
        loginLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 135).isActive = true
        loginLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        loginLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        loginLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        loginLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        loginLabel.font = UIFont.systemFont(ofSize: 15)
        loginLabel.textColor = CustomColor.shared.blueText
        loginLabel.text = "Электронная почта"
    }
    
    private func setupLogField() {
        loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 0).isActive = true
        loginTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        loginTextField.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        loginTextField.inputAccessoryView = getToolBar()
        loginTextField.backgroundColor = .clear
        loginTextField.textColor = CustomColor.shared.grayText
        loginTextField.tintColor = CustomColor.shared.grayText
        loginTextField.font = UIFont.systemFont(ofSize: 20)
        loginTextField.textAlignment = .left
        loginTextField.alpha = 80/100
    }
    
    private func setupLogLine() {
        loginLine.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 0).isActive = true
        loginLine.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        loginLine.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        loginLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        loginLine.alpha = 12/100
        
        loginLine.backgroundColor = CustomColor.shared.grayText
    }
    
    private func setupNumLabel() {
        numberLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 5).isActive = true
        numberLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        numberLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        numberLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        numberLabel.font = UIFont.systemFont(ofSize: 15)
        numberLabel.textColor = CustomColor.shared.blueText
        numberLabel.text = "Телефон"
    }
    
    private func setupNumField() {
        numberTextField.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 0).isActive = true
        numberTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        numberTextField.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        numberTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        numberTextField.inputAccessoryView = getToolBar()
        numberTextField.backgroundColor = .clear
        numberTextField.textColor = CustomColor.shared.grayText
        numberTextField.tintColor = CustomColor.shared.grayText
        numberTextField.font = UIFont.systemFont(ofSize: 20)
        numberTextField.textAlignment = .left
        numberTextField.alpha = 80/100
    }
    
    private func setupNumLine() {
        numberLine.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: 0).isActive = true
        numberLine.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        numberLine.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        numberLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        numberLine.alpha = 12/100
        
        numberLine.backgroundColor = CustomColor.shared.grayText
    }
    
    private func setupPasLable() {
        passwordLabel.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: 5).isActive = true
        passwordLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        passwordLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        passwordLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        passwordLabel.font = UIFont.systemFont(ofSize: 15)
        passwordLabel.textColor = CustomColor.shared.blueText
        passwordLabel.text = "Пароль"
    }
    
    private func setupPasField() {
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 0).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        passwordTextField.isSecureTextEntry = true
        
        passwordTextField.inputAccessoryView = getToolBar()
        passwordTextField.backgroundColor = .clear
        passwordTextField.textColor = CustomColor.shared.grayText
        passwordTextField.tintColor = CustomColor.shared.grayText
        passwordTextField.font = UIFont.systemFont(ofSize: 20)
        passwordTextField.textAlignment = .left
        passwordTextField.alpha = 80/100
    }
    
    private func setupPasLine() {
        passwordLine.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 0).isActive = true
        passwordLine.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        passwordLine.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        passwordLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        passwordLine.alpha = 12/100
        
        passwordLine.backgroundColor = CustomColor.shared.grayText
    }
    
    private func setupRepPasLable() {
        repPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5).isActive = true
        repPasswordLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        repPasswordLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        repPasswordLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        repPasswordLabel.font = UIFont.systemFont(ofSize: 15)
        repPasswordLabel.textColor = CustomColor.shared.blueText
        repPasswordLabel.text = "Подтверждение пароля"
    }
    
    private func setupRepPasField() {
        repPasswordTextField.topAnchor.constraint(equalTo: repPasswordLabel.bottomAnchor, constant: 0).isActive = true
        repPasswordTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        repPasswordTextField.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        repPasswordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        repPasswordTextField.isSecureTextEntry = true
        
        repPasswordTextField.inputAccessoryView = getToolBar()
        repPasswordTextField.backgroundColor = .clear
        repPasswordTextField.textColor = CustomColor.shared.grayText
        repPasswordTextField.tintColor = CustomColor.shared.grayText
        repPasswordTextField.font = UIFont.systemFont(ofSize: 20)
        repPasswordTextField.textAlignment = .left
        repPasswordTextField.alpha = 80/100
    }
    
    private func setupRepPasLine() {
        repPasswordLine.topAnchor.constraint(equalTo: repPasswordTextField.bottomAnchor, constant: 0).isActive = true
        repPasswordLine.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        repPasswordLine.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        repPasswordLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        repPasswordLine.alpha = 12/100
        
        repPasswordLine.backgroundColor = CustomColor.shared.grayText
    }
    
    private func setupCheckButton() {
        checkmarkButton.topAnchor.constraint(equalTo: repPasswordTextField.bottomAnchor, constant: 40).isActive = true
        checkmarkButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        checkmarkButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        checkmarkButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        checkmarkButton.backgroundColor = .white
        checkmarkButton.layer.borderWidth = 1
        checkmarkButton.layer.borderColor = CustomColor.shared.blueText.cgColor
        checkmarkButton.layer.cornerRadius = 5
        checkmarkButton.isSelected = false
        checkmarkButton.addTarget(self, action: #selector(checkmarkAction), for: .touchUpInside)
    }
    
    private func setupCheckLabel() {
        checkmarkLabel.topAnchor.constraint(equalTo: repPasswordTextField.bottomAnchor, constant: 40).isActive = true
        checkmarkLabel.leftAnchor.constraint(equalTo: checkmarkButton.rightAnchor, constant: 10).isActive = true
        checkmarkLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -100).isActive = true
        checkmarkLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        checkmarkLabel.numberOfLines = 0
        checkmarkLabel.font = UIFont.systemFont(ofSize: 15)
        checkmarkLabel.textColor = CustomColor.shared.grayText
        checkmarkLabel.alpha = 87/100
        checkmarkLabel.text = "Соглашение с политикой конфиденциальности"
    }
    
    private func setupRegButton() {
        regButton.topAnchor.constraint(equalTo: checkmarkLabel.bottomAnchor, constant: 340).isActive = true
        regButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        regButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: -5).isActive = true
        regButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 25).isActive = true
        regButton.heightAnchor.constraint(equalToConstant: 85).isActive = true
        
        regButton.setTitle("ЗАРЕГИСТРИРОВАТЬСЯ", for: .normal)
        let containerScheme = MDCContainerScheme()
        containerScheme.colorScheme.primaryColor = CustomColor.shared.marineButton
        regButton.applyContainedTheme(withScheme: containerScheme)
        
        regButton.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize.height = regButton.frame.maxY
    }
}


extension RegisterViewController {
    
    @objc func registerAction(_ sender: UIButton) {
        // check if all fields are filled
        guard let email = loginTextField.text, loginTextField.text?.count ?? 0 > 0,
            let phone = numberTextField.text, numberTextField.text?.count ?? 0 > 0,
            let password = passwordTextField.text, passwordTextField.text?.count ?? 0 > 0,
            let repeatPassword = repPasswordTextField.text, repPasswordTextField.text?.count ?? 0 > 0 else {
                showBasicAlert(title: "Вы заполнели не все поля", message: "")
                return
        }
        
        // check if password match
        guard repeatPassword == password else {
            showBasicAlert(title: "Пароли не совпадают", message: "")
            return
        }
        
        guard checkmarkButton.isSelected else {
            showBasicAlert(title: "Необходимо согласиться с политикой конфиденциальности", message: "")
            return
        }
        
        // registration action
        runActivityIndicator()
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] authResult, error in
            guard let strongSelf = self else { return }
            // check for error
            if let error = error {
                self?.stopActivityIndicator()
                self?.showBasicAlert(title: "Ошибка", message: error.localizedDescription)
            } else {
                // success
                // save uid to key chain and move to main screen
                if let user = authResult?.user {
                    self?.stopActivityIndicator()
                    KeychainWrapper.standard.set(user.uid, forKey: "UID")
                    let navController = UINavigationController(rootViewController: MainPageViewController())
                    navController.modalPresentationStyle = .fullScreen
                    self?.present(navController, animated: true, completion: nil)
                    
                    // write data to BD
                    self?.ref = Database.database().reference()
                    strongSelf.ref.child("users").child(user.uid).setValue(["email": email, "phone": phone])
                }
            }
        }
    }
    
    @objc func checkmarkAction(_ sender: UIButton) {
        if sender.isSelected != true {
            checkmarkButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
            checkmarkButton.backgroundColor = CustomColor.shared.blueText
            checkmarkButton.tintColor = .white
            checkmarkButton.layer.cornerRadius = 5
            sender.isSelected = true
        } else {
            checkmarkButton.backgroundColor = .white
            checkmarkButton.layer.borderWidth = 1
            checkmarkButton.layer.borderColor = CustomColor.shared.blueText.cgColor
            checkmarkButton.layer.cornerRadius = 5
            sender.isSelected = false
        }
    }
}
