//
//  DetailViewModel.swift
//  movieapp
//
//  Created by Seda Şahin on 18.09.2023.
//

import Foundation
import Alamofire

class DetailViewModel: ViewModel {
    var movieTitle: String?
    var movieDetail: DetailResponse?
    init(movieTitle: String) {
        self.movieTitle = movieTitle
        super.init()
    }
}
extension DetailViewModel {
    func getMovieDetail(title: String) {
        let url = URL(string: baseURL)!
        AF.request(url, method: .get, parameters: ["t" : title, "apikey" : "fca2a99e"], encoding: URLEncoding(destination: .queryString) , headers: nil, interceptor: nil)
          .response{ resp in
              switch resp.result{
                case .success(let data):
                  do{
                    let jsonData = try JSONDecoder().decode(DetailResponse.self, from: data!)
                    print(jsonData)
                      self.movieDetail = jsonData
                      self.updateUI?()
                 } catch {
                    print(error.localizedDescription)
                 }
               case .failure(let error):
                 print(error.localizedDescription)
               }
          }
    }
}
