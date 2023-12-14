import UIKit
import Flutter
import AVFoundation

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  var player: AVAudioPlayer!
 override func application(
   _ application: UIApplication,
   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
 ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let joltChannel = FlutterMethodChannel(name: "silentJolt",
                                              binaryMessenger: controller.binaryMessenger)
    joltChannel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
        // This method is invoked on the UI thread.
        guard call.method == "sendingjolt" else {
          result(FlutterMethodNotImplemented)
          return
        }
      self?.playSound()
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
 }


private func playSound() {
    // Load a local sound file
    print("play sound func")
    guard let soundFileURL = Bundle.main.url(
        forResource: "audio",
        withExtension: "mp3"
    ) else {
      print("play sound else")
        return
    }
    
    do {
        // Configure and activate the AVAudioSession
        try AVAudioSession.sharedInstance().setCategory(
            AVAudioSession.Category.playback
        )
        print("trying")
        try AVAudioSession.sharedInstance().setActive(true)
        print("trying....")
        // Play a sound
        player = try AVAudioPlayer(
            contentsOf: soundFileURL
        )
        print("Still Trying..")
        player.play()
        print("playing")
    }
    catch {
        print("error while playing sound")
        print("Unexpected error: \(error).")
    }
}

}
