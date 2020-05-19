
import UIKit

class MassangerViewController: UIViewController, UINavigationBarDelegate{

    @IBOutlet weak var massageTableView: UITableView!
    
    let titleLabel = UILabel()
    let textLabel = UILabel()
    
    
    let content = ["dasda", "dsada"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingFooter()
        
        if content.isEmpty {
            settingLabel()
        } else {
            settingTableView()
        }
    }
    
    
    private func settingFooter() {
        let footerView = UIView()
        footerView.frame = CGRect(x: 0, y: 0, width: massageTableView.frame.size.width, height: 1)
        footerView.backgroundColor = UIColor.clear
        massageTableView.tableFooterView = footerView
    }
    
    private func settingTableView() {
        massageTableView.delegate = self
        massageTableView.dataSource = self
        massageTableView.register(MassangerCell.nib, forCellReuseIdentifier: MassangerCell.reuseId)
    }
    
    private func settingLabel() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textLabel)
        
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        textLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        textLabel.text = "Пока у вас нет сообщений"
        textLabel.numberOfLines = 0
        textLabel.textColor = CustomColor.shared.grayText
        textLabel.textAlignment = .center
        textLabel.font = UIFont.boldSystemFont(ofSize: 30)
        textLabel.alpha = 54/100
    }
}

extension MassangerViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}

extension MassangerViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = massageTableView.dequeueReusableCell(withIdentifier: MassangerCell.reuseId , for: indexPath) as? MassangerCell else { return UITableViewCell() }
        cell.renderCell()
        return cell
    }
}
