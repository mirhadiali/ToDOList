//
//  SecondViewController.swift
//  todolistNew
//
//  Created by Hadi Ali on 18/04/2018.
//  Copyright © 2018 Hadi Ali. All rights reserved.
//

import UIKit
protocol sendMessage {
    func sendMessageToReciever(message: String)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    var delegate : sendMessage? = nil
    @IBAction func add(_ sender: Any) {
        if textField.text != ""{
        self.delegate?.sendMessageToReciever(message: textField.text!)
            textField.text = ""
            self.dismiss(animated: true, completion: nil)
        }
       
    }
    @IBAction func cancel(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
   
    

   

}
