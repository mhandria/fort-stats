//
//  ViewController.swift
//  FortStats
//
//  Created by Michael Handria on 4/22/18.
//  Copyright © 2018 Michael Handria. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    let logo: UILabel = {
        let label = UILabel()
        label.text = "FortStats"
        label.font = UIFont(name: "LuckiestGuy-Regular", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let searchBar: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 8.0
        
        let padding = CGRect(x:0,y:0,width:10,height:0)
        textField.leftView = UIView(frame: padding)
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "platform:username"
        textField.autocapitalizationType = .none
        textField.autocorrectionType = UITextAutocorrectionType.no
        return textField
    }()
    
    //let bottomNav: NavigationBar = NavigationBar()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addChildViews()
        configureLayout()
        searchBar.delegate = self
        //self.title = "profile"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField.text!.contains(":")){
            print("do something")
            view.endEditing(true)
            let arr = textField.text?.split(separator: ":").map(String.init)
            let nextPage = ProfileViewController(_platform: arr![0], _username: arr![1])
            if(navigationController == nil){print("NOT GONNA HAPPEN BUDDY")}
            textField.text = ""
            navigationController?.pushViewController(nextPage, animated: true)
            return true
        }
        return false
    }
    

    
    private func addChildViews(){
        view.addSubview(logo)
        view.addSubview(searchBar)
        //view.addSubview(bottomNav)
    }
    
    
    
    private func configureLayout(){
        //configurea layout for logo
        logo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        //configure layout for searchBar
        searchBar.topAnchor.constraint(equalTo: logo.bottomAnchor).isActive = true
        searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 30).isActive = true
        searchBar.widthAnchor.constraint(equalTo: logo.widthAnchor, constant: 100).isActive = true
        
        
    }
}

