//
//  loginViewController.swift
//  Swirl
//
//  Created by Chris Palin on 3/6/18.
//  Copyright © 2018 Chris Palin. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class loginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    
    var signupMode = false
    
    
    @IBOutlet weak var leftSwap: UIButton!
    @IBOutlet weak var rightSwap: UIButton!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        nicknameTextField.isHidden = true
        
            // ...
        }
    
    
    @IBAction func leftPressed(_ sender: Any) {
        let email = emailTextField.text
        let password = passwordTextField.text
        
        
        if signupMode == false {
            
            Auth.auth().signIn(withEmail: email!, password: password!) { (authResult, error) in
                if let error = error {
                    //Present the error alert
                    self.presentAlert(alert: error.localizedDescription)
                } else {
                    
                   
                    
                    
                    
                    //Successful Login
                    print("Successful Login")
                    //Segue to the next view controller
                    self.performSegue(withIdentifier: "main", sender: nil)
                }
            }
        } else {
            
            Auth.auth().createUser(withEmail: email!, password: password!) { (user, error) in
                if let error = error {
                    self.presentAlert(alert: error.localizedDescription)
                } else {
                    let user = Auth.auth().currentUser
                    if let user = user {
                        Database.database().reference().child("users").child(user.uid ).child("email").setValue(user.email)
                        
                        Database.database().reference().child("users").child(user.uid).child("nickname").setValue(self.nicknameTextField.text)
                        
                        print("Successful Sign Up")
                        self.performSegue(withIdentifier: "main", sender: nil)
                    }
                    

                }
            }
            
        }
        
        
        
    }
    
    
    @IBAction func rightPressed(_ sender: Any) {
        if signupMode == false {
            //Switch to login
            nicknameTextField.isHidden = false
            signupMode = true
            leftSwap.setTitle("Signup", for: .normal)
            rightSwap.setTitle("Switch to Login", for: .normal)
        } else {
            //Switch to Sign Up
            nicknameTextField.isHidden = true
            signupMode = false
            leftSwap.setTitle("Login", for: .normal)
            rightSwap.setTitle("Switch to Signup", for: .normal)
        }
        
    }
    
    
    func presentAlert(alert:String){
        
        //Create the specific alert title and message
        let alertVC = UIAlertController(title: "Error", message: alert, preferredStyle: .alert)
        //Create the okAction which is the Ok button within the alert
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            alertVC.dismiss(animated: true, completion: nil)
        }
        
        //Add the action (or button) to the alert
        alertVC.addAction(okAction)
        
        //Present the alert as animated
        present(alertVC, animated: true, completion: nil)
        
    }
    
    
    // Do any additional setup after loading the view.
}



   
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

class userDetails {
    var email = ""
    var uid = ""
    var nickname = ""
    var icon = ""
    
}
