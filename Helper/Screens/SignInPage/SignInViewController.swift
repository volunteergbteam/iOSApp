import UIKit
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming
import MaterialComponents.MaterialColorScheme
import FirebaseAuth
import SwiftKeychainWrapper
class SignInViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var logoView = UIImageView()
    var loginLabel = UILabel()
    var passwordLabel = UILabel()
    var loginTextField = UITextField()
    var passwordTextField = UITextField()
    var restoreLabel = UILabel()
    var logInButton = MDCButton()
    var registerButton = MDCButton()
    
    var firstLineView = UIView()
    var secondLineView = UIView()
    var logLineView = UIView()
    var pasLineView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.view.addSubview(scrollView)
        
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8.0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor , constant: -85).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8.0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        scrollView.isScrollEnabled = true
    
        addSubviewElements()
        setupElements()
        
        setupLogo()
        setupLoginLabel()
        setupLoginField()
        setupLineLog()
        setupPasswordLabel()
        setupPasswordField()
        setupLinePas()
        setupLogInButton()
        setupRestoreLabel()
        setupFirstLine()
        setupSecondLine()
        setupRegisterButton()
    }
    
    private func addSubviewElements() {
        scrollView.addSubview(logoView)
        scrollView.addSubview(loginLabel)
        scrollView.addSubview(passwordLabel)
        scrollView.addSubview(loginTextField)
        scrollView.addSubview(logLineView)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(pasLineView)
        scrollView.addSubview(restoreLabel)
        scrollView.addSubview(logInButton)
        scrollView.addSubview(registerButton)
        scrollView.addSubview(firstLineView)
        scrollView.addSubview(secondLineView)
    }
    
    private func setupElements() {
        logoView.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        restoreLabel.translatesAutoresizingMaskIntoConstraints = false
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        firstLineView.translatesAutoresizingMaskIntoConstraints = false
        logLineView.translatesAutoresizingMaskIntoConstraints = false
        pasLineView.translatesAutoresizingMaskIntoConstraints = false
        secondLineView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLogo() {
        logoView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -80).isActive = true
        logoView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 80).isActive = true
        logoView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 80).isActive = true
        logoView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        logoView.image = UIImage(named: "logo")
        logoView.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    private func setupLoginLabel() {
        loginLabel.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 60).isActive = true
        loginLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        loginLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        loginLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        loginLabel.font = UIFont.systemFont(ofSize: 15)
        loginLabel.textColor = CustomColor.shared.blueText
        loginLabel.text = "Ваш E-mail"
    }
    
    private func setupLoginField() {
        loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 0).isActive = true
        loginTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        loginTextField.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        loginTextField.backgroundColor = .clear
        loginTextField.inputAccessoryView = getToolBar()
        loginTextField.textColor = CustomColor.shared.grayText
        loginTextField.tintColor = CustomColor.shared.grayText
        loginTextField.font = UIFont.systemFont(ofSize: 20)
        loginTextField.textAlignment = .left
        loginTextField.alpha = 80/100
    }
    
    private func setupLineLog() {
        logLineView.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 0).isActive = true
        logLineView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        logLineView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        logLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        logLineView.alpha = 12/100
        
        logLineView.backgroundColor = CustomColor.shared.grayText
    }
    
    private func setupPasswordLabel() {
        passwordLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 5).isActive = true
        passwordLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        passwordLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        passwordLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        passwordLabel.font = UIFont.systemFont(ofSize: 15)
        passwordLabel.textColor = CustomColor.shared.blueText
        passwordLabel.text = "Ваш пароль"
    }
    
    private func setupPasswordField() {
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
        
        let button = UIButton()
        button.backgroundColor = .clear
        button.alpha = 54/100
        button.setTitle("не помню", for: .normal)
        button.setTitleColor(CustomColor.shared.grayText, for: .normal)
        button.addTarget(self, action: #selector(restoreAction), for: .touchUpInside)
        passwordTextField.rightView = button
        passwordTextField.rightViewMode = .always
        
    }
    
    private func setupLinePas() {
        pasLineView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 0).isActive = true
        pasLineView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        pasLineView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        pasLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        pasLineView.alpha = 12/100
        
        pasLineView.backgroundColor = CustomColor.shared.grayText
    }
    
    private func setupLogInButton() {
        logInButton.topAnchor.constraint(equalTo: pasLineView.bottomAnchor, constant: 50).isActive = true
        logInButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        logInButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        logInButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        logInButton.setTitle("ВОЙТИ", for: .normal)
        logInButton.setElevation(ShadowElevation(rawValue: 6), for: .normal)
        logInButton.setElevation(ShadowElevation(rawValue: 12), for: .highlighted)
        let containerScheme = MDCContainerScheme()
        containerScheme.colorScheme.primaryColor = CustomColor.shared.marineButton
        logInButton.applyContainedTheme(withScheme: containerScheme)
        logInButton.addTarget(self, action: #selector(logInAction), for: .touchUpInside)
        
    }
    
    private func setupRestoreLabel() {
        restoreLabel.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 150).isActive = true
        restoreLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        restoreLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        restoreLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        restoreLabel.font = UIFont.boldSystemFont(ofSize: 17)
        restoreLabel.alpha = 54/100
        restoreLabel.textColor = CustomColor.shared.grayText
        restoreLabel.textAlignment = .center
        restoreLabel.text = "Нету аккаунта?"
    }
    
    private func setupFirstLine() {
        firstLineView.centerYAnchor.constraint(equalTo: restoreLabel.centerYAnchor).isActive = true
        firstLineView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0).isActive = true
        firstLineView.rightAnchor.constraint(equalTo: restoreLabel.leftAnchor, constant: 25).isActive = true
        firstLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        firstLineView.backgroundColor = CustomColor.shared.grayText
    }
    
    private func setupSecondLine() {
        secondLineView.centerYAnchor.constraint(equalTo: restoreLabel.centerYAnchor).isActive = true
        secondLineView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0).isActive = true
        secondLineView.leftAnchor.constraint(equalTo: restoreLabel.rightAnchor, constant: -25).isActive = true
        secondLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        secondLineView.backgroundColor = CustomColor.shared.grayText
    }
    
    private func setupRegisterButton() {
        registerButton.topAnchor.constraint(equalTo: restoreLabel.bottomAnchor, constant: 20).isActive = true
        registerButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 40).isActive = true
        registerButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -40).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        registerButton.setTitle("ЗАРЕГИСТРИРОВАТЬСЯ", for: .normal)
        registerButton.setElevation(ShadowElevation(rawValue: 6), for: .normal)
        registerButton.setElevation(ShadowElevation(rawValue: 12), for: .highlighted)
        let containerScheme = MDCContainerScheme()
        containerScheme.colorScheme.primaryColor = CustomColor.shared.blueButton
        registerButton.applyContainedTheme(withScheme: containerScheme)
        registerButton.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
    }
    
}

