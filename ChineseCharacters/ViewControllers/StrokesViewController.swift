//
//  StrokesViewController.swift
//  ChineseCharacters
//
//  Created by mac on 10.05.2024.
//

import UIKit
import WebKit

class StrokesViewController: UIViewController {

     //let webView = WKWebView()
     
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
  
    /*
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        button.backgroundColor = .cyan
        //button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = .white
        setUIElements()
        // Do any additional setup after loading the view.
    }
    
    func setUIElements() {
        
        self.view.addSubview(webView)
        
        guard let url = URL(string: "https://www.youtube.com/channel/UCyk1YbYleI0aw1OC8kNm6Qw") else {
            return
        }
        webView.load(URLRequest(url: url))
        
        //Constraints
        
        let screenWindth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let viewWindth = screenWindth/1.5
        let viewHeight = screenHeight/2.5
        
        webView.widthAnchor.constraint(equalToConstant: viewWindth).isActive = true
        webView.heightAnchor.constraint(equalToConstant: viewHeight).isActive = true
        webView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        webView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
