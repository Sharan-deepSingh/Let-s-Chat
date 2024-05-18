//
//  SenderMessageCell.swift
//  Let's Chat
//
//  Created by Sharandeep Singh on 01/05/24.
//

import UIKit

class MessageBubble: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var receiverProfileImage: UIImageView!
    @IBOutlet weak var senderProfileImage: UIImageView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    //MARK: - Properties
    var bubbleType: BubbleType?
    
    //MARK: - LifeCycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initialUISetup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupUIBasedOn(bubbleType: bubbleType)
    }
    
    //MARK: - UI Related Methods
    private func initialUISetup() {
        messageView.layer.cornerRadius = messageView.frame.height / 24
    }
    
    private func setupUIBasedOn(bubbleType: BubbleType?) {
        guard let type = bubbleType else { return }
        
        switch type {
            
        case .senderBubble:
            receiverProfileImage.isHidden           = true
            senderProfileImage.isHidden             = false
            messageView.backgroundColor             = .brandPurple
            messageLabel.backgroundColor            = .brandPurple
            messageLabel.textColor                  = .white
            senderProfileImage.layer.cornerRadius   = 14
        case .receiverBubble:
            senderProfileImage.isHidden             = true
            receiverProfileImage.isHidden           = false
            messageView.backgroundColor             = .brandBlackBrown
            messageLabel.backgroundColor            = .brandBlackBrown
            messageLabel.textColor                  = .brandGrayWhite
            receiverProfileImage.layer.cornerRadius = 14
        }
    }
}
