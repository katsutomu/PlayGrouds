import UIKit

class MainViewController : UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstViewcontroller = FirstViewController.instantiate()
        let secondViewcontroller = SecondViewController.instantiate()
        
        var img = UIImage(named: "first")
        let tabBarItem = UITabBarItem(title: nil, image: img, selectedImage: nil)
        tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.clearColor()],
                                            forState: .Normal)
        tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        tabBarItem.tag = 0
        firstViewcontroller.tabBarItem = tabBarItem

        img = UIImage(named: "second")
        let tabBarItem2 = UITabBarItem(title: nil, image: img, selectedImage: nil)
        tabBarItem2.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.clearColor()],
            forState: .Normal)
        tabBarItem2.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        tabBarItem2.tag = 1
        secondViewcontroller.tabBarItem = tabBarItem2

        setViewControllers([firstViewcontroller,secondViewcontroller], animated: false)
    }
}

extension MainViewController : UITabBarControllerDelegate {
}

