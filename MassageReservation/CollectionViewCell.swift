//
//  CollectionViewCell.swift
//  MassageReservation
//
//  Created by venkatagovardhan on 3/19/18.
//  Copyright © 2018 venkatagovardhan. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var datelabel: UILabel!
    func displayContent(date: String){
        datelabel.text = date
        
        
    }
}
