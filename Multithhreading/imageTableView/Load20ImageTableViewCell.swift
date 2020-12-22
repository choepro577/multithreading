//
//  Load20ImageTableViewCell.swift
//  Multithhreading
//
//  Created by Nguyễn Đức Hiếu on 10/16/20.
//  Copyright © 2020 Nguyễn Đức Hiếu. All rights reserved.
//

import UIKit

class Load20ImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var loadingIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var loadImageView: UIImageView!
    var downloadImage: UIImage?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpUI(url: String, index: Int) {
        DispatchQueue.global().async {
            let url = URL(string: url)
            do {
                let data = try Data(contentsOf: url!)
                DispatchQueue.main.async {
                    if self.tag == index {
                          self.loadImageView.image = UIImage(data: data)
                    }
                }
            } catch {
                print("error")
            }
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
