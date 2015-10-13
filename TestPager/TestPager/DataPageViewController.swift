//
//  DataPageViewController.swift
//  TestPager
//
//  Created by katsunori sekine on 2015/10/14.
//  Copyright (c) 2015年 katsunori sekine. All rights reserved.
//

import UIKit

class DataPageViewController: UIPageViewController, UIPageViewControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
   
}