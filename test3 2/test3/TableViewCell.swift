//
//  TableViewCell.swift
//  test3
//
//  Created by Huy Vu on 11/13/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let heigh_cell: CGFloat = 96

    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var First_name: UILabel!
    
    
    @IBOutlet weak var Second_Name: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
