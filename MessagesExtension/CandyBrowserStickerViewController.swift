//
//  CandyBrowserStickerViewController.swift
//  Stickerlicious
//
//  Created by Yevhen Kim on 2016-10-15.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import UIKit
import Messages

protocol Chocoholicable {
    func  setChocoholic(_ chocoholic: Bool)
}

let stickerNames = ["CandyCane", "Caramel", "ChocolateBar", "ChocolateChip", "DarkChocolate",
                    "GummiBear", "JawBreaker", "Lollipop", "SourCandy"]

class CandyBrowserViewController: MSStickerBrowserViewController {
    
    var stickers = [MSSticker]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadStickers()
        stickerBrowserView.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    }
}

extension CandyBrowserViewController {
    fileprivate func loadStickers(chocoholic: Bool = false) {
        var imageNames = stickerNames
        if chocoholic {
            imageNames = imageNames.filter({ name in
                return name.contains("Chocolate")
            })
        }
        for name in imageNames {
            //print(name)
//            guard let path = Bundle.main.url(forResource: name, withExtension: "png") else {
//                fatalError("no image found ")
//            }
            if let url = Bundle.main.url(forResource: name, withExtension: "png") {
                do {
                    let sticker = try? MSSticker(contentsOfFileURL: url, localizedDescription: name)
                    stickers.append(sticker!)
                    //print(stickers)
                } catch {
                    print(error)
                }
                
            }
        }
    }
    
    // MARK: - Stickers Browser VC Data Source
    override func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int {
        return stickers.count
    }
    
    override func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView, stickerAt index: Int) -> MSSticker {
        return stickers[index]
    }
}

extension CandyBrowserViewController: Chocoholicable {
    func setChocoholic(_ chocoholic: Bool) {
        loadStickers(chocoholic: chocoholic)
        stickerBrowserView.reloadData()
    }
}

