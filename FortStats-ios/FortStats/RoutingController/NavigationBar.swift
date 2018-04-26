//
//  NavigationBar.swift
//  FortStats
//
//  Created by Michael Handria on 4/25/18.
//  Copyright © 2018 Michael Handria. All rights reserved.
//

import UIKit

class NavigationBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //controllers declerations
        let homeController = HomeViewController()
        let weaponController = WeaponsViewController()
        
        //sub navigation controllers
        let profileSearchNav = UINavigationController(rootViewController: homeController)
        let weaponDetailNav = UINavigationController(rootViewController: weaponController)
        
        profileSearchNav.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "user.png")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "user.png"))
        weaponDetailNav.tabBarItem = UITabBarItem(title: "Weapons", image: UIImage(named: "weapon.png")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "weapon.png"))
        
        
        let color : UIColor = UIColor.black
        let titleFont : UIFont = UIFont(name: "LuckiestGuy-Regular", size: 12.0)!
        
        let attributes = [
            NSAttributedStringKey.foregroundColor : color,
            NSAttributedStringKey.font : titleFont
        ]
        
        profileSearchNav.tabBarItem.setTitleTextAttributes(attributes, for: .normal)
        weaponDetailNav.tabBarItem.setTitleTextAttributes(attributes, for: .normal)
        
        viewControllers = [profileSearchNav, weaponDetailNav]
        
        style()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func style(){
        self.tabBar.tintColor = .black
        self.tabBar.barTintColor = .white
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
