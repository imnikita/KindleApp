//
//  PageCell.swift
//  KindleApp
//
//  Created by Nikita Popov on 20.03.2021.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Book", size: 18)
        label.text = "Some text for the label"
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(textLabel)
        textLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        textLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        textLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
