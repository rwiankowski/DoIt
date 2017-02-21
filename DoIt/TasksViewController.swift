//
//  TaskViewController.swift
//  DoIt
//
//  Created by Radoslaw Wiankowski on 17.02.2017.
//  Copyright © 2017 Radoslaw Wiankowski. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var taskTableView: UITableView!
    
    var tasks : [Task] = []
    var selectedIndex = 0
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        taskTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        taskTableView.dataSource = self
        taskTableView.delegate = self
        
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.important {
            
            cell.textLabel?.text = "❗️ \(task.name!)"
            
        }
        else {
            cell.textLabel?.text = task.name!
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    

    @IBAction func addTask(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    func getTasks() {
        
        let taskContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            tasks = (try taskContext.fetch(Task.fetchRequest()) as! [Task])
            print(tasks)
        }
        catch {
            print("An error ocurred")
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task

        }
    }
}
