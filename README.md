# CollectionViewWithPrefetch
Apple enhanced CollectionView in iOS10 with following features
* Enhanced performance of CollectionView by prefetching data to cell. Especially, during scrolling data like 
displaying images on leads effect on perfomance of CollectionView. This leads to slow data load in CollectionView cell.
This one overcame by CollectionView Prefetching by using this protocol "PrefetchdataSource" and its delegate methods
  
  func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]){ }
  func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]){ }
