//
//  ProfileSectionItems.swift
//  Helper
//
//  Created by Евгений Шварцкопф on 23.05.2020.
//  Copyright © 2020 vTeam. All rights reserved.
//

import UIKit

class ProfileSectionItem {
    
    var name: String
    var imageItem: UIImage
    
    init(name: String, imageItem: UIImage) {
        self.name = name
        self.imageItem = imageItem
    }
}

class MainSectionItem {
    
    static func getShortListItem() -> [ProfileSectionItem] {
           let listItem = [
               ProfileSectionItem(name: "Уведомления", imageItem: UIImage(systemName: "bell.fill")!),
               ProfileSectionItem(name: "Рейтинг", imageItem: UIImage(systemName: "bell.fill")!),
               ProfileSectionItem(name: "Мои Успехи", imageItem: UIImage(systemName: "bell.fill")!),
               ProfileSectionItem(name: "Лента Событий", imageItem: UIImage(systemName: "doc.plaintext")!),
               ProfileSectionItem(name: "О приложении", imageItem: UIImage(systemName: "questionmark.circle")!)
           ]
           return listItem
       }
}
