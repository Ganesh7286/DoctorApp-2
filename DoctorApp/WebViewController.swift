//
//  WebViewController.swift
//  DoctorApp
//
//  Created by sravan yadav on 20/05/24.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    
    @IBOutlet var loader: UIActivityIndicatorView!
    
    var urlurl : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        let myblog = "https://www.google.com/"
        let url = NSURL(string: myblog)
        let request = NSURLRequest(url: url! as URL)

        webView = WKWebView(frame: self.view.frame)
        webView.navigationDelegate = self
        webView.load(request as URLRequest)
        self.view.addSubview(webView)
        self.view.sendSubviewToBack(webView)
    
    }
    func setGradientBackground() {
            let colorTop =  UIColor(red: 114/255.0, green: 141/255.0, blue: 162/255.0, alpha: 1.0).cgColor
            let colorBottom = UIColor(red: 17/255.0, green: 65/255.0, blue: 103/255.0, alpha: 1.0).cgColor
                        
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [colorTop, colorBottom]
            gradientLayer.locations = [0.0, 1.0]
            gradientLayer.frame = self.view.bounds
                    
            self.view.layer.insertSublayer(gradientLayer, at:0)
        }
        
        override func viewWillAppear(_ animated: Bool) {
            setGradientBackground()
            super.viewWillAppear(animated)
        }
    private func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        print(error.localizedDescription)
        }


    @objc func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Strat to load")
            self.loader.isHidden = false
            loader.startAnimating()
            }

    @objc(webView:didFinishNavigation:) internal func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish to load")
            self.loader.isHidden = true
            loader.stopAnimating()
        }

}
