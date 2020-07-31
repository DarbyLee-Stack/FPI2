//
//  ToDoTableViewController.swift
//  FinalProject
//
//  Created by Darby Lee-Stack on 7/30/20.
//  Copyright © 2020 Mia Yan. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var listOfToDo : [ToDoClass] = []
    
    func createToDo() -> [ToDoClass] {
        
        let task1 = ToDoClass()
        task1.description = "Don't use single-use plastic"
        
        let task2 = ToDoClass()
        task2.description = "Take public transportation"
        
        return [task1, task2]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listOfToDo = createToDo()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfToDo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let eachToDo = listOfToDo[indexPath.row]
        
        if eachToDo.important {
            cell.textLabel?.text = "❗️" + eachToDo.description
        } else {
            cell.textLabel?.text = eachToDo.description
        }
        
        return cell

    }

   
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextAddToDoVC = segue.destination as?
            AddToDoViewController {
            nextAddToDoVC.previousToDoTVC = self
        }
        
        if let nextCompletedToDoVC = segue.destination as? CompletedToDoViewController {
             if let choosenToDo = sender as? ToDoClass {
                  nextCompletedToDoVC.selectedToDo = choosenToDo
                  nextCompletedToDoVC.previousToDoTVC = self
             }
        }
        
}
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

         // this gives us a single ToDo
         let eachToDo = listOfToDo[indexPath.row]

         performSegue(withIdentifier: "moveToCompletedToDoVC", sender: eachToDo)
    }
    

}

