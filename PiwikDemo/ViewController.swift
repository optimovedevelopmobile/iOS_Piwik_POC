import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        PiwikManager.shared.reportViewReached("root", in: "Main", force: true)
    }
    
    @IBAction func clicked(_ sender: UIButton) {
        
        PiwikManager.shared.respotSocialInteraction("like", on: "Benni", forNetwork: "Facebook")
    }
}
