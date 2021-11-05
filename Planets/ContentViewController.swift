//
//  ContentViewController.swift
//  Planets
//
//  Created by John Davey Ferrer on 2021-10-29.
//

import UIKit
import WebKit

class ContentViewController: UIViewController {

    // Connect UILabel var contentPlanetName to ContentViewController
    @IBOutlet var contentPlanetName: UILabel!
    
    // Connect UIImageView to ContentViewController
    @IBOutlet var contentPlanetImage: UIImageView!
    
    // Connect UILabel var contentDescription to ContentViewController
    @IBOutlet var contentDescription: UILabel!
  
    // Connect UIActivityIndicatorView var activityIndicator to ContentViewController
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // Connect WKWebView var youTubeVideo to ContentViewController
    @IBOutlet var youTubeVideo: WKWebView!
    
    var planetName = ""
    var planetImage = UIImage()
    var planetDescription = ""
    var youtube = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Container for planet name
        contentPlanetName.text = planetName
        // Container for planet image
        contentPlanetImage.image = planetImage
        contentPlanetImage.layer.backgroundColor = UIColor.quaternarySystemFill.cgColor
        contentPlanetImage.layer.cornerRadius = 35
        contentPlanetImage.layer.shadowColor = UIColor.gray.cgColor
        contentPlanetImage.layer.shadowRadius = 35
        // Container for Description
        contentDescription.text = planetDescription
        
        // Embedding the youtube video into the View
        let request = URLRequest(url: URL(string: youtube)!)
        self.youTubeVideo.load(request)
 
        self.youTubeVideo.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
            }
    
    
    // Activity Indicator animation for youtube video
        override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
            if keyPath == "loading" {
            if youTubeVideo.isLoading {
                activityIndicator.startAnimating()
                activityIndicator.isHidden = false
                    }
                    else {
                        activityIndicator.stopAnimating()
                        activityIndicator.isHidden = true
      }
   }
    

}
        
    }
    
    


