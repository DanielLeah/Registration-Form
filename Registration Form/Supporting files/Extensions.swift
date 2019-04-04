//
//  Extensions.swift
//  Registration Form
//
//  Created by David Daniel Leah (BFS EUROPE) on 04/04/2019.
//  Copyright © 2019 David Daniel Leah (BFS EUROPE). All rights reserved.
//

import UIKit

extension UIView {
    func addBackground() {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        if let image = CIImage(image: UIImage(named: "background")!){
            let blur = CIFilter(name: "CIGaussianBlur")
            blur?.setValue(image, forKey: kCIInputImageKey)
            blur?.setValue(10.0, forKey: kCIInputRadiusKey)
            if let outputImage = blur?.outputImage {
                imageViewBackground.image = UIImage(ciImage: outputImage)
                imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFit
                
                self.addSubview(imageViewBackground)
                self.sendSubviewToBack(imageViewBackground)
            }
        }
    }}

extension CALayer {
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: thickness)
            
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: self.bounds.height - thickness,  width: self.bounds.width, height: thickness)
            
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0,  width: thickness, height: self.bounds.height)
            
        case UIRectEdge.right:
            border.frame = CGRect(x: self.bounds.width - thickness, y: 0,  width: thickness, height: self.bounds.height)
        default:
            border.frame =  CGRect(x: self.bounds.width, y: 0,  width: 0, height: self.bounds.height)
        }
        border.backgroundColor = color.cgColor;
        self.addSublayer(border)
    }
}