extension SignInViewController {
    
    @objc func logInAction(_ sender: UIButton) {
        // check text fileds
        guard let email = loginTextField.text, loginTextField.text?.count ?? 0 > 0,
            let password = passwordTextField.text, passwordTextField.text?.count ?? 0 > 0 else { return }
        
        // auth
        runActivityIndicator()
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          // guard let strongSelf = self else { return }
            if let error = error {
                // check error
                self?.stopActivityIndicator()
                self?.showBasicAlert(title: "Ошибка", message: error.localizedDescription)
            } else {
                // success
                if let user = authResult?.user {
                    self?.stopActivityIndicator()
                    KeychainWrapper.standard.set(user.uid, forKey: "UID")
                    let mainPage = TabViewController()
                    mainPage.modalPresentationStyle = .fullScreen
                    self?.navigationController?.present(mainPage, animated: true, completion: nil)
                } else {
                    // soemthing is wrong, do something
                }
            }
        }
    }
    
    @objc func restoreAction(_ sender: UIButton) {
        let restoreViewController = RestoreViewController()
        navigationController?.pushViewController(restoreViewController, animated: true)
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = CustomColor.shared.grayText
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = UIColor.clear
        
        print("Oyy press me restore")
    }
    
    @objc func registerAction(_ sender: UIButton) {
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = CustomColor.shared.grayText
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = UIColor.clear
        
        print("Oy press me register")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.contentSize.height = registerButton.frame.maxY + 5
    }
    
}


