//
//  ViewController.swift
//  ColllectioViewDemo
//
//  Created by Viresh Madabhavi on 05/10/16.
//  Copyright © 2016 Viresh Madabhavi. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSourcePrefetching {
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var cellLabel: UILabel!
    var dataArray : [String] = []
    var receivedData : [String] = []
    
    let collectionCellId = "collection_cell_id"

    override func viewDidLoad() {
        super.viewDidLoad()
        receivedData = ["A","B","C","D","E","F","G","H","I","J","K"]
        
        let nib = UINib(nibName: "CollectionCellCollectionViewCell", bundle:nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: collectionCellId)

        self.dataArray = receivedData
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  self.dataArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAtIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell :CollectionCellCollectionViewCell  = self.collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellId, for: indexPath) as! CollectionCellCollectionViewCell
        collectionViewCell.dynamicLabel.text = self.dataArray[indexPath.row]
        collectionViewCell.backgroundColor = UIColor.lightGray
        return collectionViewCell
        
    }
     
    
    func numberOfSectionsInCollectionView(_ collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // indexPaths are ordered ascending by geometric distance from the collection view

    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]){
        
        for indexPath in indexPaths {
            /*
                Updating upcoming CollectionView's data source. Not assiging any direct value
            */
 
            let tempObj = self.receivedData[indexPath.row] as String
            self.dataArray[indexPath.row] = tempObj as String
            print("Updating upcoming CollectionView's data source 'prefetchItemsAt' called \(self.dataArray[indexPath.row])")
        }
    }
    
    // indexPaths that previously were considered as candidates for pre-fetching, but were not actually used; may be a subset of the previous call to -collectionView:prefetchItemsAtIndexPaths:
    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]){
        print("Cancel Prefetching Items At index which are not displayed on screen")
        
        for indexPath in indexPaths {
            self.dataArray.remove(at: indexPath.row)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

