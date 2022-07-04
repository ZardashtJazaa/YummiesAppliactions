//
//  NetworkService.swift
//  FoodDelivery
//
//  Created by Zardasht  on 25/06/2022.
//

import Foundation

struct NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}  // making init private to make sure you can not make instance of this functions  outside this place
    
   
    func fetchAllCategories(completions: @escaping(Result<AllDishes,Error>) -> Void) {
        
        Request(route: .fetchAllDishes, method: .get, completion: completions)
        
    }
    
    //MARK: FetchALlOrders
    
    func fetchOrders(completion: @escaping(Result<[Orders] , Error>) -> Void) {
        
        Request(route: .fetchAllOrders, method: .get, completion: completion)
        
    }
    
    //MARK: RequestForDishList
    
     func categoryDishList(categoryID:String , completion: @escaping(Result<[PopulateDish] , Error>) -> Void){
        
         Request(route: .categoryDishList(categoryID), method: .get, completion: completion)
         
    }
    
    //MARK: PlacingOrder
    
     func placingOrder(dishID:String, name:String, completion: @escaping(Result<Orders,Error>) -> Void) {
        
        let perams = [
            "name": name
        ]
        
        Request(route: .placeOrder(dishID), method: .post, perameter: perams, completion: completion)
    }
        
   
    //command + options + /
 
    //MARK: CreateRequest
    
    /// This  functiopns help us to generate an URL Request
    /// - Parameters:
    ///   - route: path the Resoueces in the backend
    ///   - method: type of request to be made
    ///   - perameters: what ever extra informations you need to pass to backend
    /// - Returns: URLRequest
    
   
    private  func createReques(route:Route , method:Methods , perameters:[String:Any]? = nil) -> URLRequest? {
        
        let urlString =  Route.baseUrl + route.descriptions
        guard let url = urlString.asUrl else {return nil}
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue // depend on the functions which method is use
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let perams = perameters{
            switch method {
            case .get:
                
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = perams.map {
                    URLQueryItem(name: $0, value: "\($1)")
                }
                request.url = urlComponent?.url  // we are updating the url with this new url..
                
            case .post , .patch , .delete:
                
                let bodyData = try? JSONSerialization.data(withJSONObject: perams, options: [])
                request.httpBody = bodyData
            
            }
        }
        
        return request
    }
    
    
    //MARK: Request to API
    
    private func Request<T:Codable>(route:Route ,
                                    method:Methods ,
                                    perameter:[String:Any]? = nil ,
                                    completion: @escaping(Result<T,Error>) ->  Void ){
        
    guard let request = createReques(route: route, method: method, perameters: perameter) else {
     
        completion(.failure(AppError.Unknow))
        return
    }
        
        URLSession.shared.dataTask(with: request) { data , response , error in
            
            var result: Result<Data , Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "Could not convert data to String!"
               //print("The response is:\n \(responseString)")
                
            }else if let error = error {
                
                result = .failure(error)
                print("The error is : \(error.localizedDescription) ")
            }
            
            DispatchQueue.main.async {
                // Decode our Result to send back to the user..
                self.handleRequest(result: result, completion: completion)
            }
        
        
        }.resume()
     
    }
    
    
    //MARK: handleRequest &  Decoding
    private func handleRequest<T:Codable>(result: Result<Data , Error>? ,
                                          completion: (Result<T, Error>) -> Void ) {
        
        
        guard let result =  result else {
            completion(.failure(AppError.Unknow))
            return
        }
        
        switch result {
            
        case .success(let data):
            let decoder =  JSONDecoder()
            guard let response = try? decoder.decode(APIResponse<T>.self, from: data) else {
                completion(.failure(AppError.errorDecoding))
                return
            }
            if let error = response.error {
                completion(.failure(AppError.serverError(error)))
                return
            }
            
            if let decodedData =  response.data {
                completion(.success(decodedData))
            }else{
                completion(.failure(AppError.NoData))
            }
            
            
        case .failure(let error):
            completion(.failure(error))
        }
        
        
    }
       
}
