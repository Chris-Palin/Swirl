//
//  productViewController.swift
//  Akubra
//
//  Created by Chris Palin on 14/5/18.
//  Copyright © 2018 Chris Palin. All rights reserved.
//

import UIKit

class productViewController: UIViewController {

    @IBOutlet weak var categoryImage: UIImageView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var categoryBody: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    
    var category: [String: String]!
    var softwareInfo: [String: String]!
    var indexPath: IndexPath!
    
    @IBAction func dismiss(_ sender: Any) {
       dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryLabel.text = softwareInfo["Title"]
        categoryImage.image = UIImage(named: softwareInfo["Image"]!)
        categoryBody.text = softwareInfo["Caption"]
        
        
    }
    
    
    
    
}
