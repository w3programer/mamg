import SwiftyJSON
public class Hallmodel:NSObject {
    public var hall_id : String?
    public var name_E : String?
    public var picture : String?
    public var audio_E : String?
    public var video_E : String?
    public var description_E : String?
    public var name_AR : String?
    public var audio_Ar : String?
    public var video_AR : String?
    public var description_AR : String?
    init?(dic:[String:JSON]) {
        guard let hall_id = dic["hall_id"]?.string ,let name_E = dic["name_E"]?.string ,let description_E = dic["description_E"]?.string , let picture = dic["picture"]?.string,let audio_E = dic["audio_E"]?.string ,let audio_Ar = dic["audio_Ar"]?.string ,
            let name_AR = dic["name_AR"]?.string , let description_AR = dic["description_AR"]?.string , let video_E = dic["video_E"]?.string, let video_AR = dic["video_AR"]?.string
            
            
            else {
                return nil
        }
        self.hall_id = hall_id
        self.name_E = name_E
        self.description_E  = description_E
        self.picture =  picture
        self.audio_E = audio_E
        self.video_AR = video_AR
        self.audio_Ar = audio_Ar
        self.video_E = video_E
        self.name_AR = name_AR
        self.description_AR = description_AR
    }
}

