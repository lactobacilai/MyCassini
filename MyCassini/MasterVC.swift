//
//  MasterVC.swift
//  MyCassini
//
//  Created by welai on 2017-01-08.
//  Copyright © 2017 lactobacilai. All rights reserved.
//

import UIKit

class MasterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let fromUIButton = sender as? UIButton{
            
            if(segue.identifier == "segue_showImage"){
                print("prepare  segue_showImage ")
                
                if let navcon = segue.destination as? UINavigationController{
                    if let vc = navcon.visibleViewController as? DetailVC{
                        print("button title: \(fromUIButton.currentTitle)")
                        vc.title = fromUIButton.currentTitle
                    }
                }else{
                    if let vc = segue.destination as? DetailVC{
                        print("button title: \(fromUIButton.currentTitle)")
                        vc.title = fromUIButton.currentTitle
                    }

                }
            }
            
            
        }
    }
   
    
    
    
    //MARK: -Action Events
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segue_showImage", sender: sender)
    }
    
    
    
    

}
