//
//  ViewController.swift
//  WeatherNearMe
//
//  Created by Ayubi on 1/24/22.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {
    @IBOutlet weak var weatherTypeSegment: UISegmentedControl!
    
    private var viewModel: MainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.viewControllerDidLoad()
    }
    
    @IBAction func weatherTypeDidChange(_ sender: Any) {
        guard let segmentControl = sender as? UISegmentedControl else { return }
        viewModel.onChangeWeatherType(with: segmentControl.selectedSegmentIndex)
    }

}

//MARK: Setup
extension MainViewController {
    
    
}

//MARK: Helper Functions
extension MainViewController {

}


