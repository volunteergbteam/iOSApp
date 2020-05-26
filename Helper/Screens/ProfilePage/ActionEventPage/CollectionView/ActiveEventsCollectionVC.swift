//
//  ActiveEventsCollectionVC.swift
//  Helper
//
//  Created by Kolchedantsev Alexey on 27.05.2020.
//  Copyright © 2020 vTeam. All rights reserved.
//

import UIKit

class ActiveEventsCollectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "ActiveEventCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "activeEventsCell")
        
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "activeEventsCell", for: indexPath) as? ActiveEventCollectionViewCell else { return UICollectionViewCell() }
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 15
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 1, height: 1)
        cell.layer.shadowRadius = 1.0
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: 15).cgPath
        return cell
    }
}
