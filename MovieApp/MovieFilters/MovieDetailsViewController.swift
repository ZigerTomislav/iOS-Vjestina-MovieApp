//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 29.03.2022..
//
import SnapKit
import UIKit

class MovieDetailsViewController: UIViewController {
    var imageView: UIImageView!
    var button: UIButton!
    var labelSummary: UILabel!
    var labelDate: UILabel!
    var labelGenre: UILabel!
    var labelLength: UILabel!
    var labelTitle: UILabel!
    var labelYear: UILabel!
    var labelPercentage: UILabel!
    var labelUserScore: UILabel!
    var labelOverview: UILabel!
    var stackView: UIStackView!
    var stackView1: UIStackView!
    var left: UIView!
    var center: UIView!
    var right: UIView!
    var left1: UIView!
    var center1: UIView!
    var right1: UIView!
    var labelCenterUp: UILabel!
    var labelCenterDown: UILabel!
    var labelLeftUp: UILabel!
    var labelLeftDown: UILabel!
    var labelRightUp: UILabel!
    var labelRightDown: UILabel!
    var labelCenterUp1: UILabel!
    var labelCenterDown1: UILabel!
    var labelLeftUp1: UILabel!
    var labelLeftDown1: UILabel!
    var labelRightUp1: UILabel!
    var labelRightDown1: UILabel!
    var id: Int
    var details: MovieDetailData!
//    let imgHeight = 500
    let buttonSize = CGSize(width: 32, height: 32)
    
    init(id: Int){
        self.id = id
        self.details = MovieDetailData(id : id)
        self.details.pokretac()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        buildViews()
        defineLayout()
        
    }
    func buildViews(){
        let fontSize = 18.0
        imageView = UIImageView()
        if let posterPath = self.details.detail?.poster_path{
            imageView.image = UIImage(url: URL(string:"https://image.tmdb.org/t/p/original" + posterPath))
        }
            
        view.addSubview(imageView)
        
        imageView.contentMode = .scaleAspectFill
        
        button = UIButton(type: .system)
        imageView.addSubview(button)
        
        button.setImage(UIImage(systemName: "star"), for: .normal)
        //button.setIma
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = buttonSize.width/2
        button.clipsToBounds = true

        
        labelGenre = UILabel()
        imageView.addSubview(labelGenre)
        
        labelGenre.textColor = .white
        labelGenre.text = "Action, Crime, Drama"
        
        labelLength = UILabel()
        imageView.addSubview(labelLength)
        
        labelLength.textColor = .white
        labelLength.text = "2h 55m"
        
        labelDate = UILabel()
        imageView.addSubview(labelDate)
        
        labelDate.font = UIFont.systemFont(ofSize: fontSize)
        labelDate.textColor = .white
        labelDate.text = "24/03/1972 (US)"
        
        labelTitle = UILabel()
        imageView.addSubview(labelTitle)
        
        labelTitle.font = UIFont.boldSystemFont(ofSize: fontSize+10)
        labelTitle.textColor = .white
        labelTitle.text = "The Godfather"
        
        labelYear = UILabel()
        imageView.addSubview(labelYear)
        
        labelYear.font = UIFont.systemFont(ofSize: fontSize+10)
        labelYear.textColor = .white
        labelYear.text = "(1972)"
        
        labelPercentage = UILabel()
        imageView.addSubview(labelPercentage)
        
        labelPercentage.font = UIFont.boldSystemFont(ofSize: fontSize+1)
        labelPercentage.textColor = .white
        labelPercentage.text = "93%"
        
        labelUserScore = UILabel()
        imageView.addSubview(labelUserScore)
        
        labelUserScore.font = UIFont.boldSystemFont(ofSize: fontSize)
        labelUserScore.textColor = .white
        labelUserScore.text = "User Score"

//        donji dio
        
        labelOverview = UILabel()
        view.addSubview(labelOverview)
        
        labelOverview.font = UIFont.boldSystemFont(ofSize: fontSize+6)
        labelOverview.text = "Overview"
        
        labelSummary = UILabel()
        view.addSubview(labelSummary)
        
        labelSummary.text = "Michael, the young and idealistic son of Vito Corleone, the head of the most powerful Mafia clan in New York, returns home as a war hero and is determined to live his own life. But tragic circumstances make him face the legacy of his family."
        
        labelSummary.font = UIFont.systemFont(ofSize: fontSize)
        labelSummary.lineBreakMode = .byWordWrapping
        labelSummary.numberOfLines = 0

//        stackvieowi
        
        stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        left = UIView()
        
        labelLeftUp = UILabel()
        labelLeftUp.text = "Characters"
        labelLeftUp.font = UIFont.boldSystemFont(ofSize: fontSize)
        
        labelLeftDown = UILabel()
        labelLeftDown.text = "Al Pacino"
        labelLeftDown.font = UIFont.systemFont(ofSize: fontSize)
        
        left.addSubview(labelLeftUp)
        left.addSubview(labelLeftDown)
        
        
        center = UIView()
        
        labelCenterUp = UILabel()
        labelCenterUp.text = "Characters"
        labelCenterUp.font = UIFont.boldSystemFont(ofSize: fontSize)
        
        labelCenterDown = UILabel()
        labelCenterDown.text = "Marlon Brando"
        labelCenterDown.font = UIFont.systemFont(ofSize: fontSize)
        
        center.addSubview(labelCenterUp)
        center.addSubview(labelCenterDown)
        
        right = UIView()
        
        labelRightUp = UILabel()
        labelRightUp.text = "Director"
        labelRightUp.font = UIFont.boldSystemFont(ofSize: fontSize)
        
        labelRightDown = UILabel()
        labelRightDown.text = "Francis Coppola"
        labelRightDown.font = UIFont.systemFont(ofSize: fontSize)
        
        
        right.addSubview(labelRightUp)
        right.addSubview(labelRightDown)
        
        stackView.addArrangedSubview(left)
        stackView.addArrangedSubview(center)
        stackView.addArrangedSubview(right)
        
        stackView1 = UIStackView()
        stackView1.axis = .horizontal
        stackView1.alignment = .fill
        stackView1.distribution = .fillEqually
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView1)
        
