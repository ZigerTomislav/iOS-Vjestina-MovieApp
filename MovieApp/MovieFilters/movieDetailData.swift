//
//  movieDetailData.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 08.05.2022..
//

import Foundation

class MovieDetailData {
    var detail: movieDetailed?
    let net = NetworkService()
    
    var id: Int
    init(id : Int){
        self.id = id
        self.pokretac()
        
    }
    func getAll()async{
        let  task = Task{ () -> movieDetailed in
            let url = "https://api.themoviedb.org/3/movie/"+String(self.id)+"?language=en-US&page=1&api_key=0f65fdc10957a26750e4d313e4994d7e"
            print("url")
            print(url)
            let request = net.pomRequest(url)
            print("neke")
            
            let moviesic: movieDetailed = try await net.executeUrlRequest(request)
            print("uspj")
            print(moviesic)
            return moviesic
                                                                                      
        }
        let resultD = await task.result
        
        do {
            self.detail = try resultD.get()
            
        }
        catch{
            print(error)
        }
        
    }
    func pokretac(){
        Task{
            await getAll()
        }
    }
}

