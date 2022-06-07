//
//  WonderTableViewCell.swift
//  WorldWonders
//
//  Created by Ibrahim Aitkazin on 07.06.2022.
//

import UIKit
import SDWebImage
class WonderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var flagImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData (wonder: Wonder){
        nameLabel.text = wonder.name
        regionLabel.text = wonder.region
        locationLabel.text = wonder.location
        
        pictureImageView.sd_setImage(with: URL(string: wonder.picture),placeholderImage: nil)
        
        flagImageView.sd_setImage(with: URL(string: wonder.flag), placeholderImage : nil)
        
    }

}
