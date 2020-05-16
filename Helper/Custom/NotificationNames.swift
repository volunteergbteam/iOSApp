//
//  File.swift
//  Helper
//
//  Created by Kolchedantsev Alexey on 16.05.2020.
//  Copyright © 2020 vTeam. All rights reserved.
//

import Foundation


class NotificationNames {
    
    static var shared = NotificationNames()
    
    private init(){}
    
    let segueNotification = NSNotification.Name("segueNotification")
}
