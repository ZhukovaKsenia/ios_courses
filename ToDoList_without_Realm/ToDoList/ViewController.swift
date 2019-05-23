//
//  ViewController.swift
//  ToDoList
//
//  Created by Ksenia on 16/03/2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //ответить на вопрос про unwrap
    var todos = [String]()
  //  @IBOutlet private var tableView: UITableView!
    @IBOutlet weak var tableView: UITableView!
    private let identifier = "cell"
    private let todosKey = "todosKey"
    
    override func viewDidLoad(){
        super.viewDidLoad()
        tableView.dataSource = self
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTodo))
        navigationItem.rightBarButtonItem = addItem
        let savedTodos = UserDefaults.standard.array(forKey: todosKey) as? [String]
        guard let savedTodosUnwrapped = savedTodos else { return }
        todos = savedTodosUnwrapped
    }
    
    func saveTodo(_ todo: String) {
        self.todos.append(todo)
        UserDefaults.standard.set(todos, forKey: todosKey)
        self.tableView.reloadData()
    }
    
    @objc func addTodo() {
        let alert = UIAlertController(title: "Add", message: "Add to todo", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            if let todoText = alert.textFields?.first?.text {
               self.saveTodo(todoText)
            }
        }
        alert.addAction(addAction)
        alert.addTextField { textField in
            textField.placeholder = "Type your todo"
        }
        present(alert, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = todos[indexPath.row]
        return cell
    }
}
