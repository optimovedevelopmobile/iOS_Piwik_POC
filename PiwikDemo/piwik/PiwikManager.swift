import Foundation
import PiwikTracker

class PiwikManager {
    
    static let shared = PiwikManager()
    
    static let ServerUrlString = "http://104.197.238.220/"
    static let PiwikServerId = "1"
    
    fileprivate let tracker: PiwikTracker
    
    private init() {
        
        tracker = PiwikTracker.sharedInstance(withSiteID: PiwikManager.PiwikServerId, baseURL: URL(string: PiwikManager.ServerUrlString)!)
        tracker.userID = "test@test.test"
    }
    
    func reportViewReached(_ view: String, in viewController: String, force: Bool = false) {
        
        if force {
            forceDispatch()
        }
        tracker.sendView("\(viewController)/\(view)")
    }
    
    func respotSocialInteraction(_ interaction: String, on target: String, forNetwork network: String, force: Bool = false) {
        
        if force {
            forceDispatch()
        }
        tracker.sendSocialInteraction(interaction, target: target, forNetwork: network)
    }
}

//MARK: - Helper methods

extension PiwikManager {
    
    fileprivate func forceDispatch() {
        
        tracker.dispatchInterval = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) { [unowned self] in
            self.tracker.dispatchInterval = 120
        }
    }
}
