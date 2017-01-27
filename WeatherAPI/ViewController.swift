//
//  ViewController.swift
//  WeatherAPI
//
//  Created by Fahd on 23/01/2017.
//  Copyright © 2017 Fahd. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    //spinner
    var spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    var loadingView: UIView = UIView()
    
    //spinner
    
    @IBOutlet weak var MyTableref: UITableView!
    var dictcitytemp = [String: Double]()
    var mydictonary=[String:AnyObject]()
    var actorsarray=[String:AnyObject]()
    var mysweat:[Weathertype]=[]
    var globCityname=""
    var globcitycount:Int=0
    //var arrayofobjects=[]()
    var temperature:Double=0.0
    var city:String=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.MyTableref.dataSource=self
        self.MyTableref.delegate=self
        
        showActivityIndicator()
        //
        //http://api.openweathermap.org/data/2.5/group?id=4163971,2147714,2174003&APPID=34605ed001ce1c650df89137aebc58f8
        
        
        Alamofire.request("http://api.openweathermap.org/data/2.5/weather?q=Sydneyl&APPID=34605ed001ce1c650df89137aebc58f8").responseJSON { response in
            //               Alamofire.request("http://api.openweathermap.org/data/2.5/group?id=4163971,2147714,2174003&APPID=34605ed001ce1c650df89137aebc58f8").responseJSON { response in
            
            
            //            print(response.request)  // original URL request
            //            print(response.response) // HTTP URL response
            //            print(response.data)     // server data
            //            print(response.result)   // result of response serialization
            self.hideActivityIndicator()
            if let JSON = response.result.value {
                //print("JSON: \(JSON)")
                
                let result=response.result
                if let dict=result.value as? Dictionary<String,AnyObject>
                {
                    if let citycount=dict["cnt"] as? Int{
                        self.globcitycount=citycount
                    }else{
                        self.globcitycount=1
                    }
                    
                    if let cityname=dict["name"] as? String
                    {
                        self.globCityname=cityname
                    }
                    
                    if let locmain=dict["main"]
                    {
//                        let w=Weathertype(dict: locmain as! Dictionary<String,AnyObject>, cityname: self.globCityname)
                        //let w=Weathertype(dict: locmain as! Dictionary<String,AnyObject>, cityname: self.globCityname,itemsequence:1)
                        let w=Weathertype(dict: locmain as! Dictionary<String,AnyObject>, cityname: self.globCityname,itemsequence:1,iwasclicked:0)
                        self.mysweat.append(w)
                        self.MyTableref.reloadData()
                    }
                }
            }
        }
        
        
        //second call to ALMOFIRE
        showActivityIndicator()
        Alamofire.request("http://api.openweathermap.org/data/2.5/weather?q=Melbourne&APPID=34605ed001ce1c650df89137aebc58f8").responseJSON { response in
            //               Alamofire.request("http://api.openweathermap.org/data/2.5/group?id=4163971,2147714,2174003&APPID=34605ed001ce1c650df89137aebc58f8").responseJSON { response in
            
            
                       self.hideActivityIndicator()
            if let JSON = response.result.value {
                //print("JSON: \(JSON)")
                
                let result=response.result
                if let dict=result.value as? Dictionary<String,AnyObject>
                {
                    if let citycount=dict["cnt"] as? Int{
                        self.globcitycount=citycount
                    }else{
                        self.globcitycount=1
                    }
                    
                    if let cityname=dict["name"] as? String
                    {
                        self.globCityname=cityname
                    }
                    
                    if let locmain=dict["main"]
                    {
//                        let w=Weathertype(dict: locmain as! Dictionary<String,AnyObject>, cityname: self.globCityname)
                        //let w=Weathertype(dict: locmain as! Dictionary<String,AnyObject>, cityname: self.globCityname,itemsequence:2)
                        let w=Weathertype(dict: locmain as! Dictionary<String,AnyObject>, cityname: self.globCityname,itemsequence:2,iwasclicked:0)
                        self.mysweat.append(w)
                        self.MyTableref.reloadData()
                    }
                }
            }
        }
        
        showActivityIndicator()
        //Third call to Almofilre
        Alamofire.request("http://api.openweathermap.org/data/2.5/weather?q=Brisbane&APPID=34605ed001ce1c650df89137aebc58f8").responseJSON { response in
            //               Alamofire.request("http://api.openweathermap.org/data/2.5/group?id=4163971,2147714,2174003&APPID=34605ed001ce1c650df89137aebc58f8").responseJSON { response in
            
            
          
            self.hideActivityIndicator()
            if let JSON = response.result.value {
                //print("JSON: \(JSON)")
                
                let result=response.result
                if let dict=result.value as? Dictionary<String,AnyObject>
                {
                    if let citycount=dict["cnt"] as? Int{
                        self.globcitycount=citycount
                    }else{
                        self.globcitycount=1
                    }
                    
                    if let cityname=dict["name"] as? String
                    {
                        self.globCityname=cityname
                    }
                    
                    if let locmain=dict["main"]
                    {
                        //let w=Weathertype(dict: locmain as! Dictionary<String,AnyObject>, cityname: self.globCityname,itemsequence:3)
                        
                        let w=Weathertype(dict: locmain as! Dictionary<String,AnyObject>, cityname: self.globCityname,itemsequence:3,iwasclicked:0)
                        
                        self.mysweat.append(w)
                        self.MyTableref.reloadData()
                    }
                }
            }
        }
        
        
        
        
        

    }//end of view did load
    
    
    
    //spinner start
    func showActivityIndicator() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // in half a second...            self.loadingView = UIView()
            self.loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
            self.loadingView.center = self.view.center
            self.loadingView.backgroundColor = UIColor.brown
            self.loadingView.alpha = 0.7
            self.loadingView.clipsToBounds = true
            self.loadingView.layer.cornerRadius = 10
            
            self.spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
            self.spinner.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
            self.spinner.center = CGPoint(x:self.loadingView.bounds.size.width / 2, y:self.loadingView.bounds.size.height / 2)
            
            self.loadingView.addSubview(self.spinner)
            self.view.addSubview(self.loadingView)
            self.spinner.startAnimating()
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.spinner.stopAnimating()
            self.loadingView.removeFromSuperview()
        }
    }
    
    //spinner end
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mysweat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MyTableref.dequeueReusableCell(withIdentifier: "mycellidentifier") as? MyCustomCell
        cell?.lblcityname.text=mysweat[indexPath.row].cityname
        cell?.lbltemperature.text=String(mysweat[indexPath.row].temp)
        //print(dictcitytemp)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("clicked cell")
        //print("indexPath.row is \(indexPath.row)")
        mysweat[indexPath.row].iwasclicked=1
        
        performSegue(withIdentifier: "myseguedetail", sender: mysweat)
        
        //print(mysweat[indexPath.row].cityname)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //print("prepare for segue method is called")
        
        if segue.identifier=="myseguedetail"
        {
            let destinationviewcontroller = segue.destination as? DetailViewController
            destinationviewcontroller?.localdetailweather=(sender as? [Weathertype])!
            
            //destinationviewcontroller?.another=sender
            //print("all ok")
        }
        
    }
    
}
