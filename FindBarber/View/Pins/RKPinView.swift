//
//  RKPinView.swift
//  CludeApp
//
//  Created by Reus on 10/09/17.
//  Copyright © 2017 Reus. All rights reserved.
//

import UIKit

class RKPinView: UIView {

   
    @IBOutlet weak var imgBarber: CustomRoundImageView!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    func addLayer(){
        
        self.imgBarber.layer.borderWidth = 2.0
        self.imgBarber.layer.borderColor = UIColor.white.cgColor
        
    }
    
    func defaultColor(){
        
        self.imgBarber.layer.borderColor = UIColor.white.cgColor

    }
    
    func changeColor(){
        
        self.imgBarber.layer.borderColor = UIColor(red: 127.0/255.0, green: 161.0/255.0, blue: 239.0/255.0, alpha: 1).cgColor
    }
}
