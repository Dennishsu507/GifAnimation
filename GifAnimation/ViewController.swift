//
//  ViewController.swift
//  GifAnimation
//
//  Created by HSU, Hong-Wei on 2020/3/18.
//  Copyright © 2020 HSU, Hong-Wei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let starEmitterLayer = CAEmitterLayer()
    let starEmitterCell = CAEmitterCell()
    func createEmitter(){
        starEmitterLayer.emitterPosition = CGPoint(x:100,y:120)
        starEmitterLayer.emitterSize = CGSize(width:0,height:0)
       
        let star = makeCell()
        starEmitterLayer.emitterCells = [star]
        
        view.layer.addSublayer(starEmitterLayer)
    }
    
    func makeCell()->CAEmitterCell {
        starEmitterCell.contents = UIImage(named:"star")?.cgImage
        starEmitterCell.birthRate = 0.4
        starEmitterCell.lifetime = 0.85
        starEmitterCell.velocity = 400
        starEmitterCell.scale = 0.03
        starEmitterCell.spin = 3
        starEmitterCell.emissionRange = CGFloat.pi * 0
        starEmitterCell.xAcceleration = -200
        starEmitterCell.yAcceleration = 450
        starEmitterCell.beginTime = CACurrentMediaTime()
        return starEmitterCell
    }

    
    @IBOutlet weak var starSwitch: UISwitch!
    @IBAction func starSwitch(_ sender: UISwitch!) {
    
    if sender.isOn{
        createEmitter()
        starEmitterLayer.birthRate = 0.4
        
        }
        else{
            
            starEmitterLayer.birthRate = 0
        }
        
        
    }
  
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let imageViewTop = UIImageView(frame: CGRect(x:0, y:0, width: view.frame.size.width, height: view.frame.size.height-(view.frame.size.height/2 + view.frame.size.width/2)))
    
        let imageView = UIImageView(frame: CGRect(x: 0, y: view.frame.size.height/2-view.frame.size.width/2, width: view.frame.size.width, height: view.frame.size.width))
      
        let imageViewDown = UIImageView(frame: CGRect(x:0, y:view.frame.size.height-view.frame.size.height/2 + view.frame.size.width/2, width: view.frame.size.width, height: view.frame.size.height-(view.frame.size.height/2 + view.frame.size.width/2)))
    
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = imageViewTop.bounds
        gradientLayer.colors = [UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha: 1).cgColor,UIColor.init(displayP3Red: 0, green: 112/255, blue: 107/255, alpha:1).cgColor]
        gradientLayer.locations = [0, 0.7]
        imageViewTop.layer.addSublayer(gradientLayer)
        
        
        let animatedImage = UIImage.animatedImageNamed("gif03-", duration: 2.5)
            imageView.image = animatedImage
        
        
        
        let gradientLayer2 = CAGradientLayer()
            gradientLayer2.frame = imageViewDown.bounds
            gradientLayer2.colors = [UIColor.init(displayP3Red: 54/255 , green: 47/255, blue: 45/255, alpha: 1).cgColor,UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha:1).cgColor]
            gradientLayer.locations = [0, 0.7]
            imageViewDown.layer.addSublayer(gradientLayer2)
            
        
    //    imageViewDown.backgroundColor = UIColor(displayP3Red: 54/255 , green: 47/255, blue: 45/255, alpha: 1)
        
        view.addSubview(imageViewTop)
        view.addSubview(imageViewDown)
        view.addSubview(imageView)
        view.addSubview(starSwitch)
        
          }
        
    

}

