//
//  Details_ListTableViewCell.swift
//  tally
//
//  Created by 李志敬 on 2019/3/17.
//  Copyright © 2019 李志敬. All rights reserved.
//

import UIKit

class Details_ListTableViewCell: UITableViewCell {
    
    
    var _tallyModel: TallyList?
    var tallyModel: TallyList{
        set{
            _tallyModel = newValue
            
            let imageName: String = (_tallyModel?.consumeType ?? "餐饮").appending("high")
            self.photoView?.image = UIImage.init(named: imageName)
            self.titleLabel?.text = _tallyModel?.consumeType
            if _tallyModel?.tallyType == 1{
                self.amountLabel?.text = "-".appending(_tallyModel?.amount ?? "0.00")
                self.imageBackView?.backgroundColor = themeColor
            }else{
                self.amountLabel?.text = _tallyModel?.amount ?? "0.00"
                let highColor2: UIColor = UIColor.init(red: 0, green: 179 / 255.0, blue: 125 / 255.0, alpha: 1.0)
                self.imageBackView?.backgroundColor = highColor2

            }
            
        }
        get{
            return _tallyModel ?? TallyList.init()
        }
    }
    
    var imageBackView: UIView?
    var photoView: UIImageView?
    var titleLabel: UILabel?
    var amountLabel: UILabel?
    var bottomLine: UIView?
    private var _isHiddenSeparateLine: Bool = false
    var isHiddenSeparateLine: Bool{
        set{
            _isHiddenSeparateLine = newValue
            if _isHiddenSeparateLine{
                self.bottomLine?.isHidden = true
            }else{
                self.bottomLine?.isHidden = false
            }
        }
        get{
            return _isHiddenSeparateLine
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() -> Void {
        
        let imageBackView_Width: CGFloat =  35
        let imageBackView: UIView = UIView.init()
        imageBackView.backgroundColor = themeColor
        imageBackView.layer.cornerRadius = imageBackView_Width / 2.0
        imageBackView.clipsToBounds = true
        self.contentView.addSubview(imageBackView)
        imageBackView.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.width.height.equalTo(imageBackView_Width)
            make.centerY.equalTo(self)
        }
        self.imageBackView = imageBackView
        
        let photoView: UIImageView = UIImageView.init()
        photoView.image = UIImage.init(named: "餐饮high")
        imageBackView.addSubview(photoView)
        photoView.snp.makeConstraints { (make) in
            make.left.top.equalTo(5)
            make.bottom.right.equalTo(-5)
        }
        self.photoView = photoView
        
        let titleLabel: UILabel = UILabel.init()
        titleLabel.textColor = UIColor.init(red: 62 / 255.0, green: 62 / 255.0, blue: 62 / 255.0, alpha: 1.0)
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.light)
        titleLabel.text = "餐饮"
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imageBackView.snp.right).offset(15)
            make.height.equalTo(30)
            make.width.equalTo(60)
            make.centerY.equalTo(self)
        }
        self.titleLabel = titleLabel
        
        
        let amountLabel: UILabel = UILabel.init()
        amountLabel.text = "0.00"
        amountLabel.textColor = UIColor.init(red: 129 / 255.0, green: 129 / 255.0, blue: 129 / 255.0, alpha: 1.0)
        amountLabel.textAlignment = NSTextAlignment.right
        amountLabel.font = UIFont.init(name: "PingFangSC-Regular", size: 15)
        self.contentView.addSubview(amountLabel)
        amountLabel.snp.makeConstraints { (make) in
            make.right.equalTo(-15)
            make.left.equalTo(titleLabel.snp.right).offset(5)
            make.height.equalTo(30)
            make.centerY.equalTo(self)
        }
        
        self.amountLabel = amountLabel
        
        let bottomLine: UIView = UIView.init()
        bottomLine.backgroundColor = UIColor.init(red: 237 / 255.0, green: 237 / 255.0, blue: 237 / 255.0, alpha: 1)
        self.contentView.addSubview(bottomLine)
        bottomLine.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalTo(0)
            make.height.equalTo(0.5)
            make.bottom.equalTo(0)
        }
        self.bottomLine = bottomLine
        

    }
    
    
    
    
    
}
