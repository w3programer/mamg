
import UIKit

class TourViewController: UIViewController ,UITableViewDataSource , UITableViewDelegate {


    @IBOutlet weak var tourtable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tourtable.dataSource = self
        tourtable.delegate = self

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
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
