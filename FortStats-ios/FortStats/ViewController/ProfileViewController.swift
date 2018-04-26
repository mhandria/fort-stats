//
//  ProfileViewController.swift
//  FortStats
//
//  Created by Michael Handria on 4/25/18.
//  Copyright © 2018 Michael Handria. All rights reserved.
//

import UIKit
import Alamofire

class ProfileViewController: UIViewController {
    
    var platform: String
    var username: String

    let infoDetailsTest : UILabel = {
        let label = UILabel()
        label.text = "<No Platform>:<No Username>"
        label.font = UIFont(name: "LuckiestGuy-Regular", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(_platform: String, _username: String) {
        self.platform = _platform
        self.username = _username
        self.infoDetailsTest.text = "\(_platform):\(_username)"
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViews()
        configureLayout()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = true
        fetchProfileData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func addChildViews(){
        view.addSubview(infoDetailsTest)
    }
    
    private func configureLayout(){
        infoDetailsTest.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoDetailsTest.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func fetchProfileData(){
        
        let _url = "https://api.fortnitetracker.com/v1/profile/\(self.platform)/\(self.username)"
        let headers: HTTPHeaders = ["TRN-Api-Key": "076959cd-1f88-4418-8672-a4f1ae4b06e0", "Accept": "application/json"]
        Alamofire.request(_url, method: .get, headers: headers).responseString { response in
            
            debugPrint(response)
            //TODO: populate to table for neat view here 
        }
        
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
