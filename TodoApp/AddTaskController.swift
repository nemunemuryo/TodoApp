//
//  ViewController.swift
//  taskApp
//
//  Created by takematu ryo on 2017/09/27.
//  Copyright © 2017 RyukyuUniversity. All rights reserved.
//

import UIKit
import RealmSwift

class AddTaskController: UIViewController, UITextFieldDelegate {
    
    // TextField
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // todoを追加するボタン
    @IBAction func createButton(_ sender: Any) {
        let realm = try! Realm()
        
        let todo = Todo()
        todo.title = textField.text!
        try! realm.write {
            realm.add(todo)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        return true
    }
    
}
