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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loaderView: UIView!
    
    var viewModel: MainViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        bindViewModel()
        viewModel?.viewControllerDidLoad()
        
    }
    
    @IBAction func weatherTypeDidChange(_ sender: Any) {
        guard let segmentControl = sender as? UISegmentedControl else { return }
        viewModel?.onChangeWeatherType(with: segmentControl.selectedSegmentIndex)
    }

}

//MARK: Setup
extension MainViewController {
    
    func setupUI() {
        setupLoader()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(SimpleWeatherCell.nib, forCellReuseIdentifier: SimpleWeatherCell.identifier)
        tableView.register(DetailWeatherCell.nib, forCellReuseIdentifier: DetailWeatherCell.identifier)
    }
    
    func setupLoader() {
        loaderView.isHidden = true
    }
    
    func bindViewModel() {
        viewModel?.weatherData.bind { [weak self] value in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel?.selectedWeatherType.bind { [weak self] value in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel?.showLoader.bind { [weak self] showLoader in
            DispatchQueue.main.async {
                self?.loaderView.isHidden = !showLoader
            }
        }
    }
    
}

//MARK: Helper Functions
extension MainViewController {

}

//MARK: TableView Delegate
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getRowCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellVM = viewModel?.getCellViewModel(for: indexPath) else {
            return UITableViewCell()
        }
        guard let cellIdentifier = viewModel?.getCellIdentifier(for: cellVM) else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if let baseCell = cell as? BaseWeatherCell {
            baseCell.bindView(with: cellVM)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
