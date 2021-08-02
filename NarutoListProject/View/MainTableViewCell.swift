//
//  MainTableViewCell.swift
//  NarutoListProject
//
//  Created by Ge Ding on 8/1/21.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImgView: UIImageView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var startLb: UILabel!
    @IBOutlet weak var endLb: UILabel!
    @IBOutlet weak var scoreLb: UILabel!
    @IBOutlet weak var synopsisTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    var episodeObject: Anime? {
        willSet(obj) {
            self.titleLb.text = obj?.title
            self.startLb.text = "Start: \(obj?.start_date?.getDateString() ?? "-")"
            self.endLb.text = "End: \(obj?.end_date?.getDateString() ?? "-")"
            self.scoreLb.text = "Score: \(obj?.score?.description ?? "-")"
            self.synopsisTextView.text = obj?.synopsis ?? ""
            self.synopsisTextView.isEditable = false

            //Setting image
            ImageDownloader.shared.getImage(url: obj?.image_url) { [weak self] image in
                DispatchQueue.main.async {
                    self?.posterImgView.image = image
                }
            }
        }
    }
}

class ImageDownloader {
    static let shared = ImageDownloader()
    private init() {}
    let imageCache = NSCache<NSString, UIImage>()

    func getImage(url: String?, completion:@escaping (UIImage) -> ()) {
        guard let url = url else {
            completion(UIImage(named: "template")!)
            return
        }

        if let cached = imageCache.object(forKey: url as NSString) {
            completion(cached)
        }

        DispatchQueue.global(qos: .background).async {
            if let dataUrl = URL(string: url) {
                do {
                    let data = try Data(contentsOf: dataUrl)
                    if let image = UIImage(data: data) {
                        self.imageCache.setObject(image, forKey: url as NSString)
                        completion(image)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                completion(UIImage(named: "template")!)
            }
        }
    }
}
