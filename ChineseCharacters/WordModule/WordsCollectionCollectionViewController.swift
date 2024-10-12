import UIKit


/*
private let reuseIdentifier = "cell"

class WordsCollectionViewController: UICollectionViewController {
    
    var currentPage: Int = 0
    var words: [Word] = Word.getWords()
    var text: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = text
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.collectionView.collectionViewLayout = layout
        self.collectionView.isPagingEnabled = true
        
        self.collectionView.backgroundColor = .black
        self.collectionView!.register(WordsCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         words.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! WordsCollectionViewCell
        let word = words[indexPath.row]
        cell.setWord(word: word)
        return cell
    }
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! WordsCollectionViewCell
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState) {
            cell.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
         
        } completion: { bool in
            UIView.animate(withDuration: 0.5, delay: 0, options: .beginFromCurrentState) {
                
                cell.transform=CGAffineTransform.init(scaleX: 1.0, y: 1.0)
                
                if cell.word?.isFlipped==false {
                    cell.flipCard(duration: 0.5)
                    SoundManager.shared.playSound(name: Sounds.flip.rawValue)
                    cell.word?.isFlipped=true
                } else {
                    cell.flipBack(duration: 0.5)
                    SoundManager.shared.playSound(name: Sounds.flip.rawValue)
                    cell.word?.isFlipped=false
                }
            }
                    }

                  }
                
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let windth = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x/windth)
    }
}

extension WordsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let windth = collectionView.frame.width
        let height = UIScreen.main.bounds.height-400
        return CGSize(width: windth, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
*/
