import UIKit

class MainViewController : UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let viewcontrollers : [UIViewController] = [
            FirstViewController.instantiate(),
            FirstViewController.instantiate(),
            FirstViewController.instantiate(),
            FirstViewController.instantiate(),
            FirstViewController.instantiate(),
            FirstViewController.instantiate(),
            FirstViewController.instantiate()
        ]
        func createTabBarItem(image: UIImage, tag: Int) -> UITabBarItem {
            let tabBarItem = UITabBarItem(title: nil, image: image, selectedImage: nil)
            tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.clearColor()], forState: .Normal)
            tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            tabBarItem.tag = tag
            return tabBarItem
        }
        var i : Int = 0;
        for viewController in viewcontrollers {
            viewController.tabBarItem = createTabBarItem(UIImage(named: "first")!, i)
            i++
        }

        setViewControllers(viewcontrollers, animated: false)
    }
}

extension MainViewController : UITabBarControllerDelegate {
}

