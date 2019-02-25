import SwiftyJSON
public class eventModell {
    public var event_id : String?
    public var name : String?
    public var start_date : String?
    public var end_date : String?
    public var picture : String?
    init?(dic:[String:JSON]) {
        guard let name = dic["name"]?.string
            else {
                return nil
        }
        self.name = name
        self.start_date = dic["start_date"]?.string
        self.end_date  = dic["end_date"]?.string
    }

}
