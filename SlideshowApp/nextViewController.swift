//
//  nextViewController.swift
//  SlideshowApp
//
//  Created by 加藤桃香 on 2020/11/21.
//  Copyright © 2020 momoka.kato. All rights reserved.
//

import UIKit

class nextViewController: UIViewController {
    @IBOutlet weak var nextImageView: UIImageView!
    var imageView: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextImageView.image = imageView
        

        // Do any additional setup after loading the view.
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
