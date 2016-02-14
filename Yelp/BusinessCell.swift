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
      catagoriesLabel.text   = business.categories
      addressLabel.text      = business.address
      reviewsCountLabel.text = "\(business.reviewCount ?? 0) Reviews"
      distanceLabel.text     = business.distance
      if let url = business.imageURL {
        thumbImageView.setImageWithURL(url)
      }
      if let url = business.ratingImageURL {
        ratingsImageView.setImageWithURL(url)
      }
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    
    thumbImageView.layer.cornerRadius = 5
    thumbImageView.clipsToBounds      = true
    
    nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    nameLabel.text         = nil
    catagoriesLabel.text   = nil
    addressLabel.text      = nil
    distanceLabel.text     = nil
    thumbImageView.image   = nil
    ratingsImageView.image = nil
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
