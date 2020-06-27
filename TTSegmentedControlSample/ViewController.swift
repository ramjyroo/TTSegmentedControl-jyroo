//
//  ViewController.swift
//  TTSegmentedControlSample
//
//  Created by Efraim Budusan on 10/8/17.
//  Copyright © 2017 Tapptitude. All rights reserved.
//

import UIKit
import TTSegmentedControl
extension Int {
    var dp: CGFloat {
        return CGFloat(self).dp
    }
}
extension Double {
    var dp: CGFloat {
        return CGFloat(self).dp
    }
}
extension UIView {
    func setup(_ constraints: NSLayoutConstraint...) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    func showBorder(color: UIColor = UIColor.black, width: CGFloat = 0.5) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
extension CGFloat {
    var dp: CGFloat {
        return self * (UIScreen.main.bounds.width / 768.0)
    }
}
extension UIFont {
    class var defaultTextSegmentedControl: UIFont {
        let font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 21.dp)!
        print(font)
        return font
    }
}

enum LoginTabType: String {
    static let allCases: [LoginTabType] = [.apple, .facebook, .google]
    case apple, facebook, google
    var title: String {
        return self.rawValue.capitalized
    }
    var defaultIcon: UIImage? {
        return UIImage(named: self.rawValue)
    }
    var selectedIcon: UIImage? {
        return UIImage(named: "\(self.rawValue)Selected")
    }
}
extension UIColor {
    
