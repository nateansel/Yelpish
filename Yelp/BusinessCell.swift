//
//  BusinessCell.swift
//  Yelp
//
//  Created by Nathan Ansel on 2/13/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

  @IBOutlet weak var thumbImageView:    UIImageView!
  @IBOutlet weak var ratingsImageView:  UIImageView!
  @IBOutlet weak var nameLabel:         UILabel!
  @IBOutlet weak var distanceLabel:     UILabel!
  @IBOutlet weak var costLabel:         UILabel!
  @IBOutlet weak var reviewsCountLabel: UILabel!
  @IBOutlet weak var addressLabel:      UILabel!
  @IBOutlet weak var catagoriesLabel:   UILabel!
  
  
  
  var business: Business! {
    didSet {
      nameLabel.text         = business.name
      thumbImageView.setImageWithURL(business.imageURL!)
      catagoriesLabel.text   = business.categories
      addressLabel.text      = business.address
      reviewsCountLabel.text = "\(business.reviewCount!) Reviews"
      ratingsImageView.setImageWithURL(business.ratingImageURL!)
      distanceLabel.text     = business.distance
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    
    thumbImageView.layer.cornerRadius = 5
    thumbImageView.clipsToBounds      = true
    
    nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
  }

  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
  }

}
