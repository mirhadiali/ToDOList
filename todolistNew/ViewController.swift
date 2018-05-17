//
//  ViewController.swift
//  todolistNew
//
//  Created by Hadi Ali on 18/04/2018.
//  Copyright © 2018 Hadi Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, sendMessage {
    func sendMessageToReciever(message: String) {
        self.arr.append(message)
        self.table.reloadData()
    }
    

    @IBOutlet weak var table: UITableView!
    var arr = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = arr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            arr.remove(at: indexPath.row)
            tableView.reloadData()
        }
       
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addNew" {
            let dest = segue.destination as! SecondViewController
            dest.delegate = self
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

