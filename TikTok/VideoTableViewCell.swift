//
//  VideoTableViewCell.swift
//  TikTok
//
//  Created by wherear3y0 on 22.06.2023.
//


import BMPlayer
import SnapKit
import UIKit

class VideoTableViewCell: UITableViewCell {
    
    private var link: String
    private var player = BMPlayer()
    
    init(link: String) {
        self.link = link
        super.init(style: .default, reuseIdentifier: "cell")
        initialize()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been inplemented")
    }
    
    private func initialize(){
        player.isUserInteractionEnabled = false
        BMPlayerConf.enableVolumeGestures = false
        BMPlayerConf.enableBrightnessGestures = false
        BMPlayerConf.enablePlaytimeGestures = false
        BMPlayerConf.shouldAutoPlay = true
        
        let resourse = BMPlayerResource(url: URL(string: link)!)
        player.setVideo(resource: resourse)
        self.contentView.addSubview(player)
        player.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        
    }
    
}

