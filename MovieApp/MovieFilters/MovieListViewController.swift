//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 05.04.2022..
//

import Foundation
import UIKit
import SnapKit
import MovieAppData

class MovieListViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    let search = SearchBarView()
    let myTableView = UITableView()
    var myArray = [MovieModel]()
    var myArray2 = [[MovieModel]]()
    let movies = Movies.all()
    var groupSet = Set<MovieGroup>()
    var grupe = [String]()
    var groupArray = Array<MovieGroup>()
    var filteri = [[MovieFilter]]()
    let pocetno = true
    var movieData1 = MovieData()
   public var popular = [moviePopular]()
//    var popular = [moviePopular]()
    var trendingDay = [moviePopular]()
    var trendingWeek = [moviePopular]()
    var topRated = [moviePopular]()
    var recommended = [moviePopular]()
    let net = NetworkService()
    
    
    
    var g = [genre]()
    var titles = ["Whats Popular", "Trending", "Recommended", "TopRated"]
    var time = ["week","day"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieData1.sve = [movieData1.popular,movieData1.recommended,movieData1.topRated,movieData1.trendingWeek]
        movieData1.tab = myTableView
        view.backgroundColor = .white
        view.addSubview(search)
        
        let titleLabel = UILabel()
        titleLabel.text = "tmdb"

        navigationItem.titleView = titleLabel
        navigationItem.title = "tmdb"
        
        navigationController?.navigationBar.barTintColor = UIColor.blue
        
        myTableView.register(FilterTableViewCell.self, forCellReuseIdentifier: "cell")
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
        
        let vc = SearchViewController()
        self.navigationController?.pushViewController(vc, animated: false)
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FilterTableViewCell
        
        cell.backgroundColor = UIColor.clear
        cell.label.text = String(describing: movieData1.titles[indexPath.row])
            cell.rezultati = movieData1.sve[indexPath.row]
             cell.navigationController = navigationController
        for i in movieData1.g{
                    let pom = buttonStackView()
                    pom.parent = cell.stackView
                    pom.parentKolekcija = cell
                    pom.setTitle(String(describing: i.name), for: .normal)
                    cell.stackView.addArrangedSubview(pom)
                    }
//            }
            cell.filterici = movieData1.g
    return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 300
    }
  
}
