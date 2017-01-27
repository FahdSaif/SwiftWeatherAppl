//
//  MyCustomCell.swift
//  WeatherAPI
//
//  Created by Fahd on 25/01/2017.
//  Copyright © 2017 Fahd. All rights reserved.
//

import UIKit

class MyCustomCell: UITableViewCell {

    @IBOutlet weak var lbltemperature: UILabel!
    @IBOutlet weak var lblcityname: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
