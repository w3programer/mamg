
//[{"Pro_id":"0","U_id":"1","Wishlist_id":"1"}]
import SwiftyJSON
public class wishListModell {
    public var Pro_id : String?
    public var U_id : String?
    public var Wishlist_id : String?
    
    
    init?(dic:[String:JSON]) {
        guard let Wishlist_id = dic["Wishlist_id"]?.string
            else {
                return nil
        }
        self.Wishlist_id = Wishlist_id
        self.U_id = dic["U_id"]?.string
        self.Pro_id  = dic["Pro_id"]?.string
    }
    
}
