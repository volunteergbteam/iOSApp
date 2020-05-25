
import UIKit

enum CellTypes {
    case profile
    case mainSection(item: ProfileSectionItem)
}

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var mainSection = [CellTypes]()
    var models = [[CellTypes]]()
    var titleHeader = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Мой Профиль"
        tableView.backgroundColor = .white
        
        addContent()
        registerCell()
        countSection()
        
        settingFooter()
    }
    
    private func countSection() {
        for _ in models{
            titleHeader.append(" ")
        }
    }
    
    private func settingFooter() {
        let footerView = UIView()
        footerView.frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1)
        footerView.backgroundColor = UIColor.clear
        tableView.tableFooterView = footerView
    }
    
    private func addContent() {
        models.append([.profile])
        mainSection.append(contentsOf: MainSectionItem.getShortListItem().map {
            CellTypes.mainSection(item: $0 )
        })
        models.append(mainSection)
    }
    
    private func registerCell() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileCell.nib, forCellReuseIdentifier: ProfileCell.reuseId)
        tableView.register(MainCell.nib, forCellReuseIdentifier: MainCell.reuseId)
    }
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         let row = models[indexPath.section][indexPath.row]
        
        switch row {
        case .profile:
            print("TO DO, show me o_O")
        case let .mainSection(item: section):
            let name = section.name
            
            switch name {
            case "Уведомления":
                print("Ho ho, show me notifications")
            case "Рейтинг":
                print("Ho ho, show me rating")
            case "Мои Успехи":
                print("Ho ho, show me My success")
            case "Лента Событий":
                print("Ho ho, show me news feed")
            case "О приложении":
                print("Ho ho, show me about application")
            default:
                 print("OOOooopsss... it's going wrong! Fix me")
            }
        }
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        25
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleHeader[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
         view.tintColor = UIColor.clear
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = models[indexPath.section][indexPath.row]
        
        switch row {
        case .profile: return 120
        case .mainSection: return 80
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = models[indexPath.section][indexPath.row]
        
        switch row {
        case .profile:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as? ProfileCell else {
                return UITableViewCell()
            }
            cell.profileImageView.image = UIImage(named: "person_img")
            cell.fullNameLabel.text = "Максим Губернатов"
            cell.ageLabel.text = "29 лет"
            cell.cityLabel.text = "Москва"
            return cell
        case let .mainSection(item: section):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell") as? MainCell else {
                return UITableViewCell()
            }
            cell.renderCell(model: section)
            return cell
        }
    }
}
