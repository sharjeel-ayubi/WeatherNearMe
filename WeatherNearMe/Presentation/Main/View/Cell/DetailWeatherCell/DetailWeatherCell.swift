//
//  DetailWeatherCell.swift
//  WeatherNearMe
//
//  Created by Ayubi on 1/30/22.
//

import UIKit

class DetailWeatherCell: UITableViewCell, BaseWeatherCell {
    
    static var identifier: String { return String(describing: self) }
    static var nib: UINib { return UINib(nibName: identifier, bundle: nil) }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindView(with viewModel: BaseCellViewModel) {
        guard let detailViewModel = viewModel as? DetailWeatherCellViewModel else {return}
        let weatherData = detailViewModel.detailWeatherData
    }
    
}
