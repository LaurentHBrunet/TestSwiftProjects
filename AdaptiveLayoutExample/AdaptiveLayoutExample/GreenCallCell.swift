//
//  GreenCallCell.swift
//  AdaptiveLayoutExample
//
//  Created by Laurent on 2019-04-11.
//  Copyright © 2019 Laurent Henault-Brunet. All rights reserved.
//

import UIKit

class GreenCallCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
