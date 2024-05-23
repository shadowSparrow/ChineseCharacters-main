//
//  CollectionViewController.swift
//  ChineseCharacters
//
//  Created by mac on 24.10.2023.
//

import UIKit

private let reuseIdentifier = "Cell"
var characters = Characters.allCases.shuffled()

class CollectionViewController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Collection"
        let titleDict: NSDictionary = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict as! [NSAttributedString.Key : Any]
        self.navigationItem.setHidesBackButton(true, animated: true)
                
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.collectionView.collectionViewLayout = layout
        self.collectionView.backgroundColor = .black
        self.collectionView!.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(pressGestureAction))
        collectionView.addGestureRecognizer(longPressGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animateLayout()
    }

    @objc func pressGestureAction(_ gesture: UILongPressGestureRecognizer) {
        let gestureLocation = gesture.location(in: collectionView)
        switch gesture.state {
        case .began:
            guard let targetIndexPath = collectionView.indexPathForItem(at: gestureLocation) else {return}
            collectionView.beginInteractiveMovementForItem(at: targetIndexPath)
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(gestureLocation)
        case .ended:
            collectionView.endInteractiveMovement()
        default:
            collectionView.cancelInteractiveMovement()
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return characters.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.characterLabel.text = characters[indexPath.row].rawValue
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let char = characters.remove(at: sourceIndexPath.row)
        characters.insert(char, at: destinationIndexPath.row)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            cell.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
            cell.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        }) { bool in
            let destinationVC = ViewController()
            destinationVC.character = cell.characterLabel.text ?? "Nil passed"
            self.navigationController?.pushViewController(destinationVC, animated: true)
            }
    }
    
    private func animateLayout() {
        UICollectionView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState) {
            for cell in self.collectionView.visibleCells {
                cell.transform = CGAffineTransform(scaleX: 0.9 , y: 0.9)
            }
        } completion: { bool in
            UICollectionView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState) {
                for cell in self.collectionView.visibleCells {
                    cell.transform = CGAffineTransform(scaleX: 1 , y: 1)
                }
            }
        }
    }
    
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let inset = 10
        let numberOfItems = 4
        let allInsets = (inset*numberOfItems)-1
        
        let collectionViewWindth = Int(UIScreen.main.bounds.width) - (2*inset)
        let pureWindth = Int(collectionViewWindth) - allInsets
        let itemWindth = pureWindth/4
        
        return CGSize(width: itemWindth, height: itemWindth*Int(1.5))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}

/*
 
     
     
     UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
         cell.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
         cell.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
     }) { bool in
         
         }
     
 
 */
