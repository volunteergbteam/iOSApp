
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
    
    var nameLabel = UILabel()
    var nameUser = UILabel()
    var mailLabel = UILabel()
    var mailUser = UILabel()
    var phoneLabel = UILabel()
    var phoneUser = UILabel()
    var cityLabel = UILabel()
    var cityUser = UILabel()
    var aboutLabel = UILabel()
    var aboutUser = UILabel()
    var actionEventButton = MDCButton()
    var myEventButton = MDCButton()
    var settingButton = MDCButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingNavBar()
        
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
        setupMailLabel()
        setupMailUser()
        setupPhoneLabel()
        setupPhoneUser()
        setupCityLabel()
        setupCityUser()
        setupAboutLabel()
        setupAboutUser()
        setupActionEvent()
        setupMyEvent()
        setupQuit()
        
        getApi()
    }
    
    private func getApi() {
        runActivityIndicator()
        let userID = Auth.auth().currentUser?.uid
        ref = Database.database().reference()
        ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let username = value?["name"] as? String ?? ""
            let userLastName = value?["lastName"] as? String ?? ""
            let userEmail = value?["email"] as? String ?? ""
            let userCity = value?["city"] as? String ?? ""
            let userPhone = value?["phone"] as? String ?? ""
            let userAbout = value?["about"] as? String ?? ""
            
            let user = User(name: username, lastName: userLastName, email: userEmail, phone: userPhone, city: userCity, about: userAbout)
            self.nameUser.text = user.name + " " + user.lastName
            self.mailUser.text = user.email
            self.phoneUser.text = user.phone
            self.cityUser.text = user.city
            self.aboutUser.text = user.about
            
            self.stopActivityIndicator()
        }) { (error) in
            self.stopActivityIndicator()
            print(error.localizedDescription)
        }
    }
    
    private func settingNavBar() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        let logo = UIImage(named: "user-profile")
        imageView.image = logo
        self.navigationItem.titleView = imageView
    }
    
    private func addSubviewElements() {
        scrollView.addSubview(nameLabel)
        scrollView.addSubview(nameUser)
        scrollView.addSubview(mailLabel)
        scrollView.addSubview(mailUser)
        scrollView.addSubview(phoneLabel)
        scrollView.addSubview(phoneUser)
        scrollView.addSubview(cityLabel)
        scrollView.addSubview(cityUser)
        scrollView.addSubview(aboutLabel)
        scrollView.addSubview(aboutUser)
        scrollView.addSubview(actionEventButton)
        scrollView.addSubview(myEventButton)
        scrollView.addSubview(settingButton)
    }
    
    private func setupElements() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameUser.translatesAutoresizingMaskIntoConstraints = false
        mailLabel.translatesAutoresizingMaskIntoConstraints = false
        mailUser.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneUser.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityUser.translatesAutoresizingMaskIntoConstraints = false
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutUser.translatesAutoresizingMaskIntoConstraints = false
        actionEventButton.translatesAutoresizingMaskIntoConstraints = false
        myEventButton.translatesAutoresizingMaskIntoConstraints = false
        settingButton.translatesAutoresizingMaskIntoConstraints = false
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
    
    private func setupMailLabel() {
        mailLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        mailLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        mailLabel.topAnchor.constraint(equalTo: nameUser.bottomAnchor, constant: 20).isActive = true
        
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
    
    private func setupCityLabel() {
        cityLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        cityLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        cityLabel.topAnchor.constraint(equalTo: phoneUser.bottomAnchor, constant: 20).isActive = true
        
        cityLabel.font = UIFont.systemFont(ofSize: 18)
        cityLabel.textAlignment = .left
        cityLabel.textColor = CustomColor.shared.grayText
        cityLabel.text = "Город"
    }
    
    private func setupCityUser() {
        cityUser.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        cityUser.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        cityUser.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 1).isActive = true
        
        cityUser.font = UIFont.systemFont(ofSize: 20)
        cityUser.textAlignment = .left
        cityUser.textColor = CustomColor.shared.grayText
        cityUser.alpha = 54/100
    }
    
    private func setupAboutLabel() {
        aboutLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        aboutLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        aboutLabel.topAnchor.constraint(equalTo: cityUser.bottomAnchor, constant: 20).isActive = true
        
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
        myEventButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        myEventButton.setTitle("МОИ МЕРОПРИЯТИЯ", for: .normal)
        myEventButton.setElevation(ShadowElevation(rawValue: 6), for: .normal)
        myEventButton.setElevation(ShadowElevation(rawValue: 12), for: .highlighted)
        let containerScheme = MDCContainerScheme()
        containerScheme.colorScheme.primaryColor = CustomColor.shared.marineButton
        myEventButton.applyContainedTheme(withScheme: containerScheme)
        myEventButton.addTarget(self, action: #selector(myEventAction(_:)), for: .touchUpInside)
    }
    
    private func setupQuit() {
        settingButton.topAnchor.constraint(equalTo: myEventButton.bottomAnchor, constant: 10).isActive = true
        settingButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 15).isActive = true
        settingButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -15).isActive = true
        settingButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10).isActive = true
        settingButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        settingButton.setTitle("НАСТРОЙКИ", for: .normal)
        settingButton.setElevation(ShadowElevation(rawValue: 6), for: .normal)
        settingButton.setElevation(ShadowElevation(rawValue: 12), for: .highlighted)
        let containerScheme = MDCContainerScheme()
        containerScheme.colorScheme.primaryColor = CustomColor.shared.blueButton
        settingButton.applyContainedTheme(withScheme: containerScheme)
        settingButton.addTarget(self, action: #selector(settingButtonAction(_:)), for: .touchUpInside)
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.contentSize.height = settingButton.frame.maxY - 50
    }
    
}

