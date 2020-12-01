//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 加藤桃香 on 2020/11/21.
//  Copyright © 2020 momoka.kato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
    
    
    var nowIndex: Int = 0
    var timer: Timer!
    var imageArray: [UIImage] = [
        UIImage(named: "image/sister01.jpg")!,
        UIImage(named: "image/sister02.jpg")!,
        UIImage(named: "image/sister03.jpg")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageArray[0]
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func slideShowButton(_ sender: Any) {
        if ( self.timer == nil ) {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateImage(_:)), userInfo: self, repeats: true)
            nextButton.isEnabled = false
            returnButton.isEnabled = false
            startButton.setTitle("停止", for: .normal)
            
        } else {
            self.timer.invalidate()
            self.timer = nil
            nextButton.isEnabled = true
            returnButton.isEnabled = true
            startButton.setTitle("再生", for: .normal)
        }
        
       
    }
    
    @objc func updateImage(_ timer: Timer){
        nowIndex += 1
        
        if nowIndex == imageArray.count {
            nowIndex = 0

        }
        
        imageView.image = imageArray[nowIndex]
        print(imageArray)
        }
    
    
    
    @IBAction func nextButton(_ sender: Any) {
        nowIndex += 1
        
        if nowIndex == imageArray.count {
            nowIndex = 0
            print(imageArray)
        }
        imageView.image = imageArray[nowIndex]
    }
    
    
    @IBAction func returnButton(_ sender: Any) {
        
        if nowIndex == 0 {
            nowIndex = 2
        } else {
            nowIndex -= 1
        }
        imageView.image = imageArray[nowIndex]
        
    }
    
    @IBAction func tapAction(_ sender: Any) {
        performSegue(withIdentifier: "result", sender: nil)
        if (self.timer != nil) {
            self.timer.invalidate()
            self.timer = nil
            nextButton.isEnabled = true
            returnButton.isEnabled = true
            startButton.setTitle("再生", for: .normal)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewController:nextViewController = segue.destination as! nextViewController
        nextViewController.imageView = self.imageView.image
        
    }
    
    
}

