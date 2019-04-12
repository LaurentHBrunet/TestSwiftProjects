//
//  DialedNumberHeader.swift
//  AdaptiveLayoutExample
//
//  Created by Laurent on 2019-04-11.
//  Copyright © 2019 Laurent Henault-Brunet. All rights reserved.
//
import UIKit

class DialedNumberHeader: UICollectionReusableView {
    
    let numbersLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        numbersLabel.text = "123"
        numbersLabel.textAlignment = .center
        numbersLabel.font = UIFont.systemFont(ofSize: 32)
        numbersLabel.adjustsFontSizeToFitWidth = true
        addSubview(numbersLabel)
        
        numbersLabel.fillSuperview(padding: .init(top: 0, left: 32, bottom: 0, right: 32))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
