//
//  RootViewController.swift
//  TestPager
//
//  Created by katsunori sekine on 2015/10/13.
//  Copyright (c) 2015年 katsunori sekine. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    var pageViewController: UIPageViewController?
    var dataPageViewController: DataPageViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Configure the page view controller and add it as a child view controller.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "TabEmbedSegue" {
        } else if segue.identifier == "PageEmbedSegue" {
            dataPageViewController = segue.destinationViewController as? DataPageViewController
            
            let startingViewController: DataViewController = self.modelController.viewControllerAtIndex(0, storyboard: self.storyboard!)!
            let viewControllers = [startingViewController]
            self.dataPageViewController!.setViewControllers(viewControllers, direction: .Forward, animated: false, completion: {done in })
            
            self.dataPageViewController!.dataSource = self.modelController
            //        self.addChildViewController(self.dataPageViewController!)
            //        self.view.addSubview(self.pageViewController!.view)
            
            // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
            //        var pageViewRect = self.view.bounds
            //        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            //            pageViewRect = CGRectInset(pageViewRect, 40.0, 40.0)
            //        }
            //        self.pageViewController!.view.frame = pageViewRect
            
            //        self.pageViewController!.didMoveToParentViewController(self)
            
            // Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
            //self.view.gestureRecognizers = self.dataPageViewController!.gestureRecognizers
        }
    }

    var modelController: ModelController {
        // Return the model controller object, creating it if necessary.
        // In more complex implementations, the model controller may be passed to the view controller.
        if _modelController == nil {
            _modelController = ModelController()
        }
        return _modelController!
    }

    var _modelController: ModelController? = nil

    // MARK: - UIPageViewController delegate methods

    func pageViewController(pageViewController: UIPageViewController, spineLocationForInterfaceOrientation orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        if (orientation == .Portrait) || (orientation == .PortraitUpsideDown) || (UIDevice.currentDevice().userInterfaceIdiom == .Phone) {
            // In portrait orientation or on iPhone: Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to YES, so set it to NO here.
            let currentViewController = self.pageViewController!.viewControllers[0] as! UIViewController
            let viewControllers = [currentViewController]
            self.pageViewController!.setViewControllers(viewControllers, direction: .Forward, animated: true, completion: {done in })

            self.pageViewController!.doubleSided = false
            return .Min
        }

        // In landscape orientation: Set set the spine location to "mid" and the page view controller's view controllers array to contain two view controllers. If the current page is even, set it to contain the current and next view controllers; if it is odd, set the array to contain the previous and current view controllers.
        let currentViewController = self.pageViewController!.viewControllers[0] as! DataViewController
        var viewControllers: [AnyObject]

        let indexOfCurrentViewController = self.modelController.indexOfViewController(currentViewController)
        if (indexOfCurrentViewController == 0) || (indexOfCurrentViewController % 2 == 0) {
            let nextViewController = self.modelController.pageViewController(self.pageViewController!, viewControllerAfterViewController: currentViewController)
            viewControllers = [currentViewController, nextViewController!]
        } else {
            let previousViewController = self.modelController.pageViewController(self.pageViewController!, viewControllerBeforeViewController: currentViewController)
            viewControllers = [previousViewController!, currentViewController]
        }
        self.pageViewController!.setViewControllers(viewControllers, direction: .Forward, animated: true, completion: {done in })

        return .Mid
    }


}

