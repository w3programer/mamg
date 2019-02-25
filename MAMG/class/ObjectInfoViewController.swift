//
//  ObjectInfoViewController.swift
//  MAMG
//
//  Created by Sarah Al-Matawah on 09/02/2019.
//  Copyright © 2019 Areej. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ObjectInfoViewController: UIViewController {
    
    //MARK: UI Outlets
    
    @IBOutlet weak var ObjectName: UILabel!
    @IBOutlet weak var ObjectImage: UIImageView!
    @IBOutlet weak var ObjectLink: UIButton!
    @IBOutlet weak var ObjectRate: UILabel! //TODO: Not connecting to Object Rate
    @IBOutlet weak var ObjectDescribtion: UILabel!
    @IBOutlet weak var ObjectVideo: UIButton!
    @IBOutlet weak var Object1Star: UIButton!
    @IBOutlet weak var Object2Star: UIButton!
    @IBOutlet weak var Object3Star: UIButton!
    @IBOutlet weak var Object4Star: UIButton!
    @IBOutlet weak var Object5Star: UIButton! //TODO: Not connecting to Object Rate
    
    
    //MARK: URL PHP link
    
    let DataURL: String = "http://192.168.64.2/dashboard/MyWebServices/api/getAnObject.php" //Link to PHP code in localHost
    
    var videoLink: String = ""
    var decodedURL: String = "3" // Value is send from QR Code
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let int = ["id": decodedURL]; // Recieved value from QRCode
        dataToJson(url: DataURL, id: int)
    }
    
    //MARK: Send POST request
    
    func dataToJson(url: String,id: [String: String]){
        Alamofire.request(url, method: .post, parameters: id).responseData { (response) in
            
            if response.result.isSuccess{
                print("Success! Got the object data")
                
                let ObjectJSON : JSON = JSON(response.data)
                print(ObjectJSON)
                self.dataOfJson(json: ObjectJSON)
            }else{
                print("Error \(String(describing: response.result.error))")
            }
            
        }
        
        
    }
    
    
    //MARK: Get data from request
    
    func dataOfJson(json: JSON){
        
        if isItArabic {
            //Object Arabic Name
            if let name = json["Name_AR"].string {
                ObjectName.text = name
            } else {
                ObjectName.text = ""
            }
            
            if let name = json["Description_AR"].string {
                ObjectDescribtion.text = name
            } else {
                ObjectDescribtion.text = ""
            }
            
            if let name = json["Video_AR"].string {
                videoLink = name;
                
            } else {
                ObjectVideo.isHidden = true
            }
            
        } else {
            //Object English Name
            if let name = json["Name_E"].string {
                ObjectName.text = name
            } else {
                ObjectName.text = ""
            }
            
            if let name = json["Description_E"].string {
                ObjectDescribtion.text = name
            } else {
                ObjectDescribtion.text = ""
            }
            
            if let name = json["Video_E"].string {
                videoLink = name;
                
            } else {
                ObjectVideo.isHidden = true
            }
            
        }
        
        //Display the rate count
        if let rate = json["Rate_Count"].int {
            ObjectRate.text = rate as? String
        }
        
        // Change grey star to gold star depending on rate value
        if let rate = json["Rate"].int {
            if rate == 1 {
                Object1Star.setImage(UIImage(named: "star-1"), for: .normal)
            }
            if rate == 2 {
                Object1Star.setImage(UIImage(named: "star-1"), for: .normal)
                Object2Star.setImage(UIImage(named: "star-1"), for: .normal)
            }
            if rate == 3 {
                Object1Star.setImage(UIImage(named: "star-1"), for: .normal)
                Object2Star.setImage(UIImage(named: "star-1"), for: .normal)
                Object3Star.setImage(UIImage(named: "star-1"), for: .normal)
            }
            if rate == 4 {
                Object1Star.setImage(UIImage(named: "star-1"), for: .normal)
                Object2Star.setImage(UIImage(named: "star-1"), for: .normal)
                Object3Star.setImage(UIImage(named: "star-1"), for: .normal)
                Object4Star.setImage(UIImage(named: "star-1"), for: .normal)
            }
            if rate == 5 {
                Object1Star.setImage(UIImage(named: "star-1"), for: .normal)
                Object2Star.setImage(UIImage(named: "star-1"), for: .normal)
                Object3Star.setImage(UIImage(named: "star-1"), for: .normal)
                Object4Star.setImage(UIImage(named: "star-1"), for: .normal)
                Object5Star.setImage(UIImage(named: "star-1"), for: .normal)
            }
        }
        
        //Download image
        if let image = json["Picture"].string {
            if let url = Foundation.URL(string: image) {
                ObjectImage.contentMode = .scaleAspectFit
                downloadImage(from: url)
            }
        } else {
            //Image default
            //ObjectImage
        }
        
        
        
        //DOTO: Download Link/Resources (AR/E)
        
    }
    
    //MARK: Download image from url
    
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                self.ObjectImage.image = UIImage(data: data)
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    //MARK: Video button clicked
    
    func goToPlayVideoInterface(_ sender: Any) {
        
        if isItArabic {
            //TODO: Open video link
            // videoLink
            
        } else {
            
            
        }
    }
    

    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

