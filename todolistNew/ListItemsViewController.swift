//
//  ViewController.swift
//  todolistNew
//
//  Created by Hadi Ali on 18/04/2018.
//  Copyright © 2018 Hadi Ali. All rights reserved.
//

import UIKit


class ListItemsViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, sendMessage {
    func sendMessageToReciever(message: String) {
        self.list.append(message)
        self.table.reloadData()
    }
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    @IBOutlet weak var table: UITableView!
    var list = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navBar.rightBarButtonItem = self.editButtonItem
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.table.setEditing(editing, animated: animated)
    }
    
    
    //  exchanging rows in a table view
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let   rowToBeExchanged = list[sourceIndexPath.row]
        list.remove(at: sourceIndexPath.row)
        list.insert(rowToBeExchanged, at: destinationIndexPath.row)
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //  adding text to tableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = list[indexPath.row]
        
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    //for editing actions in row
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // edit button
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
            let alert = UIAlertController(title: "", message: "Edit list item", preferredStyle: .alert)
            alert.addTextField(configurationHandler: { (textField) in
                textField.text = self.list[indexPath.row]
            })
            alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { (updateAction) in
                self.list[indexPath.row] = alert.textFields!.first!.text!
                self.table.reloadRows(at: [indexPath], with: .fade)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: false)
        })
        // delete button
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            self.list.remove(at: indexPath.row)
            tableView.reloadData()
        })
        
        return [deleteAction, editAction]
    }
    
    //marking the rows
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if table.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark{
            table.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        }
        else{
            table.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addNew" {
            let dest = segue.destination as! AddItemsViewController
            dest.delegate = self
        }
    }
    
    
    
    
}

