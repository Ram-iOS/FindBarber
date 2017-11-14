//
//  CustomRoundImageView.swift
//  FindBarber
//
//  Created by Reus on 13/11/17.
//  Copyright © 2017 Reus. All rights reserved.
//

import UIKit

class CustomRoundImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.personalize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.personalize()

    }
    
    
    // make image view round
    
    func personalize(){
        self.layer.cornerRadius = self.bounds.height / 2
        self.layer.masksToBounds = true
    }
}
