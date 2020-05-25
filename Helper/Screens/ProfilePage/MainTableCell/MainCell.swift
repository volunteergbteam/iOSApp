//
//  MainCell.swift
//  Helper
//
//  Created by Евгений Шварцкопф on 23.05.2020.
//  Copyright © 2020 vTeam. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {
    
    static var reuseId: String = "MainCell"
    static var nib: UINib {
        UINib(nibName: "MainCell", bundle: nil)
    }
    
    @IBOutlet weak var IconImageView: UIImageView!
    @IBOutlet weak var SettingLabel: UILabel!
    
    func renderCell(model: ProfileSectionItem) {
        IconImageView.image = model.imageItem
        SettingLabel.text = model.name
    }
    
}
