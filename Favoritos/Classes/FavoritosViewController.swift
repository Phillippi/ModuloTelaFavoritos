//
//  FavoritosViewController.swift
//  Pods-Favoritos_Example
//
//  Created by Phillippi Areias Aguiar on 1/22/21.
//

import UIKit
import SnapKit
import TelaDeDetalhes

public class FavoritosViewController: UIViewController {
    
   // let viewModel: FavoritosViewModel = FavoritosViewModel()

    //MARK: - Criando a tela
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .light)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Criptonita"
        return label
    }()
    private lazy var labelDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "22 jan 2021"
        return label
    }()
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private lazy var favoritosView: UIView = {
        let favoritosView = UIView()
        favoritosView.backgroundColor = .black
        return favoritosView
    }()
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .black
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CellCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    //MARK: - LifeCycle Method

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupViewConfiguration()
    }
}

    //MARK: - ViewConfiguration

extension FavoritosViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(containerView)
        containerView.addSubview(labelTitle)
        containerView.addSubview(labelDate)
        view.addSubview(lineView)
        view.addSubview(favoritosView)
        favoritosView.addSubview(collectionView)
    }
    
    func setupConstraints() {
        
        containerView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            } else {
                make.top.equalTo(view)
            }
            make.left.equalTo(view.snp.left).offset(0)
            make.right.equalTo(view.snp.right).inset(0)
            make.height.equalTo(135)
        }
        labelTitle.snp.makeConstraints { (make) in
            make.top.equalTo(containerView.snp.top).offset(50)
            make.left.equalTo(containerView).offset(0)
            make.right.equalTo(containerView).inset(0)
        }
        labelDate.snp.makeConstraints { (make) in
            make.top.equalTo(labelTitle.snp.bottom).offset(10)
            make.left.equalTo(containerView).offset(0)
            make.right.equalTo(containerView).inset(0)
        }
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(containerView.snp.bottom).offset(0)
            make.left.equalTo(view.snp.left).offset(0)
            make.right.equalTo(view.snp.right).inset(0)
            make.height.equalTo(1)
        }
        favoritosView.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom).offset(10)
            make.left.equalTo(view.snp.left).offset(0)
            make.right.equalTo(view.snp.right).inset(0)
            make.bottom.equalTo(view).inset(0)
        }
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(favoritosView.snp.top).offset(20)
            make.left.equalTo(favoritosView.snp.left).offset(10)
            make.right.equalTo(favoritosView.snp.right).offset(-10)
            make.bottom.equalTo(favoritosView).inset(10)
        }
    }
    
    func configureViews() {
        view.backgroundColor = .clear
    }
}
    //MARK: - Configuração CollectionView

extension FavoritosViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2-10, height: 130) : CGSize(width: collectionView.bounds.width/3-20, height: 250)
     }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 26
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellCollectionViewCell
        cell.layer.cornerRadius = 15
        cell.backgroundColor = UIColor(red: 139/255, green: 153/255, blue: 90/255, alpha: 1)
        return cell
    }
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let nc = self.navigationController else {return}
        let vcDetails = Detalhes(navigationController: nc)
        vcDetails.abreDetalhes(initials: "BTC", currentValueOFCoin: "31,010.20", isFavorite: false, hourSell: "310,010.20", monthSell: "1,310.010.20", yearSell: "100,310.010.20")
        
    }
}
