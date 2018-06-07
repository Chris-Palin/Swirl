//
//  homeViewController.swift
//  Akubra
//
//  Created by Chris Palin on 12/5/18.
//  Copyright © 2018 Chris Palin. All rights reserved.
//

import UIKit

class homeViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var heroView: UIView!
    @IBOutlet weak var appLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        logoImage.alpha = 0
        
        UIView.animate(withDuration: 10) {
            self.logoImage.alpha = 1
        }
   
        // Do any additional setup after loading the view.
    }

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            
            heroView.transform = CGAffineTransform(translationX: 0, y: offsetY)
            aboutView.transform = CGAffineTransform(translationX: 0, y: offsetY)
            logoImage.transform = CGAffineTransform(translationX: 0, y: -offsetY/3)
            appLabel.transform = CGAffineTransform(translationX: 0, y: -offsetY/10)
            backgroundImageView.transform = CGAffineTransform(translationX: 0, y: -offsetY/3)
        }
    }
    
 
}

    


