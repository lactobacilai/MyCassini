//
//  DemoURL.swift
//  MyCassini
//
//  Created by welai on 2017-01-07.
//  Copyright © 2017 lactobacilai. All rights reserved.
//

import Foundation


struct DemoURL{
    
    static let SuzhiCrater = "http://www.jpl.nasa.gov/spaceimages/images/largesize/PIA21273_hires.jpg"
    
    
    static let nasaImagesDict = [
        "SuzhiCrater":"http://www.jpl.nasa.gov/spaceimages/images/largesize/PIA21273_hires.jpg",
        "Earth":"http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
        "Saturn":"http://www.nasa.gov/sites/default/files/saturn_collage.jpg"
    ]
    
    
    //returns the NSURL of a given nasaImage name
    //note: imageName may not exists in the Dictionary hence might return nil
    static func nasaURLwithImageName(imageName: String?) -> NSURL?{
        
        if let strURL = nasaImagesDict[imageName ?? ""]{
            return NSURL(string: strURL)
        }
        
        return nil
        
    }
    
    
}
