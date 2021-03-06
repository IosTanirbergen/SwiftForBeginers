//
//  BookCell.swift
//  Kindle_LBTA
//
//  Created by Devnull on 8/5/20.
//  Copyright © 2020 Devnull. All rights reserved.
//

import UIKit


class BookCell: UITableViewCell {
    var book : Book? {
        didSet {
            coverImageView.image = book?.image
            authorLabel.text = book?.author
            titleLabel.text = book?.title
        }
    }
    
   private let coverImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = #imageLiteral(resourceName: "Abay")
        return image
    }()
    
   private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Tanirbergen Kaldibai IOS Developer graduate of IITU , is Aktau"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   private let authorLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tanirbergen Kaldibai IOS Developer graduate of IITU, is Aktau"
        return label
        
    }()
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(coverImageView)
        coverImageView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 8).isActive = true
        coverImageView.topAnchor.constraint(equalTo: self.topAnchor,constant: 8).isActive = true
        coverImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        coverImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
       
        addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: coverImageView.rightAnchor, constant:  8).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -15).isActive = true
        
        addSubview(authorLabel)
        authorLabel.leftAnchor.constraint(equalTo: coverImageView.rightAnchor, constant: 8).isActive = true
        authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        authorLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        authorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
