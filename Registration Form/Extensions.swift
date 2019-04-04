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
