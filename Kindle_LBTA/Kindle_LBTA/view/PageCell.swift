
import UIKit

class PageCell : UICollectionViewCell {
 
    
    let button : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("close", for: .normal)
        return button
    }()
    
    let text : UILabel = {
        let text = UILabel()
        text.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry."
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .center
        text.textColor = .black
        return text
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        backgroundColor = .white
        addSubview(text)
        text.topAnchor.constraint(equalTo: topAnchor,constant: 10).isActive = true
        text.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        text.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        text.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10).isActive = true
        
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
