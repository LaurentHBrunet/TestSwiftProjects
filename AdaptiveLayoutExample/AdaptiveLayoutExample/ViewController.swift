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
    
    let numbers = [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "*", "0", "#"]
    let lettering = ["", "A B C", "D E F", "G H I", "J K L", "M N O", "P Q R S", "T U V", "W X Y Z", "", "+", ""]
    
    private let leftRightSpacingPercentage: CGFloat = 0.15
    private let interSpacingPercentage: CGFloat = 0.1
    
    var dialedNumbersDisplayString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(KeyCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.register(DialedNumberHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! DialedNumberHeader
        header.numbersLabel.text = dialedNumbersDisplayString
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height / 5)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! KeyCell
        
        cell.digitsLabel.text = numbers[indexPath.item]
        cell.lettersLabel.text = lettering[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dialedNumbersDisplayString += numbers[indexPath.item]
        
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let leftRightPadding = getLeftRightPadding()
        let interSpacing = getInterSpacing()
        
        let cellWidth = (view.frame.width - 2 * leftRightPadding - 2 * interSpacing) / 3
        
        return .init(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let leftRightPadding = getLeftRightPadding()
        
        return .init(top: 16, left: leftRightPadding, bottom: 16, right: leftRightPadding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func getLeftRightPadding() -> CGFloat {
        return view.frame.width * leftRightSpacingPercentage
    }
    
    func getInterSpacing() -> CGFloat {
        return view.frame.width * interSpacingPercentage
    }


}

