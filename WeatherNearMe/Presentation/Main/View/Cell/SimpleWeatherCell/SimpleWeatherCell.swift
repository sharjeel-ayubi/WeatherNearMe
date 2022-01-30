//
//  BasicWeatherCell.swift
//  WeatherNearMe
//
//  Created by Ayubi on 1/30/22.
//

import UIKit

class SimpleWeatherCell: UITableViewCell, BaseWeatherCell {

    static var identifier: String { return String(describing: self) }
    static var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var lblTemperature: UILabel!
    @IBOutlet weak var lblFeelTemperature: UILabel!
    @IBOutlet weak var lblPrecipPercentage: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindView(with viewModel: BaseCellViewModel) {
        guard let simpleWeatherViewModel = viewModel as? SimpleWeatherCellViewModel else {return}
        let weatherData = simpleWeatherViewModel.basicWeatherData
        lblTime.text = simpleWeatherViewModel.getHoursTime()
        lblDate.text = simpleWeatherViewModel.getMonthDate()
        weatherIcon.image = UIImage(named: weatherData.icon ?? "clear-day")
        lblTemperature.text = "\(Int(weatherData.temperature ?? 0.0))°"
        lblFeelTemperature.text = "RealFeel \(Int(weatherData.apparentTemperature ?? 0.0))°"
        lblPrecipPercentage.text = simpleWeatherViewModel.getPrecipPercentage()
    }
    
}
