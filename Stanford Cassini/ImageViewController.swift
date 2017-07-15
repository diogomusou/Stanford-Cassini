//
//  ImageViewController.swift
//  Stanford Cassini
//
//  Created by Diogo M Souza on 2017/07/14.
//  Copyright © 2017 Diogo M Souza. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    var imageURL : URL? {
        didSet {
            image = nil
            if view.window != nil {
                fetchData()
            }
        }
    }
    
    private let imageView = UIImageView()
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 2.0
            scrollView.contentSize = imageView.frame.size
            scrollView.addSubview(imageView)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        view.addSubview(scrollView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            fetchData()
        }
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private func fetchData() {
        if let url = imageURL {
            activityIndicator.startAnimating()
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                let urlContents = try? Data(contentsOf: url)
                if let imageData = urlContents, url == self?.imageURL {
                    DispatchQueue.main.async {
                        self?.image = UIImage(data: imageData)
                    }
                }
            }
        }
    }
    
    private var image : UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            activityIndicator?.stopAnimating()
        }
    }
}

extension ImageViewController : UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
