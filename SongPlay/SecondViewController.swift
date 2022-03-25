//
//  SecondViewController.swift
//  SongPlay
//
//  Created by Mac on 24/03/22.
//

import UIKit
import AVFAudio
import AVFoundation

class SecondViewController: UIViewController {
    
    @IBOutlet weak var artistNameLbl: UILabel!
    @IBOutlet weak var collectionNameLbl: UILabel!
    @IBOutlet weak var primaryGivenNameLbl: UILabel!
    @IBOutlet weak var releaseDateLbl: UILabel!
    @IBOutlet weak var copyRightLbl: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    
    var artist: Artist!
    
    var viewModel = SecondViewModel()
    var audioPlayer: AVAudioPlayer!
    
    var isPlaying: Bool = false
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    
    @IBAction func playBtnTapped(_ sender: UIButton) {
        downloadFileAndPlay()
    }
    
    
    
    
    @IBAction func stopBtnTapped(_ sender: UIButton) {
        if artist.wrapperType == "track" {
            stopAudio()
        }else {
            stopVideo()
        }
    }
    
    
    @IBAction func repeatBtnTapped(_ sender: UIButton) {
        downloadFileAndPlay()
    }
    
    
    
    
    func setupUI() {
        
        artistNameLbl.text = artist.artistName
        collectionNameLbl.text = artist.collectionName
        primaryGivenNameLbl.text = artist.primaryGenreName
        releaseDateLbl.text = artist.releaseDate
        copyRightLbl.text = "\(artist.trackID)"
    }
    
    
    
    
    
    func downloadFileAndPlay() {
        
        viewModel.audio = artist.previewURL ?? ""
        viewModel.downloadFile { sucess in
            if sucess {
                
                if self.artist.wrapperType == "track" {
                    self.playdownload()
                }else {
                    self.playVideo()
                }
            }
        }
    }
    
    func playdownload() {
        
        if let audioUrl = URL(string: artist.previewURL!) {

            // then lets create your document folder url
            let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

            // lets create your destination file url
            let destinationUrl = documentsDirectoryURL.appendingPathComponent(audioUrl.lastPathComponent)

            //let url = Bundle.main.url(forResource: destinationUrl, withExtension: "mp3")!

            do {
                audioPlayer = try AVAudioPlayer(contentsOf: destinationUrl)
                guard let player = audioPlayer else { return }

                player.prepareToPlay()
                player.play()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func stopAudio() {
        
        if isPlaying {
            audioPlayer.stop()
        }
        
        
    }
    
    
    func playVideo() {
        if let videoUrl = URL(string: artist.previewURL!) {
            // then lets create your document folder url
            let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            
            // lets create your destination file url
            let destinationUrl = documentsDirectoryURL.appendingPathComponent(videoUrl.lastPathComponent)
            
            self.player = AVPlayer(url: destinationUrl)
            
            self.playerLayer = AVPlayerLayer(player: self.player)
            self.playerLayer?.frame = self.view.frame
            self.mainView.layer.addSublayer(self.playerLayer!)
            self.player?.play()
            
        }
    }
    
    func stopVideo() {
        self.player?.pause()
    }
    
    
}
