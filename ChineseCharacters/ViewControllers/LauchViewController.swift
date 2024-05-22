//
//  LauchViewController.swift
//  ChineseCharacters
//
//  Created by mac on 15.05.2024.
//

import UIKit

class LauchViewController: UIViewController {
    private lazy var viewToAnimate: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view.center.x = self.view.center.x-300
        view.center.y = self.view.center.y-100
        view.backgroundColor = .blue
        let image=UIImage(named: "logo")
        view.image=image
        view.layer.cornerRadius=50
        //view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        setUIElements()
    }
    func setUIElements() {
        self.view.addSubview(viewToAnimate)
        UIView.animate(withDuration: 2, delay: 2, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.2) {
            self.viewToAnimate.center.x=self.view.center.x
        } completion: { bool in
            let layout = UICollectionViewFlowLayout()
            let destionationVC = CollectionViewController(collectionViewLayout: layout)
            self.navigationController?.pushViewController(destionationVC, animated: true)
        }
    }
}


/*

 */
