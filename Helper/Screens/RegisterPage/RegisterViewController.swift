
import UIKit

class RegisterViewController: UIViewController {
    
    var titleLabel = UILabel()
    
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
    
    var regButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        keyboardSetting()
        addSubviewElements()
        setupElements()
        setupAllSetting()
    }
    
    private func keyboardSetting() {
        let hideAction = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        view.addGestureRecognizer(hideAction)
        reloadInputViews()
    }
    
    @objc func hideKeyBoard() {
        view.endEditing(true)
    }
    
    private func setupAllSetting() {
        setupTitle()
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
        view.addSubview(titleLabel)
        view.addSubview(logLabel)
        view.addSubview(logTextField)
        view.addSubview(logLine)
        view.addSubview(pasLabel)
        view.addSubview(pasTextField)
        view.addSubview(pasLine)
        view.addSubview(repPasLabel)
        view.addSubview(repPasTextField)
        view.addSubview(repPasLine)
        view.addSubview(numLabel)
        view.addSubview(numTextField)
        view.addSubview(numLine)
        view.addSubview(checkmarkLabel)
        view.addSubview(checkmarkButton)
        view.addSubview(regButton)
    }
    
    private func setupElements() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
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
    
    private func setupTitle() {
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.textAlignment = .left
        titleLabel.text = "Регистрация"
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = CustomColor.shared.grayText
        titleLabel.alpha = 87/100
    }
    
    private func setupLogLabel() {
        logLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
        logLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        logLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        logLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        logLabel.font = UIFont.systemFont(ofSize: 15)
        logLabel.textColor = CustomColor.shared.blueText
        logLabel.text = "Электронная почта"
    }
    
    private func setupLogField() {
        logTextField.topAnchor.constraint(equalTo: logLabel.bottomAnchor, constant: 0).isActive = true
        logTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        logTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        logTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        logTextField.backgroundColor = .clear
        logTextField.textColor = .darkGray
        logTextField.tintColor = .darkGray
        logTextField.font = UIFont.systemFont(ofSize: 20)
        logTextField.textAlignment = .left
        logTextField.alpha = 87/100
    }
    
    private func setupLogLine() {
        logLine.topAnchor.constraint(equalTo: logTextField.bottomAnchor, constant: 0).isActive = true
        logLine.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        logLine.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        logLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        logLine.alpha = 12/100
        
        logLine.backgroundColor = CustomColor.shared.grayText
    }
    
    private func setupNumLabel() {
        numLabel.topAnchor.constraint(equalTo: logTextField.bottomAnchor, constant: 5).isActive = true
        numLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        numLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        numLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        numLabel.font = UIFont.systemFont(ofSize: 15)
        numLabel.textColor = CustomColor.shared.blueText
        numLabel.text = "Телефон"
    }
    
    private func setupNumField() {
        numTextField.topAnchor.constraint(equalTo: numLabel.bottomAnchor, constant: 0).isActive = true
        numTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        numTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        numTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        numTextField.backgroundColor = .clear
        numTextField.textColor = .darkGray
        numTextField.tintColor = .darkGray
        numTextField.font = UIFont.systemFont(ofSize: 20)
        numTextField.textAlignment = .left
        numTextField.alpha = 87/100
    }
    
    private func setupNumLine() {
        numLine.topAnchor.constraint(equalTo: numTextField.bottomAnchor, constant: 0).isActive = true
        numLine.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        numLine.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        numLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        numLine.alpha = 12/100
        
        numLine.backgroundColor = CustomColor.shared.grayText
    }
    
    private func setupPasLable() {
        pasLabel.topAnchor.constraint(equalTo: numTextField.bottomAnchor, constant: 5).isActive = true
        pasLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        pasLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        pasLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        pasLabel.font = UIFont.systemFont(ofSize: 15)
        pasLabel.textColor = CustomColor.shared.blueText
        pasLabel.text = "Пароль"
    }
    
    private func setupPasField() {
        pasTextField.topAnchor.constraint(equalTo: pasLabel.bottomAnchor, constant: 0).isActive = true
        pasTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        pasTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        pasTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        pasTextField.backgroundColor = .clear
        pasTextField.textColor = .darkGray
        pasTextField.tintColor = .darkGray
        pasTextField.font = UIFont.systemFont(ofSize: 20)
        pasTextField.textAlignment = .left
        pasTextField.alpha = 87/100
    }
    
    private func setupPasLine() {
        pasLine.topAnchor.constraint(equalTo: pasTextField.bottomAnchor, constant: 0).isActive = true
        pasLine.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        pasLine.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        pasLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        pasLine.alpha = 12/100
        
        pasLine.backgroundColor = CustomColor.shared.grayText
    }
    
    private func setupRepPasLable() {
        repPasLabel.topAnchor.constraint(equalTo: pasTextField.bottomAnchor, constant: 5).isActive = true
        repPasLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        repPasLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        repPasLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        repPasLabel.font = UIFont.systemFont(ofSize: 15)
        repPasLabel.textColor = CustomColor.shared.blueText
        repPasLabel.text = "Подтверждение пароля"
    }
    
    private func setupRepPasField() {
        repPasTextField.topAnchor.constraint(equalTo: repPasLabel.bottomAnchor, constant: 0).isActive = true
        repPasTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        repPasTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        repPasTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        repPasTextField.backgroundColor = .clear
        repPasTextField.textColor = .darkGray
        repPasTextField.tintColor = .darkGray
        repPasTextField.font = UIFont.systemFont(ofSize: 20)
        repPasTextField.textAlignment = .left
        repPasTextField.alpha = 87/100
    }
    
    private func setupRepPasLine() {
        repPasLine.topAnchor.constraint(equalTo: repPasTextField.bottomAnchor, constant: 0).isActive = true
        repPasLine.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        repPasLine.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        repPasLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        repPasLine.alpha = 12/100
        
        repPasLine.backgroundColor = CustomColor.shared.grayText
    }
    
    private func setupCheckButton() {
        checkmarkButton.topAnchor.constraint(equalTo: repPasTextField.bottomAnchor, constant: 40).isActive = true
        checkmarkButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        checkmarkButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        checkmarkButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        checkmarkButton.backgroundColor = .white
        checkmarkButton.layer.borderWidth = 1
        checkmarkButton.layer.borderColor = CustomColor.shared.blueText.cgColor
        checkmarkButton.layer.cornerRadius = 5
        checkmarkButton.isSelected = false
        checkmarkButton.addTarget(self, action: #selector(checkmarkAction(_:)), for: .touchUpInside)
    }
    
    private func setupCheckLabel() {
        checkmarkLabel.topAnchor.constraint(equalTo: repPasTextField.bottomAnchor, constant: 40).isActive = true
        checkmarkLabel.leftAnchor.constraint(equalTo: checkmarkButton.rightAnchor, constant: 10).isActive = true
        checkmarkLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100).isActive = true
        checkmarkLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        checkmarkLabel.numberOfLines = 0
        checkmarkLabel.font = UIFont.systemFont(ofSize: 15)
        checkmarkLabel.textColor = CustomColor.shared.grayText
        checkmarkLabel.alpha = 87/100
        checkmarkLabel.text = "Соглашение с политикой конфиденциальности"
    }
    
    private func setupRegButton() {
        regButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        regButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        regButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        regButton.heightAnchor.constraint(equalToConstant: 85).isActive = true
        
        regButton.backgroundColor = CustomColor.shared.greenButton
        regButton.setTitle("ЗАРЕГИСТРИРОВАТЬСЯ", for: .normal)
        regButton.setTitleColor(.white, for: .normal)
        
        regButton.addTarget(self, action: #selector(registerAction(_:)), for: .touchUpInside)
    }
    
}


extension RegisterViewController {
    
    @objc func registerAction(_ sender: UIButton!) {
        print("Account completion register. Please, return on main view and sign in app")
    }
    
    @objc func checkmarkAction(_ sender: UIButton!) {
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
