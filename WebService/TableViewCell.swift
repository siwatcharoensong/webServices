

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl:UILabel!
    @IBOutlet weak var imgImage:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setValue(data:Dictionary <String, AnyObject>){
        titleLbl.text = data["title"] as! String
        loadImg(url: data["thumb"] as! String)
    }
    
    func loadImg(url:String)
    {
        let urlName = URL(string: url)
        let urlData = NSData(contentsOf: urlName!)
        let image = UIImage(data: urlData as! Data)
        let imgView = UIImageView(image: image)
        self.imgImage.addSubview(imgView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
