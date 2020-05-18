//
//  TabViewController.swift
//  Helper
//
//  Created by Kolchedantsev Alexey on 16.05.2020.
//  Copyright © 2020 vTeam. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialBottomNavigation_Theming

class TabViewController: UITabBarController, MDCBottomNavigationBarDelegate {
    
    let bottomNavBar = MDCBottomNavigationBar()
    let colors = CustomColor.shared
    let containerScheme = MDCContainerScheme()
    let surfaceScheme = MDCContainerScheme()
    
    override func viewDidLoad() {
        // Set colors
        let colorScheme = MDCSemanticColorScheme()
        colorScheme.primaryColor = colors.blueButton
        containerScheme.colorScheme = colorScheme
        bottomNavBar.applyPrimaryTheme(withScheme: containerScheme)
        bottomNavBar.tintColor = .white
        bottomNavBar.selectedItemTitleColor = .white
        bottomNavBar.shadowColor = .clear
        
        view.backgroundColor = colorScheme.backgroundColor
        
        // Set view controllers
        let profileVC = ProfileViewController()
        let navController = UINavigationController(rootViewController: MainPageViewController())
        let massangerVC = MassangerViewController()
        viewControllers = [profileVC, navController, massangerVC]
        
        // Set tabBarItems
        let tabBarItem1 = UITabBarItem(title: "Мой профиль", image: UIImage(named: "person_img"), tag: 0)
        let tabBarItem2 = UITabBarItem(title: "Карта", image: UIImage(named: "map_img"), tag: 1)
        let tabBarItem3 = UITabBarItem(title: "Сообщения", image: UIImage(named: "email_img"), tag: 2)
        bottomNavBar.items = [tabBarItem1, tabBarItem2, tabBarItem3]
        bottomNavBar.selectedItem = tabBarItem2
        selectedViewController = viewControllers![1]
        view.addSubview(bottomNavBar)
        bottomNavBar.delegate = self
    }
    
    
    func bottomNavigationBar(_ bottomNavigationBar: MDCBottomNavigationBar, didSelect item: UITabBarItem){
        guard let fromView = selectedViewController?.view, let toView = customizableViewControllers?[item.tag].view else { return }
        if fromView != toView {
            UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.transitionCrossDissolve], completion: nil)
        }
        
        self.selectedIndex = item.tag
        self.selectedViewController = self.viewControllers![item.tag]
    }
    
    func layoutBottomNavBar() {
        let size = bottomNavBar.sizeThatFits(view.bounds.size)
        let bottomNavBarFrame = CGRect(x: 0,
                                       y: view.bounds.height - size.height - view.safeAreaInsets.bottom,
                                       width: size.width,
                                       height: size.height + view.safeAreaInsets.bottom)
        bottomNavBar.frame = bottomNavBarFrame
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layoutBottomNavBar()
    }
}
