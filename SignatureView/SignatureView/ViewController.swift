//
//  ViewController.swift
//  SignatureView
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var signatureView: YPDrawSignatureView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onTapSaveButton(_ sender: Any) {
        if let signatureImage = signatureView.getSignature(scale: 10) {
                   saveImageToGallery(image: signatureImage)
                  signatureView.clear()
               }
    }
    
    func saveImageToGallery(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(imageSaved(_:didFinishSavingWithError:contextInfo:)), nil)
    }

    @objc func imageSaved(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // Image failed to save with error
            print("Error saving image: \(error.localizedDescription)")
        } else {
            // Image saved successfully
            print("Image saved successfully.")
        }
    }
}

