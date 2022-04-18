//
//  SearchTableViewCell.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 05.04.2022..
//

import Foundation
import UIKit
import SnapKit

//NSAttributedString
public class SearhTableViewCell : UITableViewCell{
    let img = UIImageView()
    let image = UIImage()
    let Naslov = UILabel()
    let opis = UILabel()
    let tekst = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: UITableViewCell.CellStyle.value1, reuseIdentifier: reuseIdentifier)
        setupView()
        }
      //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
      }
    public override func layoutSubviews() {
          super.layoutSubviews()
          //set the values for top,left,bottom,right margins
          let margins = UIEdgeInsets(top: 50, left: 8, bottom: 50, right: 8)
          contentView.frame = contentView.frame.inset(by: margins)
          contentView.layer.cornerRadius = 8
    }
    private func setupView() {
        backgroundColor = .gray
        tekst.addSubview(Naslov)
        tekst.addSubview(opis)
        self.addSubview(tekst)
        self.addSubview(img)
        
        opis.lineBreakMode = .byWordWrapping
        opis.numberOfLines = 0
        opis.textColor = .gray
        
        Naslov.lineBreakMode = .byWordWrapping
        Naslov.numberOfLines = 0
        
        
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 5
        
        self.layer.cornerRadius = 20/2
        
        
        Naslov.snp.makeConstraints(){
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        opis.snp.makeConstraints(){
            $0.leading.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().offset(-18)
            $0.bottom.equalToSuperview()
            $0.top.equalTo(Naslov.snp.bottom).offset(18)
        }
        tekst.snp.makeConstraints(){
            $0.leading.equalTo(img.snp.trailing).offset(18)
            $0.trailing.equalToSuperview().offset(-18)
            $0.top.equalToSuperview().offset(15)
            $0.bottom.equalToSuperview().offset(-15)
        }
        img.snp.makeConstraints(){
            $0.trailing.equalTo(super.snp.leading).offset(120)
            $0.top.leading.equalToSuperview().offset(18)
            $0.bottom.equalToSuperview().inset(18)
        
        }
        
      }
}
