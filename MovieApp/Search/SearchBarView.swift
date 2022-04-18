//
//  SearchBarView.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 05.04.2022..
//

import Foundation
import UIKit
import SnapKit

class SearchBarView: UIView {
    let v1 = UIView()
    let img = UIImageView()
    let txtField = UITextField()
    let xButton = UIButton()
    let cancelButton = UIButton()
    let buttonSize = CGSize(width: 32, height: 32)
    var btnColor = UIButton(type: .custom)
    var btnColor2 = UIButton(type: .custom)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
      }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
      }
    private func setupView() {
        backgroundColor = .white
        let img = UIImageView()
        let magnifyingGlassImage = UIImage(systemName: "magnifyingglass")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        img.image = magnifyingGlassImage
        img.frame = CGRect( x:0,y:0, width:50, height: 40)
        img.contentMode = UIView.ContentMode.center
        
        let img2 = UIImageView()
        let xImage = UIImage(systemName: "xmark")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        img2.image = xImage
        img2.contentMode = .scaleAspectFit
        
        
        
        btnColor.frame = CGRect(x: CGFloat(txtField.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        btnColor.setBackgroundImage(UIImage(systemName: "magnifyingglass")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        
        btnColor2.frame = CGRect(x: CGFloat(txtField.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        btnColor2.setBackgroundImage(UIImage(systemName: "xmark")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        
        
        txtField.rightViewMode = .whileEditing
        txtField.rightView = btnColor2
        
        txtField.leftViewMode = .always
        txtField.backgroundColor = .gray
        txtField.layer.cornerRadius = 10/2
        txtField.clipsToBounds = true
        txtField.leftView = btnColor
        txtField.text = "Search"
        
        self.addSubview(txtField)
        txtField.frame.size.width = 300
        
        txtField.snp.makeConstraints(){
            $0.center.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().inset(18)
            $0.top.equalToSuperview()
        }
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.black, for: .normal)
        self.addSubview(cancelButton)
        cancelButton.isHidden = true
        
        cancelButton.snp.makeConstraints(){
            $0.leading.equalTo(txtField.snp.trailing)
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        txtField.addTarget(self, action: #selector(begin), for: .editingDidBegin)
        
        
    }
    @objc func begin() {
        txtField.text = ""
        txtField.snp.remakeConstraints(){
            $0.center.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().inset(70)
            $0.top.equalToSuperview()
        }
        cancelButton.snp.remakeConstraints(){
            $0.leading.equalTo(txtField.snp.trailing)
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        cancelButton.isHidden = false
        
    }
    @objc func openSearch() {
        print("searchajSearchaj")
        txtField.isEnabled = false
        txtField.isEnabled = true
        
    }
    @objc func tapX() {
        txtField.text = ""
        
    }
    
}
