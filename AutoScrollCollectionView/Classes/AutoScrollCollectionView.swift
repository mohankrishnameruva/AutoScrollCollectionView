//
//  AutoScrollCollectionView.swift
//  AutoScrollCollectionView
//
//  Created by Mohan Meruva on 06/01/20.
//  Copyright © 2020 backyard. All rights reserved.
//

import UIKit
@IBDesignable
public class AutoScrollCollectionView: UICollectionView {
    
    
    public var timeIntervalForScroll: Double = 2.0
    
    
    var timer: Timer?
    
    var timeInterval: TimeInterval {
        get {
            return TimeInterval(exactly: timeIntervalForScroll)!
        }
    }
    
    
    private func commonInit() {
        //        self.collectionViewLayout = AutoScrollCollectionViewLayout()
        startAutoScrolling()
        self.backgroundColor = UIColor.magenta
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: UICollectionViewFlowLayout())
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    public override func awakeFromNib() {
    }
    
    public func startAutoScrolling() {
        if timer != nil { timer?.invalidate() }
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(autoScrollCollectionView), userInfo: nil, repeats: true)
    }
    
    public func stopScrolling() {
        timer?.invalidate()
    }
    
    
    
    @objc private func autoScrollCollectionView() {
        
        guard let nextIndex = getNextItemIndexToScroll() else {
            return
        }
        guard let scrollDirection = (self.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection else { return  }
        switch scrollDirection {
        case .horizontal:
            self.scrollToItem(at: nextIndex, at: .left, animated: true)
        case .vertical:
            self.scrollToItem(at: nextIndex, at: .top, animated: true)
        @unknown default:
            fatalError()
        }
    }
    
    private func getFirstVisbleCell() -> UICollectionViewCell? {
        guard let scrollDirection = (self.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection else { return nil }
        switch scrollDirection {
        case .horizontal:
            let temp = visibleCells.sorted(by: {$0.frame.minX < $1.frame.minX})
            let firstRowCells =  temp.filter{$0.frame.minX == temp[0].frame.minX}
            return firstRowCells.sorted(by: {$0.frame.minY > $1.frame.minY}).first
        case .vertical:
            let temp = visibleCells.sorted(by: {$0.frame.minY < $1.frame.minY})
            let firstRowCells =  temp.filter{$0.frame.minY == temp[0].frame.minY}
            return firstRowCells.sorted(by: {$0.frame.minX < $1.frame.minX}).first
        @unknown default:
            fatalError()
        }
    }
    
    private func getLastVisbleCell() -> UICollectionViewCell? {
        guard let scrollDirection = (self.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection else { return nil }
        switch scrollDirection {
        case .horizontal:
            let temp = visibleCells.sorted(by: {$0.frame.maxX > $1.frame.maxX})
            let lastColumnsCells =  temp.filter{$0.frame.maxX == temp[0].frame.maxX}
            return lastColumnsCells.sorted(by: {$0.frame.minY > $1.frame.minY}).first
        case .vertical:
            let temp = visibleCells.sorted(by: {$0.frame.maxY > $1.frame.maxY})
            let lastRowCells =  temp.filter{$0.frame.maxY == temp[0].frame.maxY}
            return lastRowCells.sorted(by: {$0.frame.maxX > $1.frame.maxX}).first
        @unknown default:
            fatalError()
        }
    }
    
    
    private func getNextItemIndexToScroll() -> IndexPath? {
        
        if let lastCell = getLastVisbleCell(), let lastIndex = indexPath(for: lastCell) {
            if lastIndex.row == (numberOfItems(inSection: 0) - 1) && bounds.contains(lastCell.frame) {
                return IndexPath(item: 0, section: 0)
            }
        }
        
        if let partialVisibleCell = checkForPartialVisibleCells() {
            return self.indexPath(for: partialVisibleCell)
        } else {
            guard let firstVisibleCell = getFirstVisbleCell(), let firstVisibleIndex = self.indexPath(for: firstVisibleCell) else { return nil}
            let nextItem = (firstVisibleIndex.item + (self.visibleCells.count)) % self.numberOfItems(inSection: 0)
            return IndexPath(item: nextItem, section: 0)
        }
    }
    
    private func checkForPartialVisibleCells() -> UICollectionViewCell? {
        var partiallyVisibleCell: UICollectionViewCell?
        for eachCell in visibleCells {
            if !bounds.contains(eachCell.frame) {
                partiallyVisibleCell = eachCell
                break
            }
        }
        return partiallyVisibleCell
    }
}

