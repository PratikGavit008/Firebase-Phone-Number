//
//  HeadlineCell.swift
//  NewsApi
//
//  Created by Nayan Pawar on 07/02/23.
//

import UIKit

class HeadlineCell: UITableViewCell {
    @IBOutlet weak var lbldate: UILabel!
    @IBOutlet weak var lblChannelName: UILabel!
    @IBOutlet weak var lblHeadline: UILabel!
    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.addCornerRad()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }

}
