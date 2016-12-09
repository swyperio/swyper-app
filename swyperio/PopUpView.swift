//
//  PopUpView.swift
//  swyperio
//
//  Created by Jeremia Muhia on 12/8/16.
//  Copyright © 2016 NYU. All rights reserved.
//

import UIKit

class PopUpView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
   
    func createPopUp() {
        let datePicker: UIDatePicker = UIDatePicker()
        datePicker.frame = CGRect(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY, width: 100, height: 100)
        datePicker.datePickerMode = UIDatePickerMode.dateAndTime
    }

}
