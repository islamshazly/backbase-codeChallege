//
//  CiltyCellTableViewCell.swift
//  BackbaseCodeChallenge
//
//  Created by islam Elshazly on 25/07/2020.
//  Copyright © 2020 Islam Elshazly. All rights reserved.
//

import UIKit

final class CiltyCellTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    // MARK: - Configure Cell Data
    
    func configure(cityViewModel city: CityViewModel) {
        nameLabel.text = city.name
        detailsLabel.text = city.country
    }
}
