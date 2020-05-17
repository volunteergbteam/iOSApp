
import UIKit
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming
import MaterialComponents.MaterialColorScheme

class RestoreViewController: UIViewController {
    
    var titleLabel = UILabel()
    var restoreLabel = UILabel()
    var restoreTextField = UITextField()
    var restoreLineView = UIView()
    var restoreButton = MDCButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        keyboardSetting()
        setupElements()
        addSubviewElements()
        setupTitle()
        setupLabel()
        setupTextField()
        setupLine()
        setupButton()
    }
    
    private func keyboardSetting() {
        let hideAction = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        view.addGestureRecognizer(hideAction)
        reloadInputViews()
    }
    
    @objc func hideKeyBoard() {
        view.endEditing(true)
    }
    
    private func setupElements() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        restoreLabel.translatesAutoresizingMaskIntoConstraints = false
        restoreTextField.translatesAutoresizingMaskIntoConstraints = false
        restoreLineView.translatesAutoresizingMaskIntoConstraints = false
        restoreButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubviewElements() {
        view.addSubview(titleLabel)
        view.addSubview(restoreLabel)
        view.addSubview(restoreTextField)
        view.addSubview(restoreLineView)
        view.addSubview(restoreButton)
    }
    
    private func setupTitle() {
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.textAlignment = .left
        titleLabel.text = "Восстановление пароля"
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = CustomColor.shared.grayText
        titleLabel.alpha = 87/100
    }
    
    private func setupLabel() {
        restoreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
        restoreLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        restoreLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        restoreLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        restoreLabel.font = UIFont.systemFont(ofSize: 15)
        restoreLabel.textColor = CustomColor.shared.blueText
        restoreLabel.text = "Электронная почта"
    }
    
    private func setupTextField() {
        restoreTextField.topAnchor.constraint(equalTo: restoreLabel.bottomAnchor, constant: 0).isActive = true
        restoreTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        restoreTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        restoreTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        restoreTextField.backgroundColor = .clear
        restoreTextField.textColor = .darkGray
        restoreTextField.tintColor = .darkGray
        restoreTextField.font = UIFont.systemFont(ofSize: 20)
        restoreTextField.textAlignment = .left
        restoreTextField.alpha = 87/100
    }
    
    private func setupLine() {
        restoreLineView.topAnchor.constraint(equalTo: restoreTextField.bottomAnchor, constant: 0).isActive = true
        restoreLineView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        restoreLineView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        restoreLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        restoreLineView.alpha = 12/100
        
        restoreLineView.backgroundColor = CustomColor.shared.grayText
    }
    
    private func setupButton() {
        restoreButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        restoreButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -5).isActive = true
        restoreButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 5).isActive = true
        restoreButton.heightAnchor.constraint(equalToConstant: 85).isActive = true
        
        restoreButton.setTitle("ВОССТАНОВИТЬ", for: .normal)
        let containerScheme = MDCContainerScheme()
        containerScheme.colorScheme.primaryColor = CustomColor.shared.marineButton
        restoreButton.applyContainedTheme(withScheme: containerScheme)

        restoreButton.addTarget(self, action: #selector(restoreAction(_:)), for: .touchUpInside)
    }
    
}


extension RestoreViewController {
    
    @objc func restoreAction(_ sender: UIButton!) {
           print("Restore password is completed. Return on main view")
       }
    
}

