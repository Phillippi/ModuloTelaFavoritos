//
//  FavoritosViewController.swift
//  Favoritos
//
//  Created by Phillippi Areias Aguiar on 1/21/21.
//

import UIKit

public class FavoritosViewController: UIViewController{
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var favoritosCollection: UICollectionView!
    
    let favoritosCell = "favoritos"
    var products = [ProductDto]()

    public override func viewDidLoad() {
        super.viewDidLoad()
        let nibCell = UINib(nibName: favoritosCell, bundle: nil)
        favoritosCollection.register(nibCell, forCellWithReuseIdentifier: favoritosCell)
        
        for _ in 1...25 {
            let product = ProductDto()
            product?.name = "teste"
            product?.desc = "testando"
            products.append(product!)
        }
        favoritosCollection.reloadData()
    }
}

extension FavoritosViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = favoritosCollection.dequeueReusableCell(withReuseIdentifier: favoritosCell, for: indexPath) as! FavoritosCollectionViewCell
        let product = products[indexPath.row]
        cell.labelNome.text = product.name
        cell.labelSigla.text = product.desc
        cell.labelValor.text = String(product.id!)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 10
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
}
