//
//  Extensions.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 18.04.2022..
//

import Foundation
import UIKit
import SnapKit
import MovieAppData
extension FilterTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myArray.count
        }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customReuseIdentifier", for: indexPath) as! MovieCollectionViewCell
            cell.img.image = UIImage(url: URL(string:myArray [indexPath.row].imageUrl))
        return cell
        }
    func collectionView(_ collectionView: UICollectionView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 400
    }
}
extension UIStackView {
    
    func kontrola( ime: String) {
        for case let button as UIButton in self.arrangedSubviews {
            print(button.title(for: .normal)!)
            if(button.title(for: .normal)! == ime){
                button.setTitleColor(.black, for: .normal)
                button.underlineText()
            }
            else
            {
                button.makniUnderlineText()
                button.setTitleColor(.gray, for: .normal)
            }
        }
  }
}

extension UITableViewCell {
    open override func addSubview(_ view: UIView) {
        super.addSubview(view)
        sendSubviewToBack(contentView)
    }
}
extension UIImage {
  convenience init?(url: URL?) {
    guard let url = url else { return nil }
            
    do {
      self.init(data: try Data(contentsOf: url))
    } catch {
      print("Cannot load image from url: \(url) with error: \(error)")
      return nil
    }
  }
}
