//
//  addTaskViewController.swift
//  DoIt
//
//  Created by Radoslaw Wiankowski on 17.02.2017.
//  Copyright © 2017 Radoslaw Wiankowski. All rights reserved.
//

import UIKit

class addTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskImportantSwitch: UISwitch!
        
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addButton(_ sender: Any) {
        //Cereate a new Task
        
        let taskContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = Task(context: taskContext)
        task.name = taskNameTextField.text!
        task.important = taskImportantSwitch.isOn
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //Pop view controller
        navigationController!.popViewController(animated: true)
        
    }
    

}
