//
//  SecondViewController.swift
//  TestTabbed
//
//  Created by katsunori sekine on 2015/10/11.
//  Copyright (c) 2015年 katsunori sekine. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    class func instantiate() -> SecondViewController {
        let controller = UIStoryboard(name: "Second", bundle: nil).instantiateInitialViewController() as! SecondViewController
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

