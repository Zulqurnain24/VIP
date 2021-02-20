//
//  PlayerManager.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import Foundation
import AVFoundation

protocol PlayerManagerDelegate: class {
    func didFinishPlaying()
    func currentTime(_ seconds: Int)
    func totalSecondsDuration(_ seconds: Double)
}

class PlayerManager {

    public weak var delegate: PlayerManagerDelegate?

    internal var observer: NSKeyValueObservation?
    internal var player: AVPlayer?
    internal var url: URL?

    var isPlaying: Bool {
        return player?.timeControlStatus == .playing
    }

    static let shared: PlayerManager = { return PlayerManager() }()

    public func prepare(with url: URL?) {
        guard let url = url else { return }

        self.url = url

        NotificationCenter.default.addObserver(self, selector: #selector(didFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)

        let playerItem: AVPlayerItem = AVPlayerItem(url: url)

        // Register as an observer of the player item's status property
        self.observer = playerItem.observe(\.status, options: [.new, .old], changeHandler: { (playerItem, _) in
            if playerItem.status == .readyToPlay {
                self.readyToPlay()
            }
        })

        player = AVPlayer(playerItem: playerItem)
    }

    public func play() {
        player?.play()

        self.player?.addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(1, preferredTimescale: 1), queue: DispatchQueue.main, using: { [weak self] (_) in
            guard let `self` = self else { return }
            self.processCurrentTime()
        })
    }

    public func pause() {
        player?.pause()
    }

}

extension PlayerManager {

    private func readyToPlay() {
        guard let player = player, let currentItem = player.currentItem else {
            return
        }
        delegate?.totalSecondsDuration(currentItem.duration.seconds)
    }

    @objc private func didFinishPlaying() {
        delegate?.didFinishPlaying()
    }

    private func processCurrentTime() {
        guard let player = player, let currentItem = player.currentItem else {
            return
        }

        if currentItem.status == .readyToPlay {
            let currentTime = CMTimeGetSeconds(player.currentTime())
            let secs = Int(currentTime)
            delegate?.currentTime(secs)
        }
    }

}