    @nonobjc class var darkPeriwinkle: UIColor {
        return UIColor(red: 99.0 / 255.0, green: 103.0 / 255.0, blue: 212.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var lightPeriwinkle: UIColor {
        return UIColor(red: 207.0 / 255.0, green: 207.0 / 255.0, blue: 252.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var lightLavenderThree: UIColor {
      return UIColor(red: 226.0 / 255.0, green: 197.0 / 255.0, blue: 1.0, alpha: 1.0)
    }
    @nonobjc class var liliacFour: UIColor {
        return UIColor(red: 192.0 / 255.0, green: 145.0 / 255.0, blue: 1.0, alpha: 1.0)
    }
    @nonobjc class var darkIndigoTwo: UIColor {
        return UIColor(red: 41.0 / 255.0, green: 13.0 / 255.0, blue: 111.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var liliacThree: UIColor {
        return UIColor(red: 229.0 / 255.0, green: 139.0 / 255.0, blue: 1.0, alpha: 1.0)
    }
    @nonobjc class var easterPurple: UIColor {
        return UIColor(red: 189.0 / 255.0, green: 122.0 / 255.0, blue: 1.0, alpha: 1.0)
    }
    @nonobjc class var easterPurpleTwo: UIColor {
        return UIColor(red: 177.0 / 255.0, green: 117.0 / 255.0, blue: 1.0, alpha: 1.0)
    }
    
    @nonobjc class var purpleyTwo: UIColor {
        return UIColor(red: 109.0 / 255.0, green: 84.0 / 255.0, blue: 239.0 / 255.0, alpha: 1.0)
    }
}

class ViewController: UIViewController {
    
    let titles = ["Apple", "Facebook", "Twitter", "Github"]
    let bgView = UIView(frame: .zero)
    let segmentedControl = TTSegmentedControl(frame: .zero)
    var defaultTextFont: UIFont {
        return UIFont.defaultTextSegmentedControl
    }
    var selectedTextFont: UIFont {
        return UIFont.defaultTextSegmentedControl
    }
    var defaultTextColor: UIColor {
        return UIColor.darkIndigoTwo
    }
    var selectedTextColor: UIColor {
        return UIColor.white
    }
    init() {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        self.view.addSubview(bgView)
        self.view.addSubview(segmentedControl)
    }
    
    func setupSubviews() {
        self.setupBgView()
        self.setupSegmentedControl()
    }
    func setupBgView() {
        let width = 467.dp
        let height = 45.dp
        self.bgView.backgroundColor = UIColor.lightLavenderThree
        self.bgView.showBorder(color: UIColor.liliacFour, width: 1.dp)
        self.bgView.layer.cornerRadius = 15.dp
        self.bgView.setup(
            self.bgView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.bgView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.bgView.widthAnchor.constraint(equalToConstant: width),
            self.bgView.heightAnchor.constraint(equalToConstant: height)
        )
    }
    func setupSegmentedControl() {
        self.segmentedControl.allowChangeThumbWidth = false
        self.segmentedControl.setup(
            self.segmentedControl.centerXAnchor.constraint(equalTo: self.bgView.centerXAnchor),
            self.segmentedControl.centerYAnchor.constraint(equalTo: self.bgView.centerYAnchor),
            self.segmentedControl.widthAnchor.constraint(equalToConstant: 459.dp),
            self.segmentedControl.heightAnchor.constraint(equalToConstant: 37.dp)
        )
        self.segmentedControl.defaultTextFont = self.defaultTextFont
        self.segmentedControl.defaultTextColor = self.defaultTextColor
        self.segmentedControl.selectedTextFont = self.selectedTextFont
        self.segmentedControl.selectedTextColor = self.selectedTextColor
        self.segmentedControl.cornerRadius = 9.dp
        self.segmentedControl.itemTitles = [String]()
        self.segmentedControl.attributedDefaultTitles = LoginTabType.allCases.map { (tab) -> NSAttributedString in
            return self.getAttributedString(image: tab.defaultIcon, text: tab.title, isSelected: false)
        }
        self.segmentedControl.attributedSelectedTitles = LoginTabType.allCases.map { (tab) -> NSAttributedString in
            return self.getAttributedString(image: tab.selectedIcon, text: tab.title, isSelected: true)
        }
        self.segmentedControl.containerBackgroundColor = .clear
        self.segmentedControl.hasBounceAnimation = true
        self.segmentedControl.didSelectItemWith = { [weak self] (index, title) -> Void in
            guard let self = self else { return }
            print("\(self) - index: \(index), title: \(String(describing: title))")
        }
        segmentedControl.layoutSubviews()
        segmentedControl.thumbGradientColors = [UIColor.liliacThree, UIColor.easterPurple, UIColor.easterPurpleTwo, UIColor.purpleyTwo]
        segmentedControl.thumbGradientLocations = [0.0, 0.14, 0.19, 1.0]
        //segmentedControl.changeThumbColor(.darkPeriwinkle)
        segmentedControl.changeBackgroundColor(.lightLavenderThree)
        segmentedControl.reconfigure()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.95, green: 0.93, blue: 1.00, alpha: 1.00)
        self.addSubviews()
        self.setupSubviews()
        
        
    }
    func attributedStringForText(_ text: String, isSelected: Bool) -> NSAttributedString {
        let textColor = isSelected ? selectedTextColor : defaultTextColor
        let textFont = isSelected ? selectedTextFont : defaultTextFont
        
        let attributes = [NSAttributedString.Key.foregroundColor : textColor,
                          NSAttributedString.Key.font : textFont]
        let attributedString = NSMutableAttributedString(string: "\u{0020}\(text)", attributes: attributes)
        return attributedString
    }
    
    func getAttributedString(image: UIImage?, text: String, isSelected: Bool) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        if let image = image {
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = image
            imageAttachment.bounds = CGRect(x: 0.dp, y: -3.dp, width: 20.dp, height: 20.dp)
            attributedString.append(NSAttributedString(attachment: imageAttachment))
        }
        
        attributedString.append(self.attributedStringForText(text, isSelected: isSelected))
        return attributedString
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //        segmentedControl.noItemSelected = true
        segmentedControl.hasBounceAnimation = true
        
    }
    @IBAction func buttonAction(_ sender: Any) {
        
        segmentedControl.defaultTextColor = UIColor.red
        segmentedControl.reconfigure()
        
    }
    
}

