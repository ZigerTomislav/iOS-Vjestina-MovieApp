//
//  MovieCollectionViewCell.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 05.04.2022..
//

import Foundation
import UIKit
import SnapKit

class MovieCollectionViewCell : UICollectionViewCell{
    let img = UIImageView()
    let buttonH = UIButton()
    var id = Int()
    weak var navigationController: UINavigationController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
      }
      
      //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
      }
      
      //common func to init our view
    private func setupView() {
        backgroundColor = .white
        let heartImg = UIImage(systemName: "heart")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        buttonH.setImage(heartImg, for: .normal )
        buttonH.backgroundColor = .gray
        
        img.layer.cornerRadius = 20/2
        img.clipsToBounds = true
        buttonH.frame.size = CGSize(width: 100.0, height: 100.0)
        buttonH.layer.cornerRadius = 20/2
        
        img.addSubview(buttonH)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        img.isUserInteractionEnabled = true
        img.addGestureRecognizer(tapGestureRecognizer)
        
        self.addSubview(img)
        buttonH.snp.makeConstraints(){
            $0.leading.equalToSuperview().offset(15)
            $0.top.equalToSuperview().offset(15)
        }
        img.snp.makeConstraints(){
            $0.leading.trailing.bottom.top.equalToSuperview()
            
        }
        
      }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        let vc1 = MovieDetailsViewController(id: self.id)
        self.navigationController?.pushViewController(vc1, animated: true)
        print("radi")
    }
}

