//
//  ImageVC.swift
//  MyCassini
//
//  Created by welai on 2017-01-08.
//  Copyright © 2017 lactobacilai. All rights reserved.
//

/*
 TODO: make zooming work
 -set scrollView contentSize == to the imageView's frameBounds
 */



import UIKit

class ImageVC: UIViewController, UIScrollViewDelegate {

    
    //MODEL
    private var imageURL: URL?{
        didSet{
            print("imageURL-didSet")
            //as soon as the model is set, fetch a url, get the image and assign to imageVar
            fetchImage()
        }
    }
    
    
    //outlets
    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
        }
    }
    
    
    
    
    //VARS
    private var imageView = UIImageView()
    //setter~getter for imageView
    private var imageVar: UIImage?{
        get{
           return imageView.image
        }
        set{
            print("imageVar-set")
            imageView.image = nil
            imageView.image = newValue
            imageView.sizeToFit() //Resizes and moves the receiver view so it just encloses its subviews.
            
            //for scrolling
            scrollView?.contentSize = imageView.frame.size
        }
    }
    
    
    
    //MARK: - Helper Functions
    
    /*
    //for zooming
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    */
    
    
    //gets the image from URL and assign to imageVar
    private func fetchImage(){
        
        if let url = imageURL{
            if let data = try? Data(contentsOf: url){
                print("fetchImage")
                self.imageVar = UIImage(data: data)
            }
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(self.imageView)
        self.imageURL = DemoURL.nasaURLwithImageName(imageName: "SuzhiCrater")
        
        
        
        print("viewDidLoad")
    }

    
    
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}//end class
