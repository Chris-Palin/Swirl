//
//  userViewController.swift
//  Swirl
//
//  Created by Chris Palin on 4/6/18.
//  Copyright © 2018 Chris Palin. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class userViewController: UIViewController {

    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var nicknameLabel: UILabel!
    let album = userDetails()
    var iconImageData = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let album = userDetails()
        let userID = Auth.auth().currentUser?.uid
        
        Database.database().reference().child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            
            album.icon = value?["icon"] as? String ?? ""
            album.nickname = value?["nickname"] as? String ?? ""
            print(album.icon)
            
            self.iconImageData = album.icon
            self.nicknameLabel.text = album.nickname
            
            if let url = URL(string: self.iconImageData){
                
                do {
                    let data = try Data(contentsOf: url)
                    self.iconImage.image = UIImage(data: data)
                    
                }catch let err {
                    print(" Error : \(err.localizedDescription)")
                }
            }
            
        }) { (error) in
            print(error.localizedDescription)
            
            
            
        }
        
        iconImageData = album.icon
        if let url = URL(string: self.iconImageData){
            
            do {
                let data = try Data(contentsOf: url)
                self.iconImage.image = UIImage(data: data)
                
            }catch let err {
                print(" Error : \(err.localizedDescription)")
            }
        }

        
    
        iconImage.layer.cornerRadius = iconImage.frame.size.width / 2;
        iconImage.layer.masksToBounds = true
        
            
        // Do any additional setup after loading the view.
    }

  
    
    

}




