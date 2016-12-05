//
//  FirstViewController.swift
//  swyperio
//
//  Created by Jeremia Muhia on 11/21/16.
//  Copyright © 2016 NYU. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapSignOut(_ sender: UIButton) {
    
        let firebaseAuth = FIRAuth.auth()
        
        do {
        
            try firebaseAuth?.signOut()
            AppState.sharedInstance.signedIn = false
            // dismiss(animated: true, completion: nil)
            self.performSegue(withIdentifier: "signOutSegue", sender: nil)
        }
        catch let signOutError as NSError {
            print("ERROR OCCURRED AT SIGN OUT", signOutError.localizedDescription)
        }
    }
    
    @IBAction func doneCreateService(segue: UIStoryboardSegue) {
    }
    
    @IBAction func cancelCreateService(seuge: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}

