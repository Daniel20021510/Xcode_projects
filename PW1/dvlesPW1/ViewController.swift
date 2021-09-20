//
//  ViewController.swift
//  dvlesPW1
//
//  Created by Даниил Лесь on 20.09.2021.
//

import UIKit
import AVFoundation


final class ViewController: UIViewController {
    @IBOutlet var views: [UIView]!
    let pianoSound = URL(fileURLWithPath: Bundle.main.path(forResource: "sound", ofType: "mp3")!)
    var audioPlayer = AVAudioPlayer()
    var counter = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func Music() {
          do {
               audioPlayer = try AVAudioPlayer(contentsOf: pianoSound)
               audioPlayer.play()
          } catch {
             // couldn't load file :(
          }
    }
    
    private func randomHexColorCode() -> String {
            let a = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"];
            var color = ""
            while color.count < 6 {
                color += a[Int.random(in: 0..<a.count)]
            }
            
            return color
    }
        
    private func colorFromHexString(_ hexCode:String!) -> UIColor {
        let scanner = Scanner(string:hexCode)
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "$+#")
        var hex: CUnsignedLongLong = 0
        if(!scanner.scanHexInt64(&hex)){
            return .clear
        }
        let r = (hex >> 16) & 0xFF;
        let g = (hex >> 8) & 0xFF;
        let b = (hex) & 0xFF;
        return UIColor.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1)
    }

    @IBAction private func changeColorButtonPressed(_ sender: Any) {
        let button = sender as? UIButton
        button?.isEnabled = false
        if counter == 5{
            Music()
        }
        counter += 1;
        var set = Set<UIColor>()
        while set.count < views.count {
            set.insert(
                colorFromHexString(randomHexColorCode())
            )
        }
        
        UIView.animate(withDuration: 1, animations: {
            for view in self.views {
                view.layer.cornerRadius = 10
                view.backgroundColor = set.popFirst()
            }
        }) { completion in
            button?.isEnabled = true
        }
    }


}

