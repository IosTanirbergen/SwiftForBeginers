
import UIKit

class Book {
    
    let title : String
    let author : String
    let pages : [Page]
    let image : UIImage
    
    init(title: String,author : String,pages :[Page],image : UIImage) {
        self.title = title
        self.author = author
        self.pages = pages
        self.image = image
    }
    init(dictionary : [String : Any]) {
        self.title = dictionary["title"] as? String ?? ""
        self.author = dictionary["author"] as? String ?? ""
        image = #imageLiteral(resourceName: "Abay")
       
        
        var bookPages = [Page]()
        if let pagesDictionary = dictionary["pages"] as? [[String : Any]] {
            
          
            
            for pageDictionary in pagesDictionary {
                
                if let pageText = pageDictionary["text"] as? String {
                    
                    let page = Page(number: 1, text: pageText)
                    bookPages.append(page)
                }
            }
        }
        pages = bookPages
    }
}

class Page {
    let number : Int
    let text : String
    
    init(number: Int, text: String) {
        self.number = number
        self.text = text
    }
}
