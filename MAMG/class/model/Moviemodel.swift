import SwiftyJSON
public class Movemodel:NSObject {
    public var moive_id : String?
    public var name_E : String?
    public var description_E : String?
    public var picture : String?
    public var trailer : String?
    public var name_AR : String?
    public var description_Ar : String?
    init?(dic:[String:JSON]) {
        guard let moive_id = dic["moive_id"]?.string ,let name_E = dic["name_E"]?.string ,let description_E = dic["description_E"]?.string , let picture = dic["picture"]?.string,let trailer = dic["trailer"]?.string ,
        
        let name_AR = dic["name_AR"]?.string , let description_Ar = dic["description_Ar"]?.string
        
        else {
            return nil
        }
        self.moive_id = moive_id
        self.name_E = name_E
       self.description_E  = description_E
        self.picture =  picture
        self.trailer = trailer
        self.name_AR = name_AR
        self.description_Ar = description_Ar
    }
}
 
