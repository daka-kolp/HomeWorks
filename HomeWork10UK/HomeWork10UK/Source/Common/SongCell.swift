//
//  SongCell.swift
//  HomeWork10UK
//
//  Created by Daria Kolpakova on 23.12.2024.
//

import UIKit

class SongCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var album: UILabel!
    @IBOutlet weak var genre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
