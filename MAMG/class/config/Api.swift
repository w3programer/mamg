
import UIKit
import Alamofire
import SwiftyJSON
class Api: NSObject {
    class var isconnectedtotheinternet:Bool{
        return NetworkReachabilityManager()!.isReachable
    }
    ///////caterios
    class func Movie(completion:@escaping(_ error :Error? ,_ data:[Movemodel]?)->Void){
        let BaseUrl = config.Movies
        Alamofire.request(BaseUrl)
            .validate(statusCode:200..<300)
            .responseJSON { response in
                switch response.result
                {
                case .failure( let error):
                    print(error)
                    completion(error , nil)
                case .success(let value):
                    let json = JSON(value)
                    // print(json)
                    let datobj = json
                    
                    guard let dataArr = datobj["data"].array else{
                        completion(nil , nil)
                        return
                    }
                    var results = [Movemodel]()
                    for data in dataArr {
                        
                        if let data = data.dictionary ,let info = Movemodel.init(dic: data) {
                            results.append(info)
                        }
                    }
                    completion(nil,results)
                }
                
        }
        
    }

    
    class func event(completion:@escaping(_ error :Error? ,_ data:[eventModell]?)->Void){
        let BaseUrl = config.Event
        Alamofire.request(BaseUrl)
            .validate(statusCode:200..<300)
            .responseJSON { response in
                switch response.result
                {
                case .failure( let error):
                    print(error)
                    completion(error , nil)
                case .success(let value):
                    let json = JSON(value)
                    // print(json)
                    let datobj = json
                    
                    guard let dataArr = datobj["data"].array else{
                        completion(nil , nil)
                        return
                    }
                    var results = [eventModell]()
                    for data in dataArr {
                        
                        if let data = data.dictionary ,let info = eventModell.init(dic: data) {
                            results.append(info)
                        }
                    }
                    completion(nil,results)
                }
                
        }
        
    }
////////halls
    
    class func halls(completion:@escaping(_ error :Error? ,_ data:[Hallmodel]?)->Void){
        let BaseUrl = config.Hall
        Alamofire.request(BaseUrl)
            .validate(statusCode:200..<300)
            .responseJSON { response in
                switch response.result
                {
                case .failure( let error):
                    print(error)
                    completion(error , nil)
                case .success(let value):
                    let json = JSON(value)
                    // print(json)
                    let datobj = json
                    
                    guard let dataArr = datobj["data"].array else{
                        completion(nil , nil)
                        return
                    }
                    var results = [Hallmodel]()
                    for data in dataArr {
                        
                        if let data = data.dictionary ,let info = Hallmodel.init(dic: data) {
                            results.append(info)
                        }
                    }
                    completion(nil,results)
                }
                
        }
        
    }

    class func wishlist(completion:@escaping(_ error :Error? ,_ data:[wishListModell]?)->Void){
        let BaseUrl = config.Wishlist
        Alamofire.request(BaseUrl)
            .validate(statusCode:200..<300)
            .responseJSON { response in
                switch response.result
                {
                case .failure( let error):
                    print(error)
                    completion(error , nil)
                case .success(let value):
                    let json = JSON(value)
                    // print(json)
                    let datobj = json
                    
                    guard let dataArr = datobj["data"].array else{
                        completion(nil , nil)
                        return
                    }
                    var results = [wishListModell]()
                    for data in dataArr {
                        
                        if let data = data.dictionary ,let info = wishListModell.init(dic: data) {
                            results.append(info)
                        }
                    }
                    completion(nil,results)
                }
                
        }
        
    }

   ///////////////////gifts
    class func gifts(completion:@escaping(_ error :Error? ,_ data:[giftModell]?)->Void){
        let BaseUrl = config.gifts
        Alamofire.request(BaseUrl)
            .validate(statusCode:200..<300)
            .responseJSON { response in
                switch response.result
                {
                case .failure( let error):
                    print(error)
                    completion(error , nil)
                case .success(let value):
                    let json = JSON(value)
                    // print(json)
                    let datobj = json
                    
                    guard let dataArr = datobj["data"].array else{
                        completion(nil , nil)
                        return
                    }
                    var results = [giftModell]()
                    for data in dataArr {
                        
                        if let data = data.dictionary ,let info = giftModell.init(dic: data) {
                            results.append(info)
                        }
                    }
                    completion(nil,results)
                }
                
        }
        
    }
    
}
