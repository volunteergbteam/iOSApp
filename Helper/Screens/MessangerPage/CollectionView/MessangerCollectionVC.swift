//
//  MessangerCollectionVC.swift
//  Helper
//
//  Created by Евгений Шварцкопф on 31.05.2020.
//  Copyright © 2020 vTeam. All rights reserved.
//

import UIKit

class MessagerCollectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let textLabel = UILabel()
    
    let content = ["dasda", "dsada"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Сообщения"
        
        let writeMessageButton = UIBarButtonItem(image: UIImage(systemName: "envelope"), style: .plain, target: self, action: #selector(writeMessageButtonAction(_:)))
        
        self.navigationItem.rightBarButtonItem  = writeMessageButton
        
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
        
        if content.isEmpty {
            settingLabel()
        } else {
            collectionView.delegate = self
            collectionView.dataSource = self
            self.collectionView.register(UINib(nibName: "MessagerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MessagerCell")
        }
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MessagerCell", for: indexPath) as? MessagerCollectionViewCell else { return UICollectionViewCell() }
        cell.backgroundColor = CustomColor.shared.marineButton
        cell.layer.cornerRadius = 15
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 1, height: 1)
        cell.layer.shadowRadius = 1.0
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: 15).cgPath
        cell.renderCell()
        return cell
    }
    
}
