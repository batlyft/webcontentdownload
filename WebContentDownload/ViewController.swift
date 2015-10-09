//
//  ViewController.swift
//  WebContentDownload
//
//  Created by Bat Computer on 10/9/15.
//  Copyright © 2015 HardSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "https://www.facebook.com")!
        
        // first option in notes allows you to display web content
        
       /* webView.loadRequest(NSURLRequest(URL: url))  */
        
        // second option allows you to load web content into your app
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            // Will execute when task completes
            
            if let urlContent = data {
                
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                    self.webView.loadHTMLString(String(webContent!), baseURL: nil)
                })
                
                
            }
            
        }
        
        task.resume()


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

