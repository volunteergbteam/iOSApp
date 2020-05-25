//
//  ProfileTableCell.swift
//  Helper
//
//  Created by Евгений Шварцкопф on 23.05.2020.
//  Copyright © 2020 vTeam. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    static var reuseId: String = "ProfileCell"
    static var nib: UINib {
        UINib(nibName: "ProfileCell", bundle: nil)
    }

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    
}
