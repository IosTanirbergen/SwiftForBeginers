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
        fetchBooks()
        setupBooks()
        
    }
    
    func fetchBooks() {
        print("fetching books...")
        if  let url =  URL(string: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json") {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("error JSON Books!",error)
                    return
                }
                guard let data = data else {return}
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    print(json)
                    
                    guard let bookDictionaries = json as? [[String : Any]] else {return}

                    for bookDictionary in bookDictionaries {
                        
                        let book = Book(dictionary: bookDictionary)
                        self.books?.append(book)
//                        if let title = bookDictionary["title"] as? String,
//                           let author = bookDictionary["author"] as? String{
//
//                            let book = Book(title: title, author: author, pages: [], image: #imageLiteral(resourceName: "Abay"))
//
//                            self.books?.append(book)
//                        }
                     
                        self.tableView.reloadData()
                        
                        
                    }
                    
                } catch let jsonError {
                    print("failed to parse JSON properly : ",jsonError)
                }
                
            }.resume()

        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBook = self.books?[indexPath.row]
        
        
        
        
        let layout = UICollectionViewFlowLayout()
        let bookPageController = BookPagerController(collectionViewLayout: layout)
        
        bookPageController.book = selectedBook
        
        let navigationController = UINavigationController(rootViewController: bookPageController )
        
       // present(navigationController, animated: true, completion:nil)
        self.present(navigationController,animated: true,completion: nil)
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! BookCell
        let book = books?[indexPath.row]
        cell.book = book
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = books?.count {
            return count
        }
        return 0
    }
    
    
    func setupBooks() {
        let book = Book(title: "Abay", author: "Tanirbergen", pages: [
            Page(number: 1, text: "FirstPage"),
            Page(number: 2, text: "secong page")
        ],image: #imageLiteral(resourceName: "Abay"))
        
        let book1 = Book(title: "Akhmet", author: "Tanirbergen", pages: [
            Page(number: 1, text: "FirstPage")
        ],image: #imageLiteral(resourceName: "Ахмет"))
        self.books = [book,book1]
    }


}

