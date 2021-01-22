//
//  FavoritosCollectionViewCell.swift
//  Favoritos
//
//  Created by Phillippi Areias Aguiar on 1/21/21.
//

import UIKit

class FavoritosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageCoin: UIImageView!
    
    @IBOutlet weak var labelNome: UILabel!
    
    @IBOutlet weak var labelSigla: UILabel!
    
    @IBOutlet weak var labelValor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
