//
//  ActionEventViewController.swift
//  Helper
//
//  Created by Евгений Шварцкопф on 26.05.2020.
//  Copyright © 2020 vTeam. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming
import MaterialComponents.MaterialColorScheme

class ActionEventViewController: UIViewController {
    
    @IBOutlet weak var eventTableView: UITableView!
    
    let textLabel = UILabel()
    
    let content = ["dasda", "dsada"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Активные мероприятия"
        
        settingFooter()
        
        if content.isEmpty {
            settingLabel()
        } else {
            settingTableView()
        }
    }
    
    private func settingFooter() {
        let footerView = UIView()
        footerView.frame = CGRect(x: 0, y: 0, width: eventTableView.frame.size.width, height: 1)
        footerView.backgroundColor = UIColor.clear
        eventTableView.tableFooterView = footerView
    }

    private func settingTableView() {
        eventTableView.delegate = self
        eventTableView.dataSource = self
        eventTableView.register(ActionEventCell.nib, forCellReuseIdentifier: ActionEventCell.reuseId)
    }
    
    private func settingLabel() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textLabel)
        
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        textLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        textLabel.text = "Пока еще нет активных мероприятий. Всем хорошо!"
        textLabel.numberOfLines = 0
        textLabel.textColor = CustomColor.shared.grayText
        textLabel.textAlignment = .center
        textLabel.font = UIFont.boldSystemFont(ofSize: 30)
        textLabel.alpha = 54/100
    }
}

extension ActionEventViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        350
    }
}

extension ActionEventViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ActionEventCell.reuseId , for: indexPath) as? ActionEventCell else { return UITableViewCell() }
        cell.renderCell()
        return cell
    }
}
