//
//  WeatherListViewController.swift
//  WeatherApp
//
//  Created by Aarthi on 07/02/23.
//

import UIKit

class WeatherListViewController: UIViewController, AddWeatherDelegate {
    
    private var weatherListViewModel = WeatherListViewModel()
    
    @IBOutlet weak var weatherListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initProcess()
    }
    
    func initProcess() {
        weatherListTableView.register(UINib(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "weatherCell")
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        
        self.weatherListViewModel.addWeatherViewModel(vm)
        self.weatherListTableView.reloadData()
        
    }
    
    @IBAction func addCityBtnTapped(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddWeatherCityViewController") as! AddWeatherCityViewController
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    
}


extension WeatherListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.numberOfRows(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherTableViewCell
        
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        
        cell.configure(weatherVM)
       
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
    
    
}
