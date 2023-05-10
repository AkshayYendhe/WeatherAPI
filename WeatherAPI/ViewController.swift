//
//  ViewController.swift
//  WeatherAPI
//
//  Created by Akshay Yendhe on 08/04/23.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var updateTimeLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var humadityLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    func fetchData() {
        
        let url = URL(string: "http://api.weatherapi.com/v1/current.json?key=544ab89bf6404165acd51319230804&q=Nasik&aqi=no")
       // let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=65a7aea3e395474187a20653220504&q=india&aqi=no")
        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: {
            (data,response,error) in
            
            guard let data = data , error == nil else {
                
                print("Error while getting data!!!")
                
                return
            }
            var fullWeatherData : weatherData?
            
            do{
                fullWeatherData = try JSONDecoder().decode(weatherData.self, from: data)
              //  print(fullWeatherData)
            }
            catch{
                print("Error while Decoding data from an API \(error)")
            }
            DispatchQueue.main.async {
                self.updateTimeLabel.text = "Updated : \(fullWeatherData!.current.last_updated)"
                self.regionLabel.text = "Region : \(fullWeatherData!.location.region)"
                self.countryLabel.text = "Country : \(fullWeatherData!.location.country)"
                self.tempLabel.text = "Temprature (Celsius) : \(fullWeatherData!.current.temp_c)"
                self.humadityLabel.text = "Humidity : \(fullWeatherData!.current.humidity)"
                self.windLabel.text = "Wind (Km/Hr) : \(fullWeatherData!.current.wind_kph)"
                if let imageLink = URL(string:"https:\(fullWeatherData!.current.condition.icon)"){
                    self.iconImageView.kf.setImage(with: imageLink)
                    //print(imageLink)
                }
                self.weatherTypeLabel.text = " \(fullWeatherData!.current.condition.text)"
               
            }
        })
        dataTask.resume()
        
    }
    

    
    @IBAction func refreshData(_ sender: Any) {
        fetchData()
    }
    
    

}