        left1 = UIView()
        
        labelLeftUp1 = UILabel()
        labelLeftUp1.text = "Characters"
        labelLeftUp1.font = UIFont.boldSystemFont(ofSize: fontSize)
        
        labelLeftDown1 = UILabel()
        labelLeftDown1.text = "Al Pacino"
        labelLeftDown1.font = UIFont.systemFont(ofSize: fontSize)
        
        left1.addSubview(labelLeftUp1)
        left1.addSubview(labelLeftDown1)
        
        center1 = UIView()
        
        labelCenterUp1 = UILabel()
        labelCenterUp1.text = "Characters"
        labelCenterUp1.font = UIFont.boldSystemFont(ofSize: fontSize)
        
        labelCenterDown1 = UILabel()
        labelCenterDown1.text = "Marlon Brando"
        labelCenterDown1.font = UIFont.systemFont(ofSize: fontSize)
        
        center1.addSubview(labelCenterUp1)
        center1.addSubview(labelCenterDown1)
        
        right1 = UIView()
        
        labelRightUp1 = UILabel()
        labelRightUp1.text = "Director"
        labelRightUp1.font = UIFont.boldSystemFont(ofSize: fontSize)
        
        labelRightDown1 = UILabel()
        labelRightDown1.text = "Francis Coppola"
        labelRightDown1.font = UIFont.systemFont(ofSize: fontSize)
        
        right1.addSubview(labelRightUp1)
        right1.addSubview(labelRightDown1)
        
