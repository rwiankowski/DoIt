//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Radoslaw Wiankowski on 19.02.2017.
//  Copyright © 2017 Radoslaw Wiankowski. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    var task : Task? = nil

    @IBOutlet weak var taskLabel: UILabel!
    @IBAction func completeButton(_ sender: Any) {
        
        let taskContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        taskContext.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        taskLabel.text = task!.name!
    }


}
