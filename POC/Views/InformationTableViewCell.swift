//
//  InformationTableViewCell.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import UIKit
import SDWebImage


class InformationTableViewCell: UITableViewCell {
    
    var aboutCanadaViewModel : AboutCanadaViewModel! {
        didSet {
            titleLabel.text = aboutCanadaViewModel.title
            descriptionLabel.text = aboutCanadaViewModel.description
            profileImageView.sd_setImage(with: URL(string: aboutCanadaViewModel.imageUrl), placeholderImage: UIImage(named: StringConstants.Placeholder))
        }
    }
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    let profileImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = CGFloat(CircledImage)
        img.clipsToBounds = true
        return img
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.font = AppFonts.appTitleFont()
        label.textColor = AppColor.TextColors.title
        label.backgroundColor = AppColor.appBackgroundWhiteColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = numberOfLinesCapability
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }()
    
    let descriptionLabel:UILabel = {
        let label = UILabel()
        label.font = AppFonts.appSubTitleFont()
        label.textColor =  AppColor.TextColors.subTitle
        label.backgroundColor = AppColor.appBackgroundWhiteColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = numberOfLinesCapability
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(profileImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        self.contentView.addSubview(containerView)
        self.contentView.backgroundColor = AppColor.appBackgroundWhiteColor
        self.accessibilityIdentifier = AccessibilityId.cellId
        
        profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:InformationCellAnchorConstant.profileImageViewLeadingAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant:CGFloat(imageDimesion)).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant:CGFloat(imageDimesion)).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.profileImageView.trailingAnchor, constant:InformationCellAnchorConstant.containerViewLeadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:InformationCellAnchorConstant.contentViewTrailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor, constant: InformationCellAnchorConstant.contentViewBottomAnchor).isActive = true
        
        containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: CGFloat(imageDimesion)).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo:self.titleLabel.bottomAnchor, constant: InformationCellAnchorConstant.titleLabelBottomAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo:self.containerView.bottomAnchor, constant: InformationCellAnchorConstant.containerViewBottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

extension InformationTableViewCell {
  public struct AccessibilityId {
    public static let cellId = StringConstants.InfoTableViewcell
  }
}

