//
//  FilterCell.swift
//  Tracker
//
//  Created by Никита Гончаров on 04.02.2024.
//

import UIKit

final class FilterCell: UITableViewCell {
    static let cellIdentifier = "FilterCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        backgroundColor = .ypBackgroundDay
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
