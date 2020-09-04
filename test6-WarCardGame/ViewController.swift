
import UIKit

class ViewController: UIViewController {
    
    var leftScore = 0
    var rightScore = 0
    
    @IBOutlet weak var leftCardView: UIImageView!
    
    @IBOutlet weak var leftScoreLabel: UILabel!
    
    @IBOutlet weak var rightCardView: UIImageView!
    
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func deal() {
        let leftNumber = Int.random(in: 2...14)
        let rightNumber = Int.random(in: 2...14)
        leftCardView.image = UIImage(named: "card\(leftNumber)")
        rightCardView.image = UIImage(named: "card\(rightNumber)")
        
        if leftNumber > rightNumber {
            leftScore += 1
        }
        if  rightNumber > leftNumber {
            rightScore += 1
        }
        
    }
    
    fileprivate func check() {
        if leftScore>=10 || rightScore>=10 {
            let msg = leftScore >= 10
                ? "U Are the Winner!": "U R Looooooser..."
            print(msg)
            
            leftScore = 0
            rightScore = 0
            
            
            let alert = UIAlertController(title: "Hey!", message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    fileprivate func updateUIScores() {
        leftScoreLabel.text = String(leftScore)
        rightScoreLabel.text=String(rightScore)
    }
    
    @IBAction func dealTaped(_ sender: Any) {
        print("dealTaped")
        deal()
        check()
        updateUIScores()
    }
    
    
    
}

