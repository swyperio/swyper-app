//
//  CreateServiceViewController.swift
//  swyperio
//
//  Created by Jeremia Muhia on 11/21/16.
//  Copyright © 2016 NYU. All rights reserved.
//

import UIKit

class CreateServiceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var serviceDetailTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.serviceDetailTable.register(UITableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        
        serviceDetailTable.delegate = self
        serviceDetailTable.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
        let row = indexPath.row
        
        cell.textLabel?.text = ["TEST NAME", "TEST DATE"][row]
        return cell
    }
    
    // table view cells should include a section for full name and time of swipe

    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
