//
//  CreateEventViewController.swift
//  swyperio
//
//  Created by Jason Yao on 12/12/16.
//  Copyright © 2016 NYU. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Outlets
    @IBOutlet weak var tblExpandable: UITableView!
    
    // MARK: Custom logic for the table view
    var visibleRowsPerSection = [[Int]]()
    var cellDescriptors: NSMutableArray!
    
    // Contains and loads all the cell descriptions
    func loadCellDescriptors() {
        if let path = Bundle.main.path(forResource: "eventCellDescriptors", ofType: "plist") {
            cellDescriptors = NSMutableArray(contentsOfFile: path)
            getIndicesOfVisibleRows()
            tblExpandable.reloadData()
        }
        print("Event creation table view: Cell descriptors are now loaded")
    } // End of the loadCellDescriptors method
    
    // Sets up the table view
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureTableView()
        loadCellDescriptors()
    } // End of the viewWillAppear method
    
    func configureTableView() {
        tblExpandable.delegate = self
        tblExpandable.dataSource = self
        tblExpandable.tableFooterView = UIView(frame: CGRect.zero)
        
        tblExpandable.register(UINib(nibName: "NormalCell", bundle: nil), forCellReuseIdentifier: "IDNormalCell")
        tblExpandable.register(UINib(nibName: "TextfieldCell", bundle: nil), forCellReuseIdentifier: "IDTextfieldCell")
        tblExpandable.register(UINib(nibName: "DatePickerCell", bundle: nil), forCellReuseIdentifier: "IDDatePickerCell")
        tblExpandable.register(UINib(nibName: "ValuePickerCell", bundle: nil), forCellReuseIdentifier: "IDValuePickerCell")
        print("Event creation table view: Table is now configured")
    } // End of the configureTableView function
    
    // MARK: Helper functions
    func getIndicesOfVisibleRows() {
        visibleRowsPerSection.removeAll()
        
        for currentSectionCells in cellDescriptors {
            var visibleRows = [Int]()
            let rowSize = ((currentSectionCells as! [[String: AnyObject]]).count - 1)

            for row in 0...rowSize {
                let isVisible = (currentSectionCells as! [[String: AnyObject]])[row]["isVisible"] as! Bool
                if isVisible == true { // Note since the swift compiler is shit we need to separate out this variable
                    visibleRows.append(row)
                }
            } // End of iterating through all rows
            visibleRowsPerSection.append(visibleRows)
        } // End of iterating through all sections
    } // End of the getIndicesOfVisibleRows function
    
    
    func getCellDescriptorForIndexPath(indexPath: NSIndexPath) -> [String: AnyObject] {
        let indexOfVisibleRow = visibleRowsPerSection[indexPath.section][indexPath.row]
        let cellDescriptor = (cellDescriptors[indexPath.section] as! [NSDictionary])[indexOfVisibleRow] as! [String: AnyObject]
        return cellDescriptor
    }

   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCellDescriptor = getCellDescriptorForIndexPath(indexPath: indexPath as NSIndexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: currentCellDescriptor["cellIdentifier"] as! String, for: indexPath) as! CustomCell
        
        print("Event creation table view: currentCellDescriptor is: \(currentCellDescriptor)")
        
        if currentCellDescriptor["cellIdentifier"] as! String == "IDNormalCell" {
            if let primaryTitle = currentCellDescriptor["primaryTitle"] {
                cell.textLabel?.text = primaryTitle as? String
            }
            
            if let secondaryTitle = currentCellDescriptor["secondaryTitle"] {
                cell.detailTextLabel?.text = secondaryTitle as? String
            }
        }
        else if currentCellDescriptor["cellIdentifier"] as! String == "IDTextfieldCell" {
            cell.textField.placeholder = currentCellDescriptor["primaryTitle"] as? String
        }
        else if currentCellDescriptor["cellIdentifier"] as! String == "IDDatePicker" {
            cell.textLabel?.text = currentCellDescriptor["primaryTitle"] as? String
        }
        else if currentCellDescriptor["cellIdentifier"] as! String == "IDStringPicker" {
            cell.textLabel?.text = currentCellDescriptor["primaryTitle"] as? String
        }
        
        return cell
    } // End of the tableView method
    
    // MARK: UITableView Delegate and Datasource Functions
    func numberOfSections(in tableView: UITableView) -> Int {
        if cellDescriptors != nil {
            print("Event creation table view: Number of sections set to \(cellDescriptors.count)")
            return cellDescriptors.count
        }
        else {
            print("Event creation table view: Number of sections set to 0")
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Event creation table view: Setting the number of rows in the section to be: \(visibleRowsPerSection[section].count)")
        return visibleRowsPerSection[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print("Event creation table view: Setting the header title to be: Swype an event")
        return "Swype an event"
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentCellDescriptor = getCellDescriptorForIndexPath(indexPath: indexPath as NSIndexPath)
        
        print("Event creation table view: Setting the row length to be: ")
        
        switch currentCellDescriptor["cellIdentifier"] as! String {
        case "NormalCell":
            print("60.0")
            return 60.0
        case "StringPickerCell":
            print("270.0")
            return 270.0
        case "DatePickerCell":
            print("270.0")
            return 270.0
        default:
            print("44.0")
            return 44.0
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    

    
    // MARK: Default table view controller functions below
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
