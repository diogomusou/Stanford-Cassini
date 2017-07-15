//
//  File.swift
//  Stanford Cassini
//
//  Created by Diogo M Souza on 2017/07/16.
//  Copyright © 2017 Diogo M Souza. All rights reserved.
//

import Foundation

struct DemoURL {
    static let jk = URL(string: "https://cdn.mdpr.jp/photo/images/18/0d0/w700c-ez_dd5e68a2ca0904d736e0b3082b925022903b17f86c17bf13.jpg")
    
    static var NASA: Dictionary<String,URL> = {
        let NASAURLStrings = [
            "Cassini" : "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
            "Earth" : "http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
            "Saturn" : "http://www.nasa.gov/sites/default/files/saturn_collage.jpg"
        ]
        var urls = Dictionary<String,URL>()
        for (key, value) in NASAURLStrings {
            urls[key] = URL(string: value)
        }
        return urls
    }()
}
