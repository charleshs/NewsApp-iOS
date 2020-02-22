//
//  NewsArticleViewController.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/22.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit
import WebKit

class NewsArticleViewController: UIViewController {

    private lazy var webView: WKWebView = {
        let config = WKWebViewConfiguration()
        let view = WKWebView(frame: .zero, configuration: config)
        return view
    }()
    
    private var url: URL?
    
    convenience init(urlString: String) {
        self.init()
        self.url = URL(string: urlString)
    }
    
    // MARK: - ViewController Life Cycle
    override func loadView() {
        super.loadView()
        setupWebView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView()
    }
    
    // MARK: - Private Methods
    private func loadWebView() {
        guard let url = url else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    private func setupWebView() {
        view.addSubview(webView)
        webView.fillToSafeArea()
    }
}
