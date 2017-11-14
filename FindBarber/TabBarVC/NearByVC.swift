//
//  NearByVC.swift
//  FindBarber
//
//  Created by Reus on 13/11/17.
//  Copyright © 2017 Reus. All rights reserved.
//

import UIKit

class NearByVC: UIViewController {

    @IBOutlet weak var viewInfo: UIView!
    @IBOutlet weak var constraintViewH: NSLayoutConstraint!
    @IBOutlet weak var viewMap: UIView!
    @IBOutlet weak var btnOpen: UIButton!
    var mapNearBy:MapView?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.constraintViewH.constant = 0
        
        
        self.viewInfo.layer.cornerRadius = 8
        self.viewInfo.layer.masksToBounds = true
        
        mapNearBy = (Bundle.main.loadNibNamed("MapView",owner : nil,options:nil)?[0] as? UIView) as? MapView
        mapNearBy?.frame.size.height = viewMap.bounds.height
        mapNearBy?.frame.size.width  = viewMap.bounds.width
        mapNearBy?.getCurrentLocation(from: self)
        
        DispatchQueue.main.async {
            self.viewMap.addSubview(self.mapNearBy!)
        }
        mapNearBy?.addMarkerToMap()
        mapNearBy?.didTapAtMarker = {(tap) in
            if tap {
                if self.constraintViewH.constant == 0{
                    self.constraintViewH.constant = 133
                    UIView.animate(withDuration: 0.5, animations: {
                        self.view.layoutIfNeeded()
                    })
                }
            }else{
                self.constraintViewH.constant = 0
                UIView.animate(withDuration: 0.5, animations: {
                    self.view.layoutIfNeeded()
                })
            }
        }
        
        self.btnOpen.layer.cornerRadius = 8.0
        self.btnOpen.layer.borderColor = UIColor(red: 0/255.0, green: 176.0/255.0, blue: 50.0/255.0, alpha: 1).cgColor
        self.btnOpen.layer.borderWidth = 1.0
        self.btnOpen.layer.masksToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
