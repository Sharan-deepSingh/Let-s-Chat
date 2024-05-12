//
//  ChatViewController.swift
//  Let's Chat
//
//  Created by Sharandeep Singh on 06/04/24.
//

import UIKit

class ChatViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var bottomView: UIView!
    
    //MARK: - Properties
    
    //MARK: - Instances
    var chatViewModel = ChatViewModel()
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - IBActions
    @IBAction func messageSendButtonPressed(_ sender: UIButton) {
        let message = messageTextField.text ?? ""
        chatViewModel.dummyMessagesStore.append(message)
        messageTextField.text = ""
        chatTableView.reloadData()
    }
}


extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatViewModel.dummyMessagesStore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTableView.dequeueReusableCell(withIdentifier: "MessageBubble", for: indexPath) as! MessageBubble
        cell.bubbleType = .senderBubble
        cell.messageLabel.text = chatViewModel.dummyMessagesStore[indexPath.row]
        
        return cell
    }
}
