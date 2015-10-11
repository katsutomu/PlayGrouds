//
//  FirstViewController.swift
//  TestTabbed
//
//  Created by katsunori sekine on 2015/10/11.
//  Copyright (c) 2015年 katsunori sekine. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    class func instantiate() -> FirstViewController {
        let controller = UIStoryboard(name: "Top", bundle: nil).instantiateInitialViewController() as! FirstViewController
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

