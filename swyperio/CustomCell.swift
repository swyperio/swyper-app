//
//  CustomCell.swift
//  swyperio
//
//  Created by Jason Yao on 12/12/16.
//  Copyright © 2016 NYU. All rights reserved.
//

import Foundation

import UIKit

protocol CustomCellDelegate {
    func dateWasSelected(_ selectedDateString: String)
    func textfieldTextWasChanged(_ newText: String, parentCell: CustomCell)
}

class CustomCell: UITableViewCell, UITextFieldDelegate {
    
    // MARK: IBOutlet Properties
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var textField: UITextField!
    
    // MARK: Constants
    let bigFont = UIFont(name: "Avenir-Book", size: 17.0)
    let smallFont = UIFont(name: "Avenir-Light", size: 17.0)
    let primaryColor = UIColor.black
    let secondaryColor = UIColor.lightGray
    
    // MARK: Variables
    var delegate: CustomCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if textLabel != nil {
            textLabel?.font = bigFont
            textLabel?.textColor = primaryColor
        }
        
        if detailTextLabel != nil {
            detailTextLabel?.font = smallFont
            detailTextLabel?.textColor = secondaryColor
        }
        
        if textField != nil {
            textField.font = bigFont
            textField.delegate = self
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    // MARK: IBAction Functions
    
    @IBAction func setDate(_ sender: AnyObject) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        let dateString = dateFormatter.string(from: datePicker.date)
        
        if delegate != nil {
            delegate.dateWasSelected(dateString)
        }
    }
    
    // MARK: UITextFieldDelegate Function
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if delegate != nil {
            delegate.textfieldTextWasChanged(textField.text!, parentCell: self)
        }
        
        return true
    }
    
}
