import UIKit
import CoreMotion

class StaticShadowHeaderView: UIView, NibView {

    @IBOutlet private weak var backgroundContainerView: UIView!

    @IBOutlet weak var dateLabel: UILabel!
    /// Core Motion Manager
    private let motionManager = CMMotionManager()

    /// Shadow View
    private weak var shadowView: UIView?

    /// Inner Margin
    private static let kInnerMargin: CGFloat = 20.0

    required init?(coder aDecoder: NSCoder) {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, d MMM"
        let curDate = formatter.string(from: date)
        super.init(coder: aDecoder)
        xibSetup()

        backgroundContainerView.layer.cornerRadius = 14.0
        dateLabel.text = curDate
    }

    override init(frame: CGRect) {
       
        super.init(frame: frame)
        xibSetup()
        backgroundContainerView.layer.cornerRadius = 14.0
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        configureShadow()
    }

    // MARK: - Shadow

    private func configureShadow() {
        // Shadow View
        self.shadowView?.removeFromSuperview()
        let shadowView = UIView(frame: CGRect(x: StaticShadowHeaderView.kInnerMargin,
                                              y: StaticShadowHeaderView.kInnerMargin,
                                              width: bounds.width - (2 * StaticShadowHeaderView.kInnerMargin),
                                              height: bounds.height - (2 * StaticShadowHeaderView.kInnerMargin)))
        insertSubview(shadowView, at: 0)
        self.shadowView = shadowView

        // Roll/Pitch Dynamic Shadow
        //        if motionManager.isDeviceMotionAvailable {
        //            motionManager.deviceMotionUpdateInterval = 0.02
        //            motionManager.startDeviceMotionUpdates(to: .main, withHandler: { (motion, error) in
        //                if let motion = motion {
        //                    let pitch = motion.attitude.pitch * 10 // x-axis
        //                    let roll = motion.attitude.roll * 10 // y-axis
        //                    self.applyShadow(width: CGFloat(roll), height: CGFloat(pitch))
        //                }
        //            })
        //        }
        self.applyShadow(width: CGFloat(0.0), height: CGFloat(0.0))
    }

    private func applyShadow(width: CGFloat, height: CGFloat) {
        if let shadowView = shadowView {
            let shadowPath = UIBezierPath(roundedRect: shadowView.bounds, cornerRadius: 14.0)
            shadowView.layer.masksToBounds = false
            shadowView.layer.shadowRadius = 14.0
            shadowView.layer.shadowColor = UIColor.black.cgColor
            shadowView.layer.shadowOffset = CGSize(width: width, height: height)
            shadowView.layer.shadowOpacity = 0.15
            shadowView.layer.shadowPath = shadowPath.cgPath
        }
    }

}
