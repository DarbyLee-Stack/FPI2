//
//  AddToDoViewController.swift
//  FinalProject
//
//  Created by Darby Lee-Stack on 7/30/20.
//  Copyright © 2020 Mia Yan. All rights reserved.
//

import UIKit

import CoreData

class AddToDoViewController: UIViewController {

    var previousToDoTVC = ToDoTableViewController ()
    
    @IBOutlet weak var descriptionInput: UITextField!
    @IBOutlet weak var switchInput: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        
        guard let accessToCoreData = 
        
        
        
        let newToDo = ToDoClass()
        
        if let checkForInput = descriptionInput.text {
            newToDo.description =  checkForInput
            newToDo.important = switchInput.isOn
        }

        previousToDoTVC.listOfToDo.append(newToDo)
        previousToDoTVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
