//
//  TopAppCollectionViewCell.swift
//  Eny Store
//
//  Created by Jay on 1/21/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import UIKit

class TopAppTableViewCell: UITableViewCell {
    
    @IBOutlet weak var AppIconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        let selection = UIView()
//        selection.backgroundColor = UIColor(red: 81/255.0, green: 207/255.0, blue: 255/255.0, alpha: 0.5)
//        self.selectedBackgroundView = selection
        setUp()
    }
    
    func setUp() {

    }

}
