//
//  WebViewContainerViewController.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 18.09.2021.
//

import UIKit
import WebKit

class WebViewContainerViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // html content gosterelim font ve font buyuklugunu css ile degistirelim

        // Do any additional setup after loading the view.
        
//        let preferences = WKPreferences()
//        preferences.javaScriptEnabled = true
//
//        let configuration = WKWebViewConfiguration()
//        configuration.preferences = preferences
        backButtonItem.addObserver(self, forKeyPath: #keyPath(WKWebView.canGoBack), options: .new, context: nil)
        
        activityIndicatorView = UIActivityIndicatorView(style: .medium)
        activityIndicatorView.color = .red
        activityIndicatorView.startAnimating()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: activityIndicatorView)
        
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url,
                                    cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                    timeoutInterval: TimeInterval(8))
        
        webView.allowsBackForwardNavigationGestures = true
        webView.load(urlRequest)
        webView.addObserver(self,
                            forKeyPath: #keyPath(WKWebView.isLoading),
                            options: .new,
                            context: nil)
        
        webView.uiDelegate = self
        webView.navigationDelegate = self
    }
    
    private var activityIndicatorView: UIActivityIndicatorView!
    
    var urlString: String!
    
//    override class func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if keyPath == "loading" {
//            if webView.isLoading {
//
//            }
//        }
//    }
    

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "loading" {
            if webView.isLoading {
                activityIndicatorView.startAnimating()
            } else {
                activityIndicatorView.stopAnimating()
            }
            
            activityIndicatorView.isHidden = !webView.isLoading
        }
        if keyPath == "false" {
            print("Back icin observer calisiyor.")
            backButtonItem.isEnabled.toggle()
        }
        
    }
//      MARK: - IBActions ToolBar Items
    @IBAction func reloadButtonTapped(_ sender: UIButton) {
        webView.reload()
    }
    
    @IBAction func refreshButtonItemTapped(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @IBAction func forwardButtonItemTapped(_ sender: UIBarButtonItem) {
        guard webView.canGoForward else{ return  print("cant go forward ")}
        webView.goForward()
    }
    
    @IBAction func backButtonItemTapped(_ sender: UIBarButtonItem) {
        guard webView.canGoBack else{   return print("cant go forward ")}
        webView.goBack()
    }
    
    @IBAction func openSafariButtonTapped(_ sender: Any) {
        print("Safari acma basildi.")
        if let url = webView.url {
            UIApplication.shared.open(url)
        }
    }
    
    
}

extension WebViewContainerViewController: WKUIDelegate {
    
}

extension WebViewContainerViewController: WKNavigationDelegate {
    
}
