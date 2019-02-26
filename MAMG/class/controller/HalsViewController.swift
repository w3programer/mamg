//
//  HalsViewController.swift
//  MAMG
//
//  Created by mashael on 2/13/19.
//  Copyright © 2019 Areej. All rights reserved.
//

import UIKit

class HalsViewController: UIViewController , UICollectionViewDataSource,UICollectionViewDelegate {
var hallsarray = [Hallmodel]()
    @IBOutlet weak var hallscollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        hallscollection.dataSource =  self
        hallscollection.delegate =  self
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        hallsarray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UITraitCollection.dequeueReusableCell(withReuseIdentifier: "wishlistCollectionViewCell" ,for: indexPath) as! wishlistCollectionViewCell
        cell.image = hallsarray[indexPath.row].picture
        return cell
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
