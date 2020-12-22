//
//  MainViewController.swift
//  Multithhreading
//
//  Created by Nguyễn Đức Hiếu on 10/16/20.
//  Copyright © 2020 Nguyễn Đức Hiếu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var image1ImageView: UIImageView!
    @IBOutlet weak var image2ImageView: UIImageView!
    @IBOutlet weak var image3ImageView: UIImageView!
    @IBOutlet weak var image4ImageView: UIImageView!
    @IBOutlet weak var image5ImageView: UIImageView!
    
    @IBOutlet var imageViews: [UIImageView]!
    let listUrl: [String] = ["https://static.scientificamerican.com/sciam/cache/file/4E0744CD-793A-4EF8-B550B54F7F2C4406_source.jpg",
                             "https://khoahocphattrien.vn/Images/Uploaded/Share/2019/03/13/dGhpZW5uaGllbg.jpg",
                             "https://post.greatist.com/wp-content/uploads/sites/3/2020/02/325466_1100-1100x628.jpg",
                             "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRCcdS8f6L5Aonc9oUP3UfD2PAPUmqF-_IBcw&usqp=CAU"]
    @IBOutlet weak var loadImagetableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       download()
    }
    
    var index = 0
    func download() {
        let dispatchGroup = DispatchGroup()
        let queue = DispatchQueue(label: "loadImage", qos: .background)
        dispatchGroup.enter()
        print("start \(index)")
        queue.async {
            let url = URL(string: self.listUrl[self.index])
            do {
                let data = try Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.imageViews[self.index].image = UIImage(data: data)
                    print("done \(self.index)")
                    self.index += 1
                    dispatchGroup.leave()
                }
                
            } catch {
                print("error")
            }
        }
        dispatchGroup.notify(queue: .global()) {
            if self.index < self.listUrl.count {
                self.download()
            }
        }
    }
    
    @IBAction func buttonAction(_ sender: Any) {
       let vc = Load20ImageViewController(nibName: "Load20ImageViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

