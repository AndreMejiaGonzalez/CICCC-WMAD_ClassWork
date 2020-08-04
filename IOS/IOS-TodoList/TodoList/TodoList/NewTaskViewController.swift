//
//  NewTaskViewController.swift
//  TodoList
//
//  Created by Andre Mejia on 2020-05-07.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

import UIKit

protocol NewTaskDelegate {
    func addTask(_ Task:Task)
}

class NewTaskViewController: UIViewController {
    
    @IBOutlet var nameTextBar: UITextField!
    @IBOutlet var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet var infoTextView: UITextView!
    
    var delegate: NewTaskDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTextView.layer.borderWidth = 1.0
        infoTextView.layer.borderColor = UIColor.gray.cgColor
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if nameTextBar.text! != "" {
            delegate?.addTask(Task(name: nameTextBar.text!, info: infoTextView.text!, priority: prioritySegmentedControl.selectedSegmentIndex + 1, isCompleted: false))
            super.dismiss(animated: true, completion: nil)
        }
    }
}
