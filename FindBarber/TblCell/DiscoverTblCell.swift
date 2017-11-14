//
//  DiscoverTblCell.swift
//  FindBarber
//
//  Created by Reus on 13/11/17.
//  Copyright © 2017 Reus. All rights reserved.
//

import UIKit

class DiscoverTblCell: UITableViewCell {

    @IBOutlet weak var imgBarber: UIImageView!
    @IBOutlet weak var lblBarbername: UILabel!
    @IBOutlet weak var lblBarberLocation: UILabel!
    
    @IBOutlet weak var viewScroll: UIScrollView!
    @IBOutlet weak var btnOpen: UIButton!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var collectionViewBarber: UICollectionView!
    
    var showMore:Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.btnOpen.layer.cornerRadius = 8.0
        self.btnOpen.layer.borderColor = UIColor(red: 0/255.0, green: 176.0/255.0, blue: 50.0/255.0, alpha: 1).cgColor
        self.btnOpen.layer.borderWidth = 1.0
        self.btnOpen.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadBarberColletiondata(){
        
        let cellSize = CGSize(width:self.collectionViewBarber.frame.size.height - 8 ,
                              height:self.collectionViewBarber.frame.size.height - 8)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal //.horizontal
        layout.itemSize = cellSize
        // layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        layout.minimumLineSpacing = 8.0
        layout.minimumInteritemSpacing = 0.0
        self.collectionViewBarber.setCollectionViewLayout(layout, animated: true)
        
        
        
        self.collectionViewBarber.dataSource = self
        self.collectionViewBarber.delegate   = self

    }

}

extension DiscoverTblCell:UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
     }
    
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: self.collectionViewBarber.bounds.width - 8,
                      height: self.collectionViewBarber.bounds.height - 8)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing:BarberCollectionCell.self), for: indexPath) as! BarberCollectionCell
        
        cell.imgBarberCollection.image = #imageLiteral(resourceName: "man_img.png")
        
        
        return cell
        
        
    }
    
   
    
}
