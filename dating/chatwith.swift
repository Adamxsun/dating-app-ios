//
//  chatwith.swift
//  dating
//
//  Created by Xiao Sun on 2021-02-28.
//

import UIKit
import MessageKit
import InputBarAccessoryView
struct Sender:SenderType{
    var senderId: String
    var displayName: String
    
}
struct Message:MessageType{
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}
class chatwith: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate,InputBarAccessoryViewDelegate{
    
    let currentUser = Sender(senderId: "self", displayName: "Adam")
    let otherUser = Sender(senderId: "other", displayName: "ee")
    var messages = [MessageType]()
    var messageIdNumber = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messages.append(Message(sender: otherUser,
                                messageId: "1",
                                sentDate: Date().addingTimeInterval(-86400),
                                kind: .text("You are matched together! Let's talk now!")))
 
        messageInputBar.delegate = self
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
    
    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        var textSr = inputBar.inputTextView.text
        
        messages.append(Message(sender: currentUser,
                                messageId: String(messageIdNumber),
                                sentDate: Date().addingTimeInterval(-70000),
                                kind: .text(textSr!)))
                        
        messagesCollectionView.reloadData()
        messagesCollectionView.scrollToBottom(animated: true)
        inputBar.inputTextView.text = ""
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? .orange: .lightGray
    }
    
}
