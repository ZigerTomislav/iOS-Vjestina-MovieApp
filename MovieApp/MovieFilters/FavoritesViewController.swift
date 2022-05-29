//
//  FavoritesViewController.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 05.04.2022..
//

import Foundation
import UIKit
import SnapKit

class FavoritesViewController: UIViewController {
    var mov = MoviesRepository()
    var myTableView = UITableView()
    let tableView = UITableView()
    var moviesNames = ""
    let search = SearchBarView()
    let cellSpacingHeight: CGFloat = -15
    let fav = FavoritesView()
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global(qos: .userInitiated).async {
            self.mov.saveMovies()
            
            
        }
        lazy var movies: [movieStored] = {
            let studentsModel = mov.fetchMovies()
        return studentsModel.map { movieStored(fromModel: $0) }
        }()
        self.view.addSubview(fav)
        
        fav.snp.makeConstraints(){
            $0.center.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        
    }
}
    
    

