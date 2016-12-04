//
//  LogInViewController.swift
//  swyperio
//
//  Created by Jeremia Muhia on 11/21/16.
//  Copyright © 2016 NYU. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapSignIn(_ sender: AnyObject?) {
    
        let email: String = emailTextField.text!
        let pasword: String = passwordTextField.text!
        
        guard email != "" && pasword != ""
        else {
            let invalidEmailOrPasswordAlert = UIAlertController(title: "Invalid Email or Password", message: "The email or password you gave is invalid", preferredStyle: UIAlertControllerStyle.alert)
            invalidEmailOrPasswordAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(invalidEmailOrPasswordAlert, animated: true, completion: nil)
            return
        }
        
        performSegue(withIdentifier: "signInSegue", sender: nil)
    }
    
    @IBAction func signOut(segue: UIStoryboardSegue) {
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
