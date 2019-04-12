//
//  ViewController.swift
//  AdaptiveLayoutExample
//
//  Created by Laurent on 2019-04-07.
//  Copyright © 2019 Laurent Henault-Brunet. All rights reserved.
//

import UIKit


class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    fileprivate let cellId = "cellId"
    fileprivate let headerId = "headerId"
    fileprivate let greenCallCellId = "greeCallCellId"
    fileprivate let backspaceCellId = "backspaceCellId"
    
    let numbers = [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "*", "0", "#"]
    let lettering = ["", "A B C", "D E F", "G H I", "J K L", "M N O", "P Q R S", "T U V", "W X Y Z", "", "+", ""]
    
    private let leftRightSpacingPercentage: CGFloat = 0.15
    private let interSpacingPercentage: CGFloat = 0.1
    
    var dialedNumbersDisplayString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(KeyCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(GreenCallCell.self, forCellWithReuseIdentifier: greenCallCellId)
        collectionView.register(BackspaceCell.self, forCellWithReuseIdentifier: backspaceCellId)
        
        collectionView.register(DialedNumberHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! DialedNumberHeader
        header.numbersLabel.text = dialedNumbersDisplayString
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        
        return .init(width: view.frame.width, height: view.frame.height / 5)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return 2
        }
        return numbers.count
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 1 {
            if indexPath.item == 0 {
                let greenCallCell = collectionView.dequeueReusableCell(withReuseIdentifier: greenCallCellId, for: indexPath) as! GreenCallCell
                return greenCallCell
            } else {
                let backspaceCell = collectionView.dequeueReusableCell(withReuseIdentifier: backspaceCellId, for: indexPath) as! BackspaceCell
                return backspaceCell
            }
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! KeyCell
        cell.digitsLabel.text = numbers[indexPath.item]
        cell.lettersLabel.text = lettering[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            if indexPath.item == 1 {            
                dialedNumbersDisplayString = String(dialedNumbersDisplayString.dropLast())
            } else {
                print("call")
            }
        } else {
            dialedNumbersDisplayString += numbers[indexPath.item]
        }

        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 1 {
            let leftPadding = view.frame.width / 2 - cellWidth / 2
            return .init(top: 0, left: leftPadding, bottom: 0, right: self.leftRightPadding)
        }
        
        return .init(top: 16, left: leftRightPadding, bottom: 16, right: leftRightPadding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    lazy var leftRightPadding = view.frame.width * leftRightSpacingPercentage
    lazy var interSpacing = view.frame.width * interSpacingPercentage
    lazy var cellWidth = (view.frame.width - 2 * leftRightPadding - 2 * interSpacing) / 3
}

