import UIKit

class TabFlowLayout : UICollectionViewFlowLayout {
    override init() {
        super.init()
        scrollDirection = .Horizontal
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}