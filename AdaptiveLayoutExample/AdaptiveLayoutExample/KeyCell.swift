//
//  KeyCell.swift
//  AdaptiveLayoutExample
//
//  Created by Laurent on 2019-04-07.
//  Copyright © 2019 Laurent Henault-Brunet. All rights reserved.
//

import UIKit

class KeyCell: UICollectionViewCell {
    
    let digitsLabel = UILabel()
    let lettersLabel = UILabel()
    
    fileprivate let defaultBackgroundColor = UIColor(white: 0.9, alpha: 1)
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .darkGray: defaultBackgroundColor
            digitsLabel.textColor = isHighlighted ? .white : .black
            lettersLabel.textColor = isHighlighted ? .white : .black
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        digitsLabel.text = "8"
        digitsLabel.font = UIFont.systemFont(ofSize: 32)
        digitsLabel.textAlignment = .center
        
        lettersLabel.text = "A B C"
        lettersLabel.font = UIFont.boldSystemFont(ofSize: 10)
        lettersLabel.textAlignment = .center
        
        let stackView = UIStackView(arrangedSubviews: [digitsLabel, lettersLabel])
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.centerInSuperview()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
