import Foundation
import SwiftUI
import Combine
import WebKit
import UIKit

struct VKAuthView: UIViewRepresentable {
    @ObservedObject var viewModel: VKAuthViewModel
    
    func makeUIView(context: Context) -> WKWebView {
        let preferences = WKPreferences()
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        let webView = WKWebView(frame: CGRect.zero, configuration: configuration)
        
        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.isScrollEnabled = true
        webView.navigationDelegate = viewModel.delegate
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        if let request = viewModel.urlRequest {
            if viewModel.clearCookie {
                webView.configuration.websiteDataStore.httpCookieStore.getAllCookies { cookies in
                    for cookie in cookies {
                        webView.configuration.websiteDataStore.httpCookieStore.delete(cookie)
                    }
                }
            }
            
            webView.load(request)
        }
    }
}
