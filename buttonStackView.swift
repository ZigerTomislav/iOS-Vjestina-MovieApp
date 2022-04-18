//
//  buttonStackView.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 18.04.2022..
//

import Foundation
import UIKit

class buttonStackView : UIButton{
    var parent = UIStackView()
    var parentKolekcija = FilterTableViewCell()
    var bottomLine = CALayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
      }
      
      //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    func setupView(){
        
    self.addTarget(self, action: #selector(naKlik), for: .touchUpInside)
        self.setTitleColor(.gray, for: .normal)
    }
    @objc func naKlik( _ sender: AnyObject!) {
            var pom = self.superview as! UIStackView
            parent.kontrola(ime: self.title(for: .normal)!)
            parentKolekcija.trenutni = self.title(for: .normal)!
        }
    
    

}
extension UIButton {
    func underlineText() {
        guard let title = title(for: .normal) else { return }

        let titleString = NSMutableAttributedString(string: title)
        titleString.addAttribute(
          .underlineStyle,
          value: NSUnderlineStyle.single.rawValue,
          range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(titleString, for: .normal)
      }
    func makniUnderlineText() {
        
        guard let title = title(for: .normal) else { return }
        let titleString2 = NSMutableAttributedString(string: title)
       
        setAttributedTitle(titleString2, for: .normal)
    }
}

