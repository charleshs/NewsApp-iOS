//
//  ArticleWebpageViewController.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/22.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit
import WebKit

class ArticleWebpageViewController: BaseViewController {

    private let webView: WKWebView = {
        let configuration = WKWebViewConfiguration()
        let view = WKWebView(frame: .zero, configuration: configuration)
        return view
    }()
    
    private var urlString: String = ""
    
    convenience init(urlString: String) {
        self.init()
        self.urlString = urlString
    }
    
    // MARK: - ViewController Life Cycle
    override func loadView() {
        super.loadView()
        setupViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView()
    }
    
    func loadWebView() {
        let encodedUrlString = encodedString(urlString)
        guard let url = URL(string: encodedUrlString) else {
            print(">>> Invalid URL")
            return
        }
        webView.load(URLRequest(url: url))
    }
    
    private func encodedString(_ input: String) -> String {
        
        let output = input.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        return output ?? input
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        view.addSubview(webView)
        webView.fillToSafeArea()
    }
}
