//
//  YouTubeVideoController.swift
//  Planets
//
//  Created by John Davey Ferrer on 2021-10-30.
//

import UIKit
import WebKit

class YouTubeVideoController: UIViewController {

    @IBOutlet var youTube: WKWebView!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    var youtube = ""
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = URLRequest(url: URL(string: youtube)!)
        self.youTube.load(request)
        
        self.youTube.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
            }
            override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
                if keyPath == "loading" {
                    if youTube.isLoading {
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
