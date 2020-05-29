
import UIKit
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming
import MaterialComponents.MaterialColorScheme
import FirebaseAuth

class RestoreViewController: UIViewController {
    
    var restoreLabel = UILabel()
    var restoreTextField = UITextField()
    var restoreLineView = UIView()
    var restoreButton = MDCButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Восстановление пароля"
        
        view.backgroundColor = .white
        
        setupElements()
        addSubviewElements()
        setupLabel()
        setupTextField()
        setupLine()
        setupButton()
    }

    private func setupElements() {
        restoreLabel.translatesAutoresizingMaskIntoConstraints = false
        restoreTextField.translatesAutoresizingMaskIntoConstraints = false
        restoreLineView.translatesAutoresizingMaskIntoConstraints = false
        restoreButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubviewElements() {
        view.addSubview(restoreLabel)
        view.addSubview(restoreTextField)
        view.addSubview(restoreLineView)
        view.addSubview(restoreButton)
    }
    
    private func setupLabel() {
        restoreLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
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
        
        restoreTextField.inputAccessoryView = getToolBar()
        restoreTextField.backgroundColor = .clear
        restoreTextField.textColor = CustomColor.shared.grayText
        restoreTextField.tintColor = CustomColor.shared.grayText
        restoreTextField.font = UIFont.systemFont(ofSize: 20)
        restoreTextField.textAlignment = .left
        restoreTextField.alpha = 80/100
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
        
        // check text fileds
        guard let emeil = restoreTextField.text, restoreTextField.text?.count ?? 0 > 0 else { return }

        // auth
        runActivityIndicator()
        Auth.auth().sendPasswordReset(withEmail: emeil) { [weak self] error in
            if let error = error {
                self?.stopActivityIndicator()
                self?.showBasicAlert(title: "Неверный email", message: error.localizedDescription)
            } else {
                self?.stopActivityIndicator()
                self?.showBasicAlert(title: "Успешно", message: "Пожалуйста, зайдите на свою почту и пройдите по ссылке для восстановления вашего пароля")
            }
        }
    }
}

