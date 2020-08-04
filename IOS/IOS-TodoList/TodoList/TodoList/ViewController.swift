//
//  ViewController.swift
//  TodoList
//
//  Created by Andre Mejia on 2020-05-05.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CellDelegate, NewTaskDelegate {
    
    var tasks: [Task] = []
    var selectedTask: Task?
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskViewCell
        
        cell.task = tasks[indexPath.row]
        cell.delegate = self
        cell.taskName.text = cell.task.name
        cell.taskPriority.text = String(cell.task.priority)
        if cell.task.isCompleted {
            let attributedString = NSMutableAttributedString(string: cell.task.info)
            attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length))
            cell.taskInfo.attributedText = attributedString
            cell.checkButton.setImage(UIImage(named: "circleChecked"), for: .normal)
        } else {
            cell.taskInfo.attributedText = nil
            cell.taskInfo.text = cell.task.info
            cell.checkButton.setImage(UIImage(named: "circle"), for: .normal)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TaskViewCell
        selectedTask = cell.task
        performSegue(withIdentifier: "detailsSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = tasks[sourceIndexPath.row]
        tasks.remove(at: sourceIndexPath.row)
        tasks.insert(temp, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func updateTask(_ Row: Int) {
        tasks[Row].isCompleted.toggle()
        tableView.reloadData()
    }
    
    func addTask(_ Task: Task) {
        tasks.append(Task)
        tableView.reloadData()
    }
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        tableView.isEditing.toggle()
        sender.title = tableView.isEditing ? "Done" : "Edit"
    }
    
    @IBAction func sortButtonTapped(_ sender: UIBarButtonItem) {
       tasks = tasks.sorted(by: { $0.priority > $1.priority })
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
            let detailsViewController = segue.destination as! DetailsViewController
            detailsViewController.task = selectedTask
        } else if segue.identifier == "newTaskSegue" {
            let newTaskVC = segue.destination as! NewTaskViewController
            newTaskVC.delegate = self
        }
    }
}

