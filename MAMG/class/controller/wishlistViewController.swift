//
//  wishlistViewController.swift
//  MAMG
//
//  Created by mashael on 2/13/19.
//  Copyright © 2019 Areej. All rights reserved.
//

import UIKit

class wishlistViewController: UIViewController ,UICollectionViewDataSource,UICollectionViewDelegate {
  var wishlistarray = [wishListModell]()
    

    @IBOutlet weak var wishlistCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return wishlistarray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = wishlistCollection.dequeueReusableCell(withReuseIdentifier: "wishlistCollectionViewCell" ,for: indexPath) as! wishlistCollectionViewCell
        cell.image = wishlistarray[indexPath.row].U_id
        cell.wishtitle = wishlistarray[indexPath.row].Wishlist_id
        return cell
        
    }
}
