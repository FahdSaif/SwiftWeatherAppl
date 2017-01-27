//
//  Weathertype.swift
//  Pods
//
//  Created by Fahd on 26/01/2017.
//
//

import UIKit

class Weathertype: NSObject {
    var humidity:Double=0.0
    var pressure:Double=0.0
    var temp:Double=0.0
    var temp_max:Double=0.0
    var temp_min:Double=0.0
    var cityname:String=""
    var itemsequence:Int=0
    var iwasclicked:Int=0

    
//    humidity = 83;
//    pressure = 1016;
//    temp = "295.15";
//    "temp_max" = "295.15";
//    "temp_min" = "295.15";
    
    
    
    init(dict:Dictionary<String,AnyObject>) {
        super.init()
        self.setValuesForKeys(dict)
    }
    
    
    init(dict:Dictionary<String,AnyObject>,cityname:String,itemsequence:Int,iwasclicked:Int)
    {
        super.init()
        self.setValuesForKeys(dict)
        self.cityname=cityname
        self.itemsequence=itemsequence
        self.iwasclicked=iwasclicked
    }

    
    init(dict:Dictionary<String,AnyObject>,cityname:String) {
        super.init()
        self.setValuesForKeys(dict)
        self.cityname=cityname
    }
    
    init(dict:Dictionary<String,AnyObject>,cityname:String,itemsequence:Int) {
        super.init()
        self.setValuesForKeys(dict)
        self.cityname=cityname
    }
    
    init(humidity:Double,pressure:Double,temp:Double,temp_max:Double,temp_min:Double,itemsequence:Int)
    {
        self.humidity=humidity
        self.pressure=pressure
        self.temp=temp
        self.temp_max=temp_max
        self.temp_min=temp_min
        self.itemsequence=itemsequence
    }
    
    
    
    override init(){
        super.init()
    }
    
    
}
