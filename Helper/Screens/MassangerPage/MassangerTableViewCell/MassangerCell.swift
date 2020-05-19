
import UIKit

class MassangerCell: UITableViewCell {
    
    static var reuseId: String = "MassageCell"
    static var nib: UINib {
        UINib(nibName: "MassangerCell", bundle: nil)
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
