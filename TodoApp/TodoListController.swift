//
//  TableViewController.swift
//  TodoApp
//
//  Created by takematu ryo on 2017/09/27.
//  Copyright © 2017 RyukyuUniversity. All rights reserved.
//

import UIKit
import RealmSwift

var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate

class TodoListController: UITableViewController {
    
    let realm = try! Realm()
    
    @IBOutlet var todoListTable: UITableView!
    
    @IBAction func unwindToTop(segue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let todoCollection = realm.objects(Todo.self)
        // Realmに保存されているTodo型のobjectsを取得。
        
        return todoCollection.count // 総todo数を返している
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let todoCollection = realm.objects(Todo.self)
        // Realmに保存されているTodo型のobjectsを取得。
        let todo = todoCollection[indexPath.row]
        cell.textLabel?.text = todo.title
        
        return cell
    }
    
    // タスクを消す時に画面を更新する
    override func viewWillAppear(_ animated: Bool) {
        todoListTable.reloadData()
    }
    
    // タスクを削除する
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let todoCollection = realm.objects(Todo.self)
        try! realm.write {
            realm.delete(todoCollection[indexPath.row])
        }
        todoListTable.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let todoCollection = realm.objects(Todo.self)
        let todo = todoCollection[indexPath.row]
        appDelegate.todoName = todo.title
//        print(appDelegate.todoName)
        
    }
    
}
