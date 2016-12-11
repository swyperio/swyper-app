//
//  CreateServiceViewController.swift
//  swyperio
//
//  Created by Jeremia Muhia on 11/21/16.
//  Copyright © 2016 NYU. All rights reserved.
//

import UIKit
import MapKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class CreateServiceViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,
    // Note: A service requires the following:
    // String: Event name <-- only required if an event, otherwise defaults to the host user's name
    // CLLocation: The location of the event (we'll have a global map of string->CLLocation). Instantiate one via CLLocation(latitude: 40.729508, longitude: -73.997181).
    // Date: startTime
    // If a user: let startTime = NSDate()
    // If an event organiser: let startTime = some input from a datepicker
    // Date: endTime
    // If a user: let endTime = NSDate(timeIntervalSinceReferenceDate: 3600.0) // Sets a default endTime of 1 person
    // If an event organiser: let endTime = some input from a datepicker, or just show how of a duration in hours, calculate the endTime, and save that value
    // int: maxReservations <-- some maximum number of people that can "reserve" a spot on the event
    
UINavigationControllerDelegate {
    // @IBOutlet weak var serviceDetailTable: UITableView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBOutlet weak var endTimeTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    var user = FIRAuth.auth()?.currentUser
    
    
    let datePickerView: UIDatePicker = UIDatePicker()//= CGRect(x: UIScreen.main.bounds.midX - 150, y: UIScreen.main.bounds.midY - 150, width: 300, height: 300))
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField === dateTextField {
            // add a subview that is a custom subclass of UIViewController
            self.datePickerView.frame = CGRect(x: UIScreen.main.bounds.midX - 175, y: UIScreen.main.bounds.midY - 100, width: 350, height: 200)
            self.datePickerView.datePickerMode = UIDatePickerMode.dateAndTime
            self.datePickerView.backgroundColor = UIColor.gray
            self.view.addSubview(datePickerView)
            return false
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        // Do any additional setup after loading the view.
        /*
         self.serviceDetailTable.register(UITableViewCell.self, forCellReuseIdentifier: "nameCell")
         
         serviceDetailTable.delegate = self
         serviceDetailTable.dataSource = self
         
         serviceDetailTable.setNeedsLayout()
         serviceDetailTable.layoutIfNeeded()
         */
        dateTextField.delegate = self
        //let tapGesture = UITapGestureRecognizer(target: self, action: Selector(("tapOutsideDatePicker:")))
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CreateServiceViewController.tapOutsideDatePicker))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func tapOutsideDatePicker() {
        
        self.datePickerView.isHidden = true
        self.dateTextField.text = "\(self.datePickerView.date)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapDoneButton(_ sender: AnyObject) {
        print("tapping done button")
        
        
    }
    
    //function for uploading an event to firebase
    
    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
