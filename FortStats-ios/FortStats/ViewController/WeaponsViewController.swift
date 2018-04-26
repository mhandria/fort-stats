//
//  WeaponsViewController.swift
//  FortStats
//
//  Created by Michael Handria on 4/26/18.
//  Copyright © 2018 Michael Handria. All rights reserved.
//

import UIKit

class WeaponsViewController: UIViewController {
    
    let weaponTitle: UILabel = {
        let label = UILabel()
        label.text = "Weapons"
        label.font = UIFont(name: "LuckiestGuy-Regular", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildView()
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func addChildView(){
        view.addSubview(weaponTitle)
    }
    
    private func configureView(){
        weaponTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        weaponTitle.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        weaponTitle.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

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
