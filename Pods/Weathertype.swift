//
//  Weathertype.swift
//  Pods
//
//  Created by Fahd on 26/01/2017.
//
//

import UIKit

class Weathertype: NSObject {
    var humidity:Int=0
    var pressure:Double=0.0
    var temp:String?=""
    var temp_max:String?=""
    var temp_min:String?=""
    
    init(dict:Dictionary<String,AnyObject>) {
        super.init()
        self.setValuesForKeys(dict)
    }
    
    init(humidity:Int,pressure:Double,temp:String,tempmax:String,tempmin:String)
    {
        self.humidity=humidity
        self.pressure=pressure
        self.temp=temp
        self.temp_max=tempmax
        self.temp_min=tempmin
    }
    
}
