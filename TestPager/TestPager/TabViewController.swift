import UIKit

class TabViewController: UICollectionViewController {
    let tags = ["Tag1","Tag2","Tagggggg3","Tag4"]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let flowLayout = TabFlowLayout()
        collectionView?.collectionViewLayout = flowLayout
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! UICollectionViewCell
        let label = cell.viewWithTag(1) as! UILabel
        label.text = tags[indexPath.item]
        label.sizeToFit()

        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        let size = CGSize(width: count(tags[indexPath.item]) * 10, height: 44) // Square
        
        return size
    }

}