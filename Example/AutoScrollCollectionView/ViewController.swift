//
//  ViewController.swift
//  AutoScrollCollectionView
//
//  Created by mohankrishnameruva on 01/23/2020.
//  Copyright (c) 2020 mohankrishnameruva. All rights reserved.
//

import UIKit
import AutoScrollCollectionView

class ViewController: UIViewController {

    @IBOutlet var autoScrollCollectionView: AutoScrollCollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        autoScrollCollectionView.dataSource = self
        
            // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.autoScrollCollectionView.startAutoScrolling(withTimeInterval: TimeInterval(exactly: 2.0)!)
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.autoScrollCollectionView.stopScrolling()
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sampleCell", for: indexPath)
        let lable = UILabel(frame: cell.frame)
        lable.text = "\(indexPath.row)"
        lable.frame = CGRect(origin: cell.contentView.frame.origin, size: cell.contentView.frame.size)
        cell.contentView.subviews.forEach({ $0.removeFromSuperview() })
        cell.contentView.addSubview(lable)
        cell.backgroundColor = UIColor.green
        cell.tag = indexPath.row
        return cell
    }
    
}
