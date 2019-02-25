

import UIKit

class GiftshopeViewController: UIViewController ,UICollectionViewDataSource{

  var giftarray = [giftModell]()

    @IBOutlet weak var giftcollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return giftarray.count
        
    }
    
    func getallgifts() {
        
        Api.gifts { (error:Error?, result:[giftModell]?) in
            self.giftarray = result!
            self.giftcollection.reloadData()
        }
        
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = moveCollection.dequeueReusableCell(withReuseIdentifier: "giftcell" ,for: indexPath) as! giftCollectionViewCell
        cell.title = movies[indexPath.row].gift_name
        
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
