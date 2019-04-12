//
//  BackspaceCell.swift
//  AdaptiveLayoutExample
//
//  Created by Laurent on 2019-04-11.
//  Copyright © 2019 Laurent Henault-Brunet. All rights reserved.
//

import UIKit

class BackspaceCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
