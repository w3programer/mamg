import SwiftyJSON
public class giftModell {
    public var id : Int?
    public var gift_name : String?
    init?(dic:[String:JSON]) {
        guard let gift_name = dic["gift_name"]?.string
            else {
                return nil
        }
        self.gift_name = gift_name
    }
    
}
