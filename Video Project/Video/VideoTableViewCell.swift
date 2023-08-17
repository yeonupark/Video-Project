//
//  VideoTableViewCell.swift
//  Video Project
//
//  Created by 마르 on 2023/08/17.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    static let identifier = "VideoTableViewCell"
    
    @IBOutlet var thumbnailImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLabel()
    }
    
    func setLabel(){
        titleLabel.numberOfLines = 0
        authorLabel.numberOfLines = 0
        dateLabel.numberOfLines = 0
        
        titleLabel.font = .boldSystemFont(ofSize: 13)
        authorLabel.font = .systemFont(ofSize: 12)
        dateLabel.font = .systemFont(ofSize: 12)
    }

}
