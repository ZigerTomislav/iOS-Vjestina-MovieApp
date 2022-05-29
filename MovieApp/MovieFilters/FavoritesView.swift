//
//  FavoritesView.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 29.05.2022..
//

import Foundation

import UIKit

class FavoritesView: UIView {
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
        let label = UILabel()
        label.text = "Favorites"
        
        self.addSubview(label)
        
        
    }
}
