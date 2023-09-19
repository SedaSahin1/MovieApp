//
//  HomePageViewModel.swift
//  movieapp
//
//  Created by Seda Şahin on 17.09.2023.
//

import Foundation
import Alamofire

class HomePageViewModel: ViewModel {
    var movieData: MovieResponse?
}
extension HomePageViewModel {
    func getMovies(text: String) {
        
        let url = URL(string: baseURL)!
        AF.request(url, method: .get, parameters: ["s" : text, "apikey" : "fca2a99e"], encoding: URLEncoding(destination: .queryString) , headers: nil, interceptor: nil)
          .response{ resp in
              switch resp.result{
                case .success(let data):
                  do{
                    let jsonData = try JSONDecoder().decode(MovieResponse.self, from: data!)
                    print(jsonData)
                      self.movieData = jsonData
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
