
import UIKit

class MessangerCell: UITableViewCell {
    
    static var reuseId: String = "MessageCell"
    static var nib: UINib {
        UINib(nibName: "MessangerCell", bundle: nil)
    }
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textMassageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // чтоб не повторялись фотографии при загрузки
        avatarImage.image = nil
    }
    
    func renderCell() {
        // все дополнительные настройки сделал в xib файле
        avatarImage.image = UIImage(systemName: "person")
        nameLabel.text = "Егор Губернатович"
        textMassageLabel.text = "Сегодня получилось чего то сделалать"
        timeLabel.text = "25.06.2020"
    }
    
}
