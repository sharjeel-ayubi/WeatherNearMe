//
//  WeatherDetailViewController.swift
//  WeatherNearMe
//
//  Created by Ayubi on 1/31/22.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var lblTemperature: UILabel!
    @IBOutlet weak var lblWeatherType: UILabel!
    @IBOutlet weak var lblTimestamp: UILabel!
    
    @IBOutlet weak var lblRealFeel: UILabel!
    @IBOutlet weak var lblPrecipProb: UILabel!
    @IBOutlet weak var lblDewPoint: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblPressure: UILabel!
    @IBOutlet weak var lblWindSpeed: UILabel!
    @IBOutlet weak var lblWindGust: UILabel!
    @IBOutlet weak var lblCloud: UILabel!
    @IBOutlet weak var lblVisibility: UILabel!
    @IBOutlet weak var lblOzone: UILabel!
    
    var viewModel: WeatherDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }

}

//MARK: - Setup
extension WeatherDetailViewController {
    
    func setupUI() {
        setupImage()
        setupLabels()
    }
    
    func setupImage() {
        weatherImageView.image = UIImage(named: viewModel?.weatherData.icon ?? "clear-day")
    }
    
    
    func setupLabels() {
        guard let weatherData = viewModel?.weatherData else {return}
        lblTimestamp.text   = viewModel?.getTime()
        lblTemperature.text = "\(Int(weatherData.temperature ?? 0.0))°"
        lblWeatherType.text = weatherData.summary
        lblRealFeel.text    = "\(Int(weatherData.apparentTemperature ?? 0.0))"
        lblPrecipProb.text  = viewModel?.getPercentage(for: weatherData.precipProbability)
        lblDewPoint.text    = "\(weatherData.dewPoint ?? 0.0)"
        lblHumidity.text    = "\(weatherData.humidity ?? 0.0)"
        lblPressure.text    = "\(weatherData.pressure ?? 0.0)"
        lblWindSpeed.text   = "\(weatherData.windSpeed ?? 0.0)"
        lblWindGust.text    = "\(weatherData.windGust ?? 0.0)"
        lblCloud.text       = viewModel?.getPercentage(for: weatherData.cloudCover)
        lblVisibility.text  = "\(weatherData.visibility ?? 0.0) KM"
        lblOzone.text       = "\(weatherData.ozone ?? 0.0)"
    }
}
