//
//  ViewController.swift
//  FindBarber
//
//  Created by Reus on 13/11/17.
//  Copyright © 2017 Reus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnSignInTapped(_ sender: Any) {
        
        let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "TabBarController")
        AppConstant.AppDel.delegateObj.window?.rootViewController = initialViewController
        AppConstant.AppDel.delegateObj.window?.makeKeyAndVisible()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

