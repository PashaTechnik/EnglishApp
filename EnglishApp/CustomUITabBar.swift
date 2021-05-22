import Foundation
import UIKit
import DeviceCheck

class CustomTabBar: UITabBar {
    
    
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
        
                case 1792:
                    do {
                        var size = super.sizeThatFits(size)
                        size.height = 90
                        return size
                    }
                default:
                    do {
                        var size = super.sizeThatFits(size)
                        size.height = super.frame.height
                        return size
                    }
            }
            
    }
        
        var size = super.sizeThatFits(size)
        size.height = super.frame.height
        return size
    }
}

