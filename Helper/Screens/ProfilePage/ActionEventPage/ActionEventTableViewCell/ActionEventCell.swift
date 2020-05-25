//
//  ActionEventCell.swift
//  Helper
//
//  Created by Евгений Шварцкопф on 25.05.2020.
//  Copyright © 2020 vTeam. All rights reserved.
//

import UIKit

class ActionEventCell: UITableViewCell {
    
    static var reuseId: String = "ActionEventCell"
    static var nib: UINib {
        UINib(nibName: "ActionEventCell", bundle: nil)
    }
    
    @IBOutlet weak var firstLine: UIView!
    @IBOutlet weak var nameEvent: UILabel!
    @IBOutlet weak var aboutEvent: UILabel!
    @IBOutlet weak var iconStreet: UIImageView!
    @IBOutlet weak var nameStreet: UILabel!
    @IBOutlet weak var helperImage: UIImageView!
    @IBOutlet weak var nameHelper: UILabel!
    @IBOutlet weak var greenButton: CustomGreenButton!
    @IBOutlet weak var redButton: CustomRedButton!
    @IBOutlet weak var secondLine: UIView!
    
    func renderCell() {
        nameEvent.text = "Купить продуктов"
        aboutEvent.text = "Нужно купить хлеб, молоко, десяток яиц, гречку, рис и соль с сахаром"
        nameStreet.text = "г.Омск, ул. Нефтезаводская 50/2"
        nameHelper.text = "Иван Петрович"
    }
}
