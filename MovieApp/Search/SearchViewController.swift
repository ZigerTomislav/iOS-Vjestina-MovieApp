//
//  SearchViewController.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 05.04.2022..
//

import Foundation
import UIKit
import SnapKit
import MovieAppData

private let myArray: NSMutableArray = ["C","Objective-C","Swift"]


class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var myTableView = UITableView()
    let tableView = UITableView()
    var moviesNames = ""
    let search = SearchBarView()
    let cellSpacingHeight: CGFloat = -15
    var myArray2 = [MovieModel]()
    let movies = Movies.all()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        search.txtField.becomeFirstResponder()
        view.backgroundColor = .white
        view.addSubview(search)
        
        let titleLabel = UILabel()
        titleLabel.text = "tmdb"

        navigationItem.titleView = titleLabel
        navigationItem.title = "tmdb"
        
        navigationController?.navigationBar.barTintColor = UIColor.blue
        
        
        myTableView.register(SearhTableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
        myTableView.backgroundColor = UIColor.clear

        search.snp.makeConstraints(){
            $0.leading.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().offset(-18)
            $0.top.equalToSuperview().offset(100)
            $0.bottom.equalTo(self.view.snp.top).offset(150)
            
        
        }
        myTableView.snp.makeConstraints(){
            $0.top.equalTo(search.snp.bottom).offset(18)
            $0.bottom.trailing.equalToSuperview().offset(-18)
            $0.leading.equalToSuperview().offset(18)
        }
        search.btnColor.addTarget(self, action: #selector(openSearch), for: .touchUpInside)
        
        search.btnColor2.addTarget(self, action: #selector(tapX), for: .touchUpInside)
        
        search.cancelButton.addTarget(self, action: #selector(tapCancel), for: .touchUpInside)
        
        search.txtField.addTarget(self, action: #selector(ended), for:
            .editingDidEnd)
        
        search.txtField.addTarget(self, action: #selector(begin), for: .editingDidBegin)
        
        
}
    @objc func begin() {
        search.txtField.text = ""
        search.txtField.snp.remakeConstraints(){
            $0.center.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().inset(70)
            $0.top.equalToSuperview()
        }
        search.cancelButton.snp.remakeConstraints(){
            $0.leading.equalTo(search.txtField.snp.trailing)
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        search.cancelButton.isHidden = false
    }
    @objc func openSearch() {
        print(search.txtField.text!)
        let hasTitle = movies
            .filter{$0.title.contains(search.txtField.text!)}
        myArray2 = hasTitle
        self.myTableView.reloadData()
    
    }
    @objc func tapX() {
        search.txtField.text = ""
        
    }
    @objc func ended() {
        search.cancelButton.isHidden = true
        search.txtField.snp.remakeConstraints(){
            $0.center.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().inset(18)
            $0.top.equalToSuperview()
        }
        search.txtField.text = "Search"
        let vc = MovieListViewController()
        self.navigationController?.popViewController( animated: false)
        
    }
    @objc func tapCancel() {
        search.cancelButton.isHidden = true
        print("gotovo")
        search.txtField.snp.remakeConstraints(){
            $0.center.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().inset(18)
            $0.top.equalToSuperview()
        }
        search.txtField.text = "Search"
        search.txtField.isEnabled = false
        search.txtField.isEnabled = true
        
    }
    
        func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 0 // you should probably return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return myArray2.count
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        }

        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return cellSpacingHeight
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearhTableViewCell
            
            cell.backgroundColor = UIColor.clear
            cell.img.image = UIImage(url: URL(string:myArray2 [indexPath.row].imageUrl))
            cell.opis.text  = myArray2[indexPath.row].description
            cell.Naslov.text = myArray2[indexPath.row].title

            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
        {
            return 200
        }
}
