//
//  DemoURL.swift
//  MyCassini
//
//  Created by welai on 2017-01-07.
//  Copyright © 2017 lactobacilai. All rights reserved.
//

import Foundation


struct DemoURL{
    
    //used only for testing 1 image
    //static let SuzhiCrater = "http://www.jpl.nasa.gov/spaceimages/images/largesize/PIA21273_hires.jpg"
    
    //the model actually uses this
    static let nasaImagesDict = [
        "SuzhiCrater":"http://www.jpl.nasa.gov/spaceimages/images/largesize/PIA21273_hires.jpg",
        "Earth":"http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
        "Saturn":"http://www.nasa.gov/sites/default/files/saturn_collage.jpg"
    ]
    
    
    //returns the NSURL of a given nasaImage name
    //note: imageName may not exists in the Dictionary hence might return nil
    static func nasaURLwithImageName(imageName: String?) -> URL?{
        
        if let strURL = nasaImagesDict[imageName ?? ""]{
            return URL(string: strURL)
        }
        
        return nil
        
    }
    
    
}
