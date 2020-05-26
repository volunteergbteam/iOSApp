
import UIKit
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming
import MaterialComponents.MaterialColorScheme
import FirebaseAuth
import SwiftKeychainWrapper

class RegisterViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var logLabel = UILabel()
    var logTextField = UITextField()
    var logLine = UIView()
    
    var numLabel = UILabel()
    var numTextField = UITextField()
    var numLine = UIView()
    
    var pasLabel = UILabel()
    var pasTextField = UITextField()
    var pasLine = UIView()
    
    var repPasLabel = UILabel()
    var repPasTextField = UITextField()
    var repPasLine = UIView()
    
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
        scrollView.addSubview(logLabel)
        scrollView.addSubview(logTextField)
        scrollView.addSubview(logLine)
        scrollView.addSubview(pasLabel)
        scrollView.addSubview(pasTextField)
        scrollView.addSubview(pasLine)
        scrollView.addSubview(repPasLabel)
        scrollView.addSubview(repPasTextField)
        scrollView.addSubview(repPasLine)
        scrollView.addSubview(numLabel)
        scrollView.addSubview(numTextField)
        scrollView.addSubview(numLine)
        scrollView.addSubview(checkmarkLabel)
        scrollView.addSubview(checkmarkButton)
        scrollView.addSubview(regButton)
    }
    
    private func setupElements() {
        logLabel.translatesAutoresizingMaskIntoConstraints = false
        logTextField.translatesAutoresizingMaskIntoConstraints = false
        logLine.translatesAutoresizingMaskIntoConstraints = false
        numLabel.translatesAutoresizingMaskIntoConstraints = false
        numTextField.translatesAutoresizingMaskIntoConstraints = false
        numLine.translatesAutoresizingMaskIntoConstraints = false
        pasLabel.translatesAutoresizingMaskIntoConstraints = false
        pasTextField.translatesAutoresizingMaskIntoConstraints = false
        pasLine.translatesAutoresizingMaskIntoConstraints = false
        repPasLabel.translatesAutoresizingMaskIntoConstraints = false
        repPasTextField.translatesAutoresizingMaskIntoConstraints = false
        repPasLine.translatesAutoresizingMaskIntoConstraints = false
        checkmarkLabel.translatesAutoresizingMaskIntoConstraints = false
        checkmarkButton.translatesAutoresizingMaskIntoConstraints = false
        regButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private func setupLogLabel() {
        logLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 135).isActive = true
        logLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        logLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        logLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        logLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        logLabel.font = UIFont.systemFont(ofSize: 15)
        logLabel.textColor = CustomColor.shared.blueText
        logLabel.text = "Электронная почта"
    }
    
    private func setupLogField() {
        logTextField.topAnchor.constraint(equalTo: logLabel.bottomAnchor, constant: 0).isActive = true
        logTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        logTextField.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        logTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        logTextField.inputAccessoryView = getToolBar()
        logTextField.backgroundColor = .clear
        logTextField.textColor = CustomColor.shared.grayText
        logTextField.tintColor = CustomColor.shared.grayText
        logTextField.font = UIFont.systemFont(ofSize: 20)
        logTextField.textAlignment = .left
        logTextField.alpha = 80/100
    }
    
    private func setupLogLine() {
        logLine.topAnchor.constraint(equalTo: logTextField.bottomAnchor, constant: 0).isActive = true
        logLine.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        logLine.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        logLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        logLine.alpha = 12/100
        
        logLine.backgroundColor = CustomColor.shared.grayText
    }
    
    private func setupNumLabel() {
        numLabel.topAnchor.constraint(equalTo: logTextField.bottomAnchor, constant: 5).isActive = true
        numLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        numLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        numLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        numLabel.font = UIFont.systemFont(ofSize: 15)
        numLabel.textColor = CustomColor.shared.blueText
        numLabel.text = "Телефон"
    }
    
    private func setupNumField() {
        numTextField.topAnchor.constraint(equalTo: numLabel.bottomAnchor, constant: 0).isActive = true
        numTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        numTextField.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        numTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        numTextField.inputAccessoryView = getToolBar()
        numTextField.backgroundColor = .clear
        numTextField.textColor = CustomColor.shared.grayText
        numTextField.tintColor = CustomColor.shared.grayText
        numTextField.font = UIFont.systemFont(ofSize: 20)
        numTextField.textAlignment = .left
        numTextField.alpha = 80/100
    }
    
    private func setupNumLine() {
        numLine.topAnchor.constraint(equalTo: numTextField.bottomAnchor, constant: 0).isActive = true
        numLine.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        numLine.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        numLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        numLine.alpha = 12/100
        
        numLine.backgroundColor = CustomColor.shared.grayText
    }
    
    private func setupPasLable() {
        pasLabel.topAnchor.constraint(equalTo: numTextField.bottomAnchor, constant: 5).isActive = true
        pasLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        pasLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        pasLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        pasLabel.font = UIFont.systemFont(ofSize: 15)
        pasLabel.textColor = CustomColor.shared.blueText
        pasLabel.text = "Пароль"
    }
    
    private func setupPasField() {
        pasTextField.topAnchor.constraint(equalTo: pasLabel.bottomAnchor, constant: 0).isActive = true
        pasTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        pasTextField.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        pasTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        pasTextField.isSecureTextEntry = true
        
        pasTextField.inputAccessoryView = getToolBar()
        pasTextField.backgroundColor = .clear
        pasTextField.textColor = CustomColor.shared.grayText
        pasTextField.tintColor = CustomColor.shared.grayText
        pasTextField.font = UIFont.systemFont(ofSize: 20)
        pasTextField.textAlignment = .left
        pasTextField.alpha = 80/100
    }
    
    private func setupPasLine() {
        pasLine.topAnchor.constraint(equalTo: pasTextField.bottomAnchor, constant: 0).isActive = true
        pasLine.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        pasLine.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        pasLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        pasLine.alpha = 12/100
        
        pasLine.backgroundColor = CustomColor.shared.grayText
    }
    
    private func setupRepPasLable() {
        repPasLabel.topAnchor.constraint(equalTo: pasTextField.bottomAnchor, constant: 5).isActive = true
        repPasLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        repPasLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        repPasLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        repPasLabel.font = UIFont.systemFont(ofSize: 15)
        repPasLabel.textColor = CustomColor.shared.blueText
        repPasLabel.text = "Подтверждение пароля"
    }
    
    private func setupRepPasField() {
        repPasTextField.topAnchor.constraint(equalTo: repPasLabel.bottomAnchor, constant: 0).isActive = true
        repPasTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        repPasTextField.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        repPasTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        repPasTextField.isSecureTextEntry = true
        
        repPasTextField.inputAccessoryView = getToolBar()
        repPasTextField.backgroundColor = .clear
        repPasTextField.textColor = CustomColor.shared.grayText
        repPasTextField.tintColor = CustomColor.shared.grayText
        repPasTextField.font = UIFont.systemFont(ofSize: 20)
        repPasTextField.textAlignment = .left
        repPasTextField.alpha = 80/100
    }
    
    private func setupRepPasLine() {
        repPasLine.topAnchor.constraint(equalTo: repPasTextField.bottomAnchor, constant: 0).isActive = true
        repPasLine.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        repPasLine.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        repPasLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        repPasLine.alpha = 12/100
        
        repPasLine.backgroundColor = CustomColor.shared.grayText
    }
    
    private func setupCheckButton() {
        checkmarkButton.topAnchor.constraint(equalTo: repPasTextField.bottomAnchor, constant: 40).isActive = true
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
        checkmarkLabel.topAnchor.constraint(equalTo: repPasTextField.bottomAnchor, constant: 40).isActive = true
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
        guard let email = logTextField.text, logTextField.text?.count ?? 0 > 0,
            let phone = numTextField.text, numTextField.text?.count ?? 0 > 0,
            let password = pasTextField.text, pasTextField.text?.count ?? 0 > 0,
            let repeatPassword = repPasTextField.text, repPasTextField.text?.count ?? 0 > 0 else {
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
            // check for error
            if let error = error {
                self?.stopActivityIndicator()
                self?.showBasicAlert(title: "Ошибка", message: error.localizedDescription)
            } else {
                // success
                print("YA MAN")
                //TODO: add info to database
                
                // save uid to key chain and move to main screen
                if let user = authResult?.user {
                    self?.stopActivityIndicator()
                    KeychainWrapper.standard.set(user.uid, forKey: "UID")
                    let navController = UINavigationController(rootViewController: MainPageViewController())
                    navController.modalPresentationStyle = .fullScreen
                    self?.present(navController, animated: true, completion: nil)
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
