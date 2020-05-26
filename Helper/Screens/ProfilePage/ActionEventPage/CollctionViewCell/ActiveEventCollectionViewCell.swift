//
//  ActiveEventCollectionViewCell.swift
//  Helper
//
//  Created by Kolchedantsev Alexey on 26.05.2020.
//  Copyright © 2020 vTeam. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming
import MaterialComponents.MaterialColorScheme

class ActiveEventCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var greenButton: MDCButton!
    @IBOutlet weak var redButton: MDCButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        redButton.setElevation(ShadowElevation(rawValue: 6), for: .normal)
        redButton.setElevation(ShadowElevation(rawValue: 12), for: .highlighted)
        let containerSchemeRed = MDCContainerScheme()
        containerSchemeRed.colorScheme.primaryColor = .red
        redButton.applyContainedTheme(withScheme: containerSchemeRed)
        
        
        greenButton.setElevation(ShadowElevation(rawValue: 6), for: .normal)
        greenButton.setElevation(ShadowElevation(rawValue: 12), for: .highlighted)
        let containerSchemeGreen = MDCContainerScheme()
        containerSchemeGreen.colorScheme.primaryColor = CustomColor.shared.greenButton
        greenButton.applyContainedTheme(withScheme: containerSchemeGreen)
    }

}
