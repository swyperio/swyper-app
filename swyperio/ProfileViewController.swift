//
//  FirstViewController.swift
//  swyperio
//
//  Created by Jeremia Muhia on 11/21/16.
//  Copyright © 2016 NYU. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    var user = FIRAuth.auth()?.currentUser
    var databaseRef = FIRDatabase.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userID = FIRAuth.auth()?.currentUser?.uid

        var refHandle = self.databaseRef.child("user_profile").child(userID!).observe(FIRDataEventType.value, with: { (snapshot) in
            let usersDict = snapshot.value as? NSDictionary
            print(type(of: usersDict))
            print(usersDict)
            let email = usersDict?["email"] as? String
            //let userDetails = usersDict.object(forKey: self.user!.uid) as AnyObject?
            print(email)
            self.emailLabel.text = email
            
        })
        
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didTapChangePhoto(_ sender: AnyObject) {

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

