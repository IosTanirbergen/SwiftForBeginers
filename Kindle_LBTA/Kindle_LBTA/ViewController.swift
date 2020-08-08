//
//  ViewController.swift
//  Kindle_LBTA
//
//  Created by Devnull on 8/5/20.
//  Copyright © 2020 Devnull. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var books : [Book]?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Tanirbergen"
        tableView.register(BookCell.self, forCellReuseIdentifier: "cellid")
        tableView.tableFooterView = UIView()
        
        setupBooks()
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
//        let book = books?[indexPath.row]
//        cell.textLabel?.text = book?.title
//        cell.imageView?.image = book?.image
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = books?.count {
            return count
        }
        return 0
    }
    
    
    func setupBooks() {
        let book = Book(title: "IosCoding", author: "Tanirbergen", pages: [
            Page(number: 1, text: "text for the first page")
        ],image: #imageLiteral(resourceName: "Abay"))
        
        let book1 = Book(title: "So i'm good!", author: "Tanirbergen", pages: [
            Page(number: 1, text: "text for the first page")
        ],image: #imageLiteral(resourceName: "Ахмет"))
        self.books = [book,book1]
    }


}

