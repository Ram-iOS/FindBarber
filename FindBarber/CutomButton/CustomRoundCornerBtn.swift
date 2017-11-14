//
//  CustomRoundCornerBtn.swift
//  FindBarber
//
//  Created by Reus on 13/11/17.
//  Copyright © 2017 Reus. All rights reserved.
//

import UIKit

class CustomRoundCornerBtn: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.personalizeBtn()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.personalizeBtn()
    }
    
    // personalize button for round corner
    
    func personalizeBtn(){
        
        self.layer.cornerRadius  = self.bounds.height / 2
        self.layer.masksToBounds = true
    }
}
