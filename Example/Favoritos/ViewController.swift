//
//  ViewController.swift
//  Favoritos
//
//  Created by areias_2@hotmail.com on 01/21/2021.
//  Copyright (c) 2021 areias_2@hotmail.com. All rights reserved.
//

import UIKit
import Favoritos

class ViewController: UIViewController {

    
    @IBAction func buttonPush(_ sender: UIButton) {
        let controller: UIViewController = FavoritosViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


