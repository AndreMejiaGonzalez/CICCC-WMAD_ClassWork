//
//  TaskViewCell.swift
//  TodoList
//
//  Created by Andre Mejia on 2020-05-05.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

import UIKit

protocol CellDelegate {
    func updateTask(_ Row: Int)
}

class TaskViewCell: UITableViewCell {
    var task: Task!
    @IBOutlet var taskName: UILabel!
    @IBOutlet var taskInfo: UILabel!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var taskPriority: UILabel!
    
    var delegate: CellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(toggleTaskFlag))
        addGestureRecognizer(swipeGesture)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func toggleTaskFlag() {
        task.isCompleted.toggle()
        let tableView = self.superview as! UITableView
        let row = tableView.indexPath(for: self)?.row
        delegate?.updateTask(row!)
    }
    
    @IBAction func checkButtonTapped(_ sender: UIButton) {
        toggleTaskFlag()
    }
}
