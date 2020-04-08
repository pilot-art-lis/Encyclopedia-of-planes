//
//  PlaneTableViewCell.swift
//  Encyclopedia of planes
//
//  Created by Best Mac on 22.03.2020.
//  Copyright © 2020 Artem Lysevych. All rights reserved.
//

import UIKit

class PlaneTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var planeModel: UILabel!
    @IBOutlet weak var planeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