        stackView1.addArrangedSubview(left1)
        stackView1.addArrangedSubview(center1)
        stackView1.addArrangedSubview(right1)
        
    }
    func defineLayout(){
        
    //        stackview prvi
        
            stackView.snp.makeConstraints(){
                $0.leading.equalToSuperview().offset(18)
                $0.trailing.equalToSuperview().offset(-18)
                $0.top.equalTo(labelSummary.snp.bottom).offset(20)
            }
        
            labelRightDown.snp.makeConstraints(){
                $0.bottom.leading.trailing.equalToSuperview()
                $0.top.equalTo(labelRightUp.snp.bottom)
            }
        
            labelRightUp.snp.makeConstraints(){
                $0.top.leading.trailing.equalToSuperview()
            }
        
            labelCenterDown.snp.makeConstraints(){
                $0.bottom.leading.trailing.equalToSuperview()
                $0.top.equalTo(labelCenterUp.snp.bottom)
            }
        
            labelCenterUp.snp.makeConstraints(){
                $0.top.leading.trailing.equalToSuperview()
            }
            
            labelLeftDown.snp.makeConstraints(){
                $0.bottom.leading.trailing.equalToSuperview()
                $0.top.equalTo(labelLeftUp.snp.bottom)
            }
            
            labelLeftUp.snp.makeConstraints(){
                $0.top.leading.trailing.equalToSuperview()
            }
            
    //        stackview drugi
        
            stackView1.snp.makeConstraints(){
                $0.leading.equalToSuperview().offset(18)
                $0.trailing.equalToSuperview().offset(-18)
                $0.top.equalTo(stackView.snp.bottom).offset(20)
            }
        
            labelRightDown1.snp.makeConstraints(){
                $0.bottom.leading.trailing.equalToSuperview()
                $0.top.equalTo(labelRightUp1.snp.bottom)
            }
        
            labelRightUp1.snp.makeConstraints(){
                $0.top.leading.trailing.equalToSuperview()
            }
        
            labelCenterDown1.snp.makeConstraints(){
                $0.bottom.leading.trailing.equalToSuperview()
                $0.top.equalTo(labelCenterUp1.snp.bottom)
            }
        
            labelCenterUp1.snp.makeConstraints(){
                $0.top.leading.trailing.equalToSuperview()
            }
        
            labelLeftDown1.snp.makeConstraints(){
                $0.bottom.leading.trailing.equalToSuperview()
                $0.top.equalTo(labelLeftUp1.snp.bottom)
            }
        
            labelLeftUp1.snp.makeConstraints(){
                $0.top.leading.trailing.equalToSuperview()
            }
            
    //        ostalo
        
            imageView.snp.makeConstraints(){
                $0.top.trailing.leading.equalToSuperview()
                $0.bottom.equalTo(view.snp.centerY)
            }
        
            button.snp.makeConstraints(){
                $0.leading.equalToSuperview().offset(18)
                $0.bottom.equalTo(imageView.snp.bottom).offset(-20)
                $0.size.equalTo(buttonSize)
            }
        
            labelGenre.snp.makeConstraints(){
                $0.leading.equalToSuperview().offset(18)
                $0.bottom.equalTo(button.snp.top).offset(-15)
            }
        
            labelLength.snp.makeConstraints(){
                $0.leading.equalTo(labelGenre.snp.trailing).offset(5)
                $0.bottom.equalTo(button.snp.top).offset(-15)
            }
        
            labelDate.snp.makeConstraints(){
                $0.leading.equalToSuperview().offset(18)
                $0.bottom.equalTo(labelGenre.snp.top)
            }
        
            labelTitle.snp.makeConstraints(){
                $0.leading.equalToSuperview().offset(18)
                $0.bottom.equalTo(labelDate.snp.top).offset(-3)
            }
        
            labelYear.snp.makeConstraints(){
                $0.leading.equalTo(labelTitle.snp.trailing)
                $0.trailing.equalToSuperview().offset(-18)
                $0.bottom.equalTo(labelDate.snp.top).offset(-3)
            }
        
            labelPercentage.snp.makeConstraints(){
                $0.leading.equalToSuperview().offset(31)
                $0.bottom.equalTo(labelTitle.snp.top).offset(-20)
            }
        
            labelUserScore.snp.makeConstraints(){
                $0.leading.equalTo(labelPercentage.snp.trailing).offset(15)
                $0.bottom.equalTo(labelTitle.snp.top).offset(-20)
            }
        
            labelOverview.snp.makeConstraints(){
                $0.leading.equalToSuperview().offset(18)
                $0.top.equalTo(imageView.snp.bottom).offset(20)
            }
        
            labelSummary.snp.makeConstraints(){
                $0.leading.equalToSuperview().offset(18)
                $0.trailing.equalToSuperview().offset(-18)
                $0.top.equalTo(labelOverview.snp.bottom).offset(8)
            }
    }
}
