//
//  CustomButton.swift
//  Helper
//
//  Created by Евгений Шварцкопф on 26.05.2020.
//  Copyright © 2020 vTeam. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming
import MaterialComponents.MaterialColorScheme

class CustomGreenButton: MDCButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDefault()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupDefault()
    }
    
    private func setupDefault() {
        setTitle("ОТМЕТИТЬ ВЫПОЛНЕННЫМ", for: .normal)
        setElevation(ShadowElevation(rawValue: 6), for: .normal)
        setElevation(ShadowElevation(rawValue: 12), for: .highlighted)
        let containerScheme = MDCContainerScheme()
        containerScheme.colorScheme.primaryColor = CustomColor.shared.marineButton
        applyContainedTheme(withScheme: containerScheme)
    }
    
}

class CustomRedButton: MDCButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDefault()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupDefault()
    }
    
    private func setupDefault() {
        setTitle("ОТМЕНИТЬ", for: .normal)
        setElevation(ShadowElevation(rawValue: 6), for: .normal)
        setElevation(ShadowElevation(rawValue: 12), for: .highlighted)
        let containerScheme = MDCContainerScheme()
        containerScheme.colorScheme.primaryColor = .red
        applyContainedTheme(withScheme: containerScheme)
    }
    
}
