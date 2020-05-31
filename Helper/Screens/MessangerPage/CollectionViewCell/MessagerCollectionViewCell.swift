//
//  MessagerCollectionViewCell.swift
//  Helper
//
//  Created by Евгений Шварцкопф on 31.05.2020.
//  Copyright © 2020 vTeam. All rights reserved.
//

import UIKit

class MessagerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarUser: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var textMessage: UILabel!
    @IBOutlet weak var timeWrite: UILabel!
    
    
    func renderCell() {
        fullName.text = "Иван Иванов"
        textMessage.text = "Привет!! Сегодня помогать я тебе буду, напиши краткие указания к заданию!?"
        timeWrite.text = "15:36"
    }
    
}
