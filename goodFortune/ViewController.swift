//
//  ViewController.swift
//  goodFortune
//
//  Created by Umut Cörüt on 7.04.2022.
//

import UIKit
import AVFoundation
import GoogleMobileAds

let slctArray: [String] = ["✨", "🪐"]
var labelArray: [UILabel] = []
var countArray: [String] = ["3", "2", "1", "0"]
var timer = Timer()
var timer2 = Timer()
var scoreCount = 0
var counter = 0
var highScore = 0
var imageCount = 0
var adcount = 0

class ViewController: UIViewController, GADFullScreenContentDelegate {
    var selected = UILabel()
    private var rewardedAd: GADRewardedAd?
    func loadRewardedAd() {
        let request = GADRequest()
        GADRewardedAd.load(withAdUnitID:"ca-app-pub-4842642976376796/7347403137",
                           request: request,
                           completionHandler: { [self] ad, error in
            if let error = error {
                print("Failed to load rewarded ad with error: \(error.localizedDescription)")
                return
            }
            rewardedAd = ad
            print("Rewarded ad loaded.")
            rewardedAd?.fullScreenContentDelegate = self
        }
        )
    }
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
    }
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad will present full screen content.")
    }
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
    }
    
    var player: AVAudioPlayer?
    var player2: AVAudioPlayer?
    var player3: AVAudioPlayer?
    var player4: AVAudioPlayer?
    var player5: AVAudioPlayer?
    var player6: AVAudioPlayer?
    
    @IBOutlet weak var box1: UILabel!
    @IBOutlet weak var box2: UILabel!
    @IBOutlet weak var box3: UILabel!
    @IBOutlet weak var box4: UILabel!
    @IBOutlet weak var box8: UILabel!
    @IBOutlet weak var box9: UILabel!
    @IBOutlet weak var box10: UILabel!
    @IBOutlet weak var box11: UILabel!
    @IBOutlet weak var box15: UILabel!
    @IBOutlet weak var box16: UILabel!
    @IBOutlet weak var box17: UILabel!
    @IBOutlet weak var box18: UILabel!
    @IBOutlet weak var box22: UILabel!
    @IBOutlet weak var box23: UILabel!
    @IBOutlet weak var box24: UILabel!
    @IBOutlet weak var box25: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var playLabel: UIButton!
    @IBOutlet weak var fireButton: UIButton!
    @IBOutlet weak var tryAgainButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var countDown: UILabel!
    @IBOutlet weak var volumeLabel: UIButton!
    @IBOutlet weak var adButtonLabel: UIButton!
    @IBOutlet weak var continueButtonLabel: UIButton!
    
    let fullString = NSMutableAttributedString(string: "")
    
    func trueorfalse() {
        adButtonLabel.isHidden = true
        descriptionLabel.isHidden = false
        fireButton.isHidden = true
        playLabel.isHidden = false
        tryAgainButton.isHidden = true
    }
    
    func trueorfalse2() {
        adButtonLabel.isHidden = true
        countDown.isHidden = false
        descriptionLabel.isHidden = true
        fireButton.isHidden = false
        playLabel.isHidden = true
        volumeLabel.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelArray = [box1, box2, box3, box4, box8, box9, box10, box11, box15, box16, box17, box18, box22, box23, box24, box25]
        continueButtonLabel.isHidden = true
        let pathToSound6 = Bundle.main.path(forResource: "war", ofType: "wav")!
        let url = URL(fileURLWithPath: pathToSound6)
        do {
            player6 = try AVAudioPlayer(contentsOf: url)
            if volumeCount == 0 {
                player6?.play()
                player6?.numberOfLoops = -1
            } else {}
        } catch {
            print("error")
        }
        let image1Attachment = NSTextAttachment()
        image1Attachment.image = UIImage(named: "minirocket.png")
        let image1String = NSAttributedString(attachment: image1Attachment)
        fullString.append(image1String)
        let width = view.frame.size.width
        let height = view.frame.size.height
        highScoreLabel.frame = CGRect(x: width * 0.05, y: height * 0.05, width: width * 0.55, height: height * 0.05)
        box1.frame = CGRect(x: width * 0.02, y: height * 0.20, width: width * 0.225, height: height * 0.14)
        box2.frame = CGRect(x: width * 0.02, y: height * 0.32, width: width * 0.225, height: height * 0.14)
        box3.frame = CGRect(x: width * 0.02, y: height * 0.44, width: width * 0.225, height: height * 0.14)
        box4.frame = CGRect(x: width * 0.02, y: height * 0.56, width: width * 0.225, height: height * 0.14)
        box8.frame = CGRect(x: width * 0.265, y: height * 0.20, width: width * 0.225, height: height * 0.14)
        box9.frame = CGRect(x: width * 0.265, y: height * 0.32, width: width * 0.225, height: height * 0.14)
        box10.frame = CGRect(x: width * 0.265, y: height * 0.44, width: width * 0.225, height: height * 0.14)
        box11.frame = CGRect(x: width * 0.265, y: height * 0.56, width: width * 0.225, height: height * 0.14)
        box15.frame = CGRect(x: width * 0.51, y: height * 0.20, width: width * 0.225, height: height * 0.14)
        box16.frame = CGRect(x: width * 0.51, y: height * 0.32, width: width * 0.225, height: height * 0.14)
        box17.frame = CGRect(x: width * 0.51, y: height * 0.44, width: width * 0.225, height: height * 0.14)
        box18.frame = CGRect(x: width * 0.51, y: height * 0.56, width: width * 0.225, height: height * 0.14)
        box22.frame = CGRect(x: width * 0.755, y: height * 0.20, width: width * 0.225, height: height * 0.14)
        box23.frame = CGRect(x: width * 0.755, y: height * 0.32, width: width * 0.225, height: height * 0.14)
        box24.frame = CGRect(x: width * 0.755, y: height * 0.44, width: width * 0.225, height: height * 0.14)
        box25.frame = CGRect(x: width * 0.755, y: height * 0.56, width: width * 0.225, height: height * 0.14)
        countDown.frame = CGRect(x: width * 0.265, y: height * 0.32, width: width * 0.47, height: height * 0.15)
        scoreLabel.frame = CGRect(x: width * 0.45, y: height * 0.1, width: width * 0.45, height: height * 0.1)
        descriptionLabel.frame = CGRect(x: width * 0.05, y: height * 0.2, width: width * 0.90, height: height * 0.4)
        volumeLabel.frame = CGRect(x: width * 0.40, y: height * 0.57, width: width * 0.20, height: height * 0.1)
        adButtonLabel.frame = CGRect(x: width * 0.55, y: height * 0.68, width: width * 0.45, height: height * 0.12)
        continueButtonLabel.frame = CGRect(x: width * 0.55, y: height * 0.68, width: width * 0.45, height: height * 0.12)
        playLabel.frame = CGRect(x: width * 0.25, y: height * 0.83, width: width * 0.5, height: height * 0.12)
        tryAgainButton.frame = CGRect(x: width * 0.05, y: height * 0.68, width: width * 0.45, height: height * 0.12)
        fireButton.frame = CGRect(x: width * 0.15, y: height * 0.70, width: width * 0.7, height: height * 0.27)
        backgroundImage.frame = CGRect(x: width * 0.0, y: height * 0.0, width: width * 1, height: height * 1)
        highScore = UserDefaults.standard.value(forKey: "highscore")  as? Int ?? 0
        highScoreLabel.text = "HIGH SCORE: \(highScore)"
        descriptionLabel.text = "Travel to more planets by tapping the rocket. 🚀\n\nBut the stars are very hot, so be careful if you don't want to be bubbles. 🫧"
        tryAgainButton.titleLabel?.textAlignment = .center
        trueorfalse()
    }
    @objc func hidebox() {
        if imageCount > 0 {
            player?.stop()
            UINotificationFeedbackGenerator().notificationOccurred(.error)
            let pathToSound2 = Bundle.main.path(forResource: "tech", ofType: "wav")!
            let url = URL(fileURLWithPath: pathToSound2)
            do {
                player2 = try AVAudioPlayer(contentsOf: url)
                if volumeCount == 0 {
                    player2?.play()
                } else {}
            } catch {
                print("error")
            }
            if volumeCount == 0 {
                player6?.play()
                player6?.numberOfLoops = -1
            } else {}
            if highScore <= scoreCount {
                highScore = scoreCount
                UserDefaults.standard.setValue(highScore, forKey: "highscore")
            }
            highScoreLabel.text = "HIGH SCORE: \(highScore)"
            if adcount > 0 {
                adButtonLabel.isHidden = true
            } else {
                adButtonLabel.isHidden = false
            }
            fireButton.isHidden = true
            tryAgainButton.isHidden = false
            timer.invalidate()
            imageCount = 0
            scoreLabel.text = "\(scoreCount)"
        } else {
            for i in labelArray {
                i.isHidden = true
            }
            countDown.isHidden = true
            selected = labelArray.randomElement()!
            selected.isHidden = false
            selected.text! = slctArray.randomElement()!
            if selected.text! == "🪐" {
                imageCount += 1
            }
        }
    }
    @objc func countdownForRocket() {
        if countDown.text != "0" {
            countDown.isHidden = false
            countDown.text = countArray[0]
            countArray.remove(at: 0)
        } else {
            player5?.stop()
            let pathToSound = Bundle.main.path(forResource: "pulse", ofType: "wav")!
            let url = URL(fileURLWithPath: pathToSound)
            do {
                player = try AVAudioPlayer(contentsOf: url)
                if volumeCount == 0 {
                    player?.play()
                    player?.numberOfLoops = -1
                } else {}
            } catch {
                print("error")
            }
            countDown.text = ""
            countDown.isHidden = true
            timer2.invalidate()
            countArray.removeAll()
            countArray = ["3", "2", "1", "0"]
            hidebox()
            timer = Timer.scheduledTimer(timeInterval: 0.45, target: self, selector: #selector(hidebox), userInfo: nil, repeats: true)
            fireButton.isEnabled = true
        }
    }
    var volumeCount = 0
    @IBAction func volume(_ sender: Any) {
        if volumeCount == 0 {
            volumeCount += 1
            player6?.stop()
            volumeLabel.setTitle("🔇", for: .normal)
        } else {
            volumeCount = 0
            player6?.play()
            volumeLabel.setTitle("🔊", for: .normal)
        }
    }
    @IBAction func continueButton(_ sender: Any) {
        trueorfalse2()
        tryAgainButton.isHidden = true
        fireButton.isEnabled = false
        scoreLabel.text = "\(scoreCount)"
        selected.text = ""
        player6?.stop()
        continueButtonLabel.isHidden = true
        let pathToSound5 = Bundle.main.path(forResource: "rocket", ofType: "wav")!
        let url = URL(fileURLWithPath: pathToSound5)
        do {
            player5 = try AVAudioPlayer(contentsOf: url)
            if volumeCount == 0 {
                player5?.play()
            } else {}
        } catch {
            print("error")
        }
        timer2 = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(self.countdownForRocket), userInfo: nil, repeats: true)
    }
    
    @IBAction func adButton(_ sender: Any) {
        if let ad = rewardedAd {
            self.player6?.stop()
            ad.present(fromRootViewController: self) {
                let reward = ad.adReward
                print("Reward received with currency \(reward.amount), amount \(reward.amount.doubleValue)")
                // TODO: Reward the user.
                adcount += 1
                self.continueButtonLabel.isHidden = false
                self.tryAgainButton.isHidden = true
                self.adButtonLabel.isHidden = true
            }
        } else {
            self.player6?.play()
            print("Ad wasn't ready")
        }
    }
    @IBAction func catchButton(_ sender: Any) {
        if selected.text! == "🪐" {
            let pathToSound3 = Bundle.main.path(forResource: "game", ofType: "wav")!
            let url = URL(fileURLWithPath: pathToSound3)
            do {
                player3 = try AVAudioPlayer(contentsOf: url)
                if volumeCount == 0 {
                    player3?.play()
                } else {}
            } catch {
                print("error")
            }
            imageCount = 0
            selected.attributedText = fullString
            scoreCount += 1
            scoreLabel.text = "\(scoreCount)"
        } else {
            UINotificationFeedbackGenerator().notificationOccurred(.error)
            player?.stop()
            let pathToSound4 = Bundle.main.path(forResource: "bubble", ofType: "wav")!
            let url = URL(fileURLWithPath: pathToSound4)
            do {
                player4 = try AVAudioPlayer(contentsOf: url)
                if volumeCount == 0 {
                    player4?.play()
                } else {}
            } catch {
                print("error")
            }
            selected.text! = "🫧"
            if highScore <= scoreCount {
                highScore = scoreCount
                UserDefaults.standard.setValue(highScore, forKey: "highscore")
            }
            if volumeCount == 0 {
                player6?.play()
                player6?.numberOfLoops = -1
            } else {}
            highScoreLabel.text = "HIGH SCORE: \(highScore)"
            if adcount > 0 {
                adButtonLabel.isHidden = true
            } else {
                adButtonLabel.isHidden = false
            }
            fireButton.isHidden = true
            tryAgainButton.isHidden = false
            timer.invalidate()
            scoreLabel.text = "\(scoreCount)"
        }
    }
    @IBAction func tryAgain(_ sender: Any) {
        selected.text = ""
        scoreCount = 0
        adcount = 0
        if volumeCount == 0 {
            player6?.play()
            player6?.numberOfLoops = -1
        } else {}
        highScoreLabel.text = "HIGH SCORE: \(highScore)"
        descriptionLabel.text = "Travel to more planets by tapping the rocket. 🚀\n\nBut the stars are very hot, so be careful if you don't want to be bubbles. 🫧"
        tryAgainButton.titleLabel?.textAlignment = .center
        trueorfalse()
        volumeLabel.isHidden = false
        scoreLabel.text = "\(scoreCount)"
    }
    @IBAction func play(_ sender: Any) {
        loadRewardedAd()
        trueorfalse2()
        fireButton.isEnabled = false
        scoreCount = 0
        scoreLabel.text = "\(scoreCount)"
        
        player6?.stop()
        let pathToSound5 = Bundle.main.path(forResource: "rocket", ofType: "wav")!
        let url = URL(fileURLWithPath: pathToSound5)
        do {
            player5 = try AVAudioPlayer(contentsOf: url)
            if volumeCount == 0 {
                player5?.play()
            } else {}
        } catch {
            print("error")
        }
        timer2 = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(countdownForRocket), userInfo: nil, repeats: true)
    }
}

