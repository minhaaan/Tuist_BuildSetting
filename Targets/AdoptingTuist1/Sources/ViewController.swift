//
//  ViewController.swift
//  Adopting_Tuist
//
//  Created by 최민한 on 2022/05/01.
//

import UIKit

#if SIMUL
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .black
    }
}
#else
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .red
    }
}
#endif
