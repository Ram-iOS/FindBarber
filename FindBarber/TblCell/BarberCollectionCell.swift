//
//  BarberCollectionCell.swift
//  FindBarber
//
//  Created by Reus on 13/11/17.
//  Copyright © 2017 Reus. All rights reserved.
//

import UIKit

class BarberCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imgBarberCollection: UIImageView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.imgBarberCollection.layer.cornerRadius = 8.0
        self.imgBarberCollection.layer.masksToBounds = true
        
       
    }
}
