
import UIKit
import AVFoundation

class IMAXViewController: UIViewController ,UICollectionViewDataSource{
    @IBOutlet weak var moveCollection: UICollectionView!
    
    var movies = [Movemodel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getallMove()

    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
        
    }
    func getallMove() {
        
        Api.Movie { (error:Error?, result:[Movemodel]?) in
            self.movies = result!
            self.moveCollection.reloadData()
        }
        
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = moveCollection.dequeueReusableCell(withReuseIdentifier: "movieCell" ,for: indexPath) as! Movemodel
        cell.description_Ar = movies[indexPath.row].description_Ar
        cell.description_E = movies[indexPath.row].description_E
        cell.picture = movies[indexPath.row].picture
return cell
    }
    


}
