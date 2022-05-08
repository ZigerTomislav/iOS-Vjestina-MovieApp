//
//  FilterTableViewCell.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 05.04.2022..
//

import Foundation
import SnapKit
import MovieAppData
import UIKit
public class FilterTableViewCell : UITableViewCell{
    let label = UILabel()
    var stackView = UIStackView()
    var scrollView = UIScrollView()
    var grupa: String = ""
    var movies = [moviePopular]()
    var myCollectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    var myArray = [MovieModel]()
    var rezultati = [moviePopular]()
    weak var navigationController: UINavigationController?
    var filterici = [genre]()
    let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    var trenutni = ""
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: UITableViewCell.CellStyle.value1, reuseIdentifier: reuseIdentifier)
        setupView()
        }
      //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
      }
    
        
    private func setupView() {
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 30

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 130, height: 180)
       
        myCollectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "customReuseIdentifier")
        layout.scrollDirection = .horizontal
        
        self.addSubview(myCollectionView )
               
        backgroundColor = .gray
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.text = "default"
        self.addSubview(label)
        scrollView.addSubview(stackView)
        
        self.addSubview(scrollView)

        label.snp.makeConstraints(){
            $0.top.equalToSuperview()
            $0.bottom.equalTo(self.snp.top).offset(30)
            $0.leading.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().inset(18)
        
        }
        stackView.snp.makeConstraints(){
            $0.top.bottom.trailing.leading.equalToSuperview()
            $0.bottom.equalToSuperview().inset(5)
            
        }
        scrollView.snp.makeConstraints(){
            $0.top.equalTo(label.snp.bottom).offset(5)
            $0.height.equalTo(40)
            $0.leading.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().inset(18)
        
        }
        myCollectionView.snp.makeConstraints(){
            $0.top.equalTo(scrollView.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().inset(18)
            $0.bottom.equalToSuperview()
        }
        
      }
}

