
import UIKit


class BookPagerController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        
        navigationItem.title = book?.title
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(HandleClose))
        
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellid")
        
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.scrollDirection = .horizontal
        layout?.minimumLineSpacing = 0

        collectionView.isPagingEnabled = true
    }
    
    @objc func HandleClose(){
        dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 44 - 20)
        
    }
    
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        collectionView.allowsMultipleSelection = true
//        return CGRect(x: 100, y: 100, width: 0, height: 0)
//    }
   
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
      
        
//        if indexPath.item % 2 == 0 {
//            cell.backgroundColor = .red
//        }
//        else {
//          cell.backgroundColor = .green
//        }
        return cell
    }
}
