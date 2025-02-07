//
//  IrregularEventViewCell.swift
//  Tracker
//
//  Created by Никита Гончаров on 21.01.2024.
//

import UIKit

final class IrregularEventViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let chevronImage: UIImageView = {
        let chevronImage = UIImageView()
        chevronImage.image = UIImage(named: "Chevron")
        chevronImage.tintColor = .ypGray
        chevronImage.translatesAutoresizingMaskIntoConstraints = false
        return chevronImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .ypBackgroundDay
        clipsToBounds = true
        
        addSubview(titleLabel)
        addSubview(chevronImage)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            chevronImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            chevronImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            chevronImage.widthAnchor.constraint(equalToConstant: 24),
            chevronImage.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with title: String) {
        let attributedText = NSMutableAttributedString(string: title)
        
        if let rangeOfNewLine = title.range(of: "\n") {
            let rangeOfFirstLine = NSRange(title.startIndex..<rangeOfNewLine.lowerBound, in: title)
            let rangeOfSecondLine = NSRange(rangeOfNewLine.upperBound..<title.endIndex, in: title)
            
            attributedText.addAttribute(.foregroundColor, value: UIColor.ypBlackDay, range: rangeOfFirstLine)
            attributedText.addAttribute(.foregroundColor, value: UIColor.ypGray, range: rangeOfSecondLine)
        } else {
            attributedText.addAttribute(.foregroundColor, value: UIColor.ypBlackDay, range: NSRange(title.startIndex..<title.endIndex, in: title))
        }
        
        titleLabel.attributedText = attributedText
    }
}
