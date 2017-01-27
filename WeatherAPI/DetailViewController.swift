//
//  DetailViewController.swift
//  WeatherAPI
//
//  Created by Fahd on 26/01/2017.
//  Copyright © 2017 Fahd. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    var loadingView: UIView = UIView()

    var localdetailweather:[Weathertype]=[]
    
    //var another:AnyObject=""
    
    //Weather Summary to be filled
    @IBOutlet weak var DetailCityName: UILabel!
    @IBOutlet weak var MaxTemp: UILabel!
    @IBOutlet weak var Mintemp: UILabel!
    @IBOutlet weak var Humidity: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("load of second view controller")
        //print(localdetailweather.count)
        if (localdetailweather.count>0){
            //print(localdetailweather.count)
            loaddataonscreen(paraarrweather:localdetailweather)
        }else{
            //call an action sheet for no data found
            let alert=UIAlertController(title: "Data not available", message: "No Data Available", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
        

        // Do any additional setup after loading the view.
    }

    func loaddataonscreen(paraarrweather:[Weathertype])
    {
        for index in 0..<paraarrweather.count{
            print(paraarrweather[index].iwasclicked)
            if(paraarrweather[index].iwasclicked==1)
            {
                self.DetailCityName.text=localdetailweather[index].cityname
                self.MaxTemp.text=String(round(localdetailweather[index].temp_max))
                self.Mintemp.text=String(round(localdetailweather[index].temp_min))
                self.Humidity.text=String(round(localdetailweather[index].humidity))
                paraarrweather[index].iwasclicked=0
            }
            
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
