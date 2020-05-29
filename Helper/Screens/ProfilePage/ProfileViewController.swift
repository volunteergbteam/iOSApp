
import UIKit
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming
import MaterialComponents.MaterialColorScheme
import FirebaseDatabase
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var ref: DatabaseReference!
    var user: User!
    
    var nameLabel = UILabel()
    var nameUser = UILabel()
    var lastNameLabel = UILabel()
    var lastNameUser = UITextField()
    var mailLabel = UILabel()
    var mailUser = UILabel()
    var phoneLabel = UILabel()
    var phoneUser = UILabel()
    var aboutLabel = UILabel()
    var aboutUser = UILabel()
    var actionEventButton = MDCButton()
    var myEventButton = MDCButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Профиль"
        
        let settingButton = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(settingButtonAction(_:)))
        self.navigationItem.rightBarButtonItem = settingButton
        
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
        setupActionEvent()
        setupMyEvent()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getApi()
    }
    
    private func getApi() {
        runActivityIndicator()
        let userID = Auth.auth().currentUser?.uid
        ref = Database.database().reference()
        ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { [weak self] (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let username = value?["name"] as? String ?? "Не указано"
            let userLastName = value?["lastName"] as? String ?? "Не указано"
            let userEmail = value?["email"] as? String ?? "Не указано"
            let userPhone = value?["phone"] as? String ?? "Не указано"
            let userAbout = value?["about"] as? String ?? "Не указано"
            
            self?.user = User(name: username, lastName: userLastName, email: userEmail, phone: userPhone, about: userAbout)
            
            self?.nameUser.text = self?.user.name
            self?.lastNameUser.text = self?.user.lastName
            self?.mailUser.text = self?.user.email
            self?.phoneUser.text = self?.user.phone
            self?.aboutUser.text = self?.user.about
            
            self?.stopActivityIndicator()
        }) { (error) in
            self.stopActivityIndicator()
            print(error.localizedDescription)
        }
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
        scrollView.addSubview(actionEventButton)
        scrollView.addSubview(myEventButton)
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
        actionEventButton.translatesAutoresizingMaskIntoConstraints = false
        myEventButton.translatesAutoresizingMaskIntoConstraints = false
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
        
        
        aboutUser.font = UIFont.systemFont(ofSize: 20)
        aboutUser.textAlignment = .left
        aboutUser.numberOfLines = 0
        aboutUser.textColor = CustomColor.shared.grayText
        aboutUser.alpha = 54/100
    }
    
    private func setupActionEvent() {
        actionEventButton.topAnchor.constraint(equalTo: aboutUser.bottomAnchor, constant: 50).isActive = true
        actionEventButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        actionEventButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        actionEventButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        actionEventButton.setTitle("АКТИВНЫЕ МЕРОПРИЯТИЯ", for: .normal)
        actionEventButton.setElevation(ShadowElevation(rawValue: 6), for: .normal)
        actionEventButton.setElevation(ShadowElevation(rawValue: 12), for: .highlighted)
        let containerScheme = MDCContainerScheme()
        containerScheme.colorScheme.primaryColor = CustomColor.shared.marineButton
        actionEventButton.applyContainedTheme(withScheme: containerScheme)
        actionEventButton.addTarget(self, action: #selector(eventAction(_:)), for: .touchUpInside)
    }
    
    private func setupMyEvent() {
        myEventButton.topAnchor.constraint(equalTo: actionEventButton.bottomAnchor, constant: 10).isActive = true
        myEventButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        myEventButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        myEventButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10).isActive = true
        myEventButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        myEventButton.setTitle("МОИ МЕРОПРИЯТИЯ", for: .normal)
        myEventButton.setElevation(ShadowElevation(rawValue: 6), for: .normal)
        myEventButton.setElevation(ShadowElevation(rawValue: 12), for: .highlighted)
        let containerScheme = MDCContainerScheme()
        containerScheme.colorScheme.primaryColor = CustomColor.shared.marineButton
        myEventButton.applyContainedTheme(withScheme: containerScheme)
        myEventButton.addTarget(self, action: #selector(myEventAction(_:)), for: .touchUpInside)
    }
}

extension ProfileViewController {
    
    @objc func eventAction(_ sender: UIButton!) {
        navigationController?.pushViewController(ActiveEventsCollectionVC(), animated: true)
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = CustomColor.shared.grayText
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    @objc func myEventAction(_ sender: UIButton!) {
        // fix me
        print("Fix my event show")
    }
    
    @objc func settingButtonAction(_ sender: UIBarButtonItem) {
        let settingVC = SettingViewController()
        settingVC.user = user
        self.navigationController?.pushViewController(settingVC, animated: true)
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = CustomColor.shared.grayText
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.contentSize.height = myEventButton.frame.maxY - 50
    }
    
}

