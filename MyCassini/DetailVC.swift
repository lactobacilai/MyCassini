//
//  DetailVC.swift
//  MyCassini
//
//  Created by welai on 2017-01-08.
//  Copyright © 2017 lactobacilai. All rights reserved.
//

import UIKit

var counter = 0

class DetailVC: UIViewController, UIScrollViewDelegate {

    
    //MODEL
    var imageURL: URL?{
        didSet{
            //as soon as this is set, fetch the image
            fetchImage()
        }
    }
    
    
    //OUTLETS
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            
            //set content
            scrollView.contentSize = imageView.bounds.size
            
            //for zooming, define max-min
            scrollView.delegate = self
            scrollView.maximumZoomScale = 1.0
            scrollView.minimumZoomScale = 0.03
            
            
        }
    }
    
    
    
    //VARS
    private var imageView = UIImageView()
    private var imageVar: UIImage? {
        get{
            return imageView.image
        }
        set{
            //reset imageView before reassigning
            imageView.image = nil
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.bounds.size
        }
    }
    
    
    
    
    
    //MARK: -Helper Functions
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    
    
    private func fetchImage(){
        
        if let url = imageURL{
            
            //put in a que
            DispatchQueue(label: "com.lactobacilai.loadImage",
                          qos: DispatchQoS.userInitiated
            ).async {
                
                
                //TODO: needed to check current image to fetch
                
                if let imageData = try? Data(contentsOf: url, options: Data.ReadingOptions.alwaysMapped){
                    
                    DispatchQueue.main.async {
                        self.imageVar = UIImage(data: imageData)
                        self.activityIndicator.stopAnimating()
                    }
                    
                }else{
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter += 1
        print("viewDidLoad counter: \(counter)")
        //add imageView to parentView
        scrollView.addSubview(imageView)
        //assign the model
        self.imageURL = DemoURL.nasaURLwithImageName(imageName: "Earth")

    }

    deinit{
        counter -= 1
        print("deinit counter: \(counter)")
    }
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    

}
