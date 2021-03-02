//
//  chatwith.swift
//  dating
//
//  Created by Xiao Sun on 2021-02-28.
//

import UIKit
import MessageKit
import InputBarAccessoryView
import SDWebImage

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
    var user2ImgUrl: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        var firstMessage = "You are matched \(mainPage.matchedUser) together! Let's talk now!"
        messages.append(Message(sender: otherUser,
                                messageId: "1",
                                sentDate: Date().addingTimeInterval(-86400),
                                kind: .text(firstMessage)))
 
        messageInputBar.delegate = self
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        if chat.talkHelper == true {
            if SignUp.UserGender == "woman"{
                messageInputBar.inputTextView.text = "My mom told me that life was a deck of cards🤔 So I guess you must be the queen of hearts."
            }
            else{
                messageInputBar.inputTextView.text = "My mom told me that life was a deck of cards🤔 So I guess you must be the King of clubs."
            }
        }
    }//viewDidLoad
    
    func currentSender() -> SenderType {
        return currentUser
    }//curentSender
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }//messageForItem
    
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        var textSr = inputBar.inputTextView.text
        
        messages.append(Message(sender: currentUser,
                                messageId: String(messageIdNumber),
                                sentDate: Date().addingTimeInterval(-70000),
                                kind: .text(textSr!)))
                        
        messagesCollectionView.reloadData()
        messagesCollectionView.scrollToLastItem(animated: true)
        if chat.water == false {
            chat.water = true
        }
        if textSr == "GrowUp!"
        {chat.plantDate += 100}
        inputBar.inputTextView.text = ""
    }//inputBar
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }//numberOfSections
    
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? .orange: .lightGray
    }//backgroundColor
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
            
        if message.sender.senderId == currentUser.senderId {
            avatarView.image = UploadView.userImage
        }//if
        else {
            avatarView.image = UIImage(named: mainPage.matchedUserImage)
        }//else
        
    }//configureAvatarView
}

