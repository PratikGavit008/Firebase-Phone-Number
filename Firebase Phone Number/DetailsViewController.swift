//
//  DetailsViewController.swift
//  NewsApi
//
//  Created by Nayan Pawar on 07/02/23.
//

import UIKit
import Kingfisher
class DetailsViewController: UIViewController {
    
    
    var news : Articles?
    
    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblChannelName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setupUI()
    }
    
    func setupUI(){
        imgBackground.kf.setImage(
            with: URL(string: news?.urlToImage ?? ""),
            placeholder: UIImage(systemName: "newspaper"),
            options: [
                .scaleFactor(UIScreen.main.nativeScale),
                .transition(.fade(1)),
            ])
        lblTitle.text = news?.title
        lblChannelName.text = news?.author
        lblDate.text = news?.publishedAt
        lblDesc.text = news?.description
        
    }
}
