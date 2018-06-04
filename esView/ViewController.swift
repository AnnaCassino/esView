//
//  ViewController.swift
//  esView
//
//  Created by Anna Cassino on 31/05/18.
//  Copyright © 2018 Anna Cassino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let imagesArray = [#imageLiteral(resourceName: "one"),#imageLiteral(resourceName: "two"),#imageLiteral(resourceName: "three")]
    var images = [UIImage]()
    var i = 0
    
//   VARIABILE VIEW
    var mainView : View {return self.view as! View}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images = imagesArray
//        mainView.images = mainView.imagesArray
        mainView.backAction = {[weak self] in
            guard let strongSelf = self else {return}
//            strongSelf.mainView.viewContents.backgroundColor = UIColor.red.withAlphaComponent(0.5)
            if (self?.i)! > 0{
                strongSelf.mainView.viewContents.image = self?.images[(self?.i)!-1]
                self?.i -= 1
                }else{
                    return
                }

        }
        
        mainView.continueAction = {[weak self] in
            guard let strongSelfTwo = self else{return}
            if (self?.i)! < (self?.images.count)!-1{
                strongSelfTwo.mainView.viewContents.image = self?.images[(self?.i)!+1]
                self?.i += 1
            }else{
                let alert=UIAlertController(title: "Immagini terminate", message: "Premere OK", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                alert.addAction(okAction)
                self?.present(alert, animated: true, completion: nil)
            }

            }
    }
    
//    var ChangeImages : UIImage={
//        var img = UIImage()
//
//        return img
//    }()
    
    

    override func loadView() {
        self.view = View(frame: UIScreen.main.bounds)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


