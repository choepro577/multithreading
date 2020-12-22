//
//  MainTableViewCell.swift
//  Multithhreading
//
//  Created by Nguyễn Đức Hiếu on 10/16/20.
//  Copyright © 2020 Nguyễn Đức Hiếu. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var urlImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func loadImage(url : String) {
        let queue = DispatchQueue(label: "loadImage")
        queue.async {
            do {
                let url = URL(string: url)
                let data = try Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.urlImageView.image = UIImage(data: data)
                }
            } catch {
                print("error")
            }
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
