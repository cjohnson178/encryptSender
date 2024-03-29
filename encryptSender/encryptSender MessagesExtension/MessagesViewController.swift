//
//  MessagesViewController.swift
//  encryptSender MessagesExtension
//
//  Created by Computer on 9/15/21.
//

import UIKit
import Messages

extension String
{
    func encodeUrl() -> String?
    {
        return self.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
    }
    func decodeUrl() -> String?
    {
        return self.removingPercentEncoding
    }
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }

    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }

    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }

    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
}


class MessagesViewController: MSMessagesAppViewController {
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var encryptedText: UILabel!
    @IBOutlet weak var copyButton: UIButton!
    
    
    @IBAction func copyButton(_ sender: Any) {
        UIPasteboard.general.string = "Hello world - Clipboard Testing!"
    }
    
    
    @IBAction func Encrypt(_ sender: Any) {
        
        encryptedText.text = inputField.text
        //print("Print working!")
        
        //let layout2 = MSMessageTemplateLayout()
        
       // var selectedMessage = activeConversation?.selectedMessage
       // print(selectedMessage)
        //if(selectedMessage != nil){
        //layout.caption = selectedMessage?.summaryText
       // }
        //layout.caption = encryptedText.text
        
        
        //message.layout = layout
        func composeMessage(userInputT: String?) -> MSMessage?{
            var components = URLComponents()
            
            guard let decodedCaption = userInputT else{return nil}
            let caption = URLQueryItem(name: "caption", value: decodedCaption)
            
            let layout = MSMessageTemplateLayout()
            
            components.queryItems = [caption]
            
            
            let message = MSMessage()
            
            message.url = components.url!
            layout.caption = decodedCaption
            message.layout = layout
            
            
            return message
        }
        

        let messageReceived = activeConversation?.selectedMessage
        if(activeConversation?.selectedMessage != nil){
            //activeConversation?.insert(composeMessage(userInputT: (messageReceived?).url,completionHandler: nil)!
            let x =  messageReceived?.url?.absoluteString.decodeUrl()
            let xy = x!.substring(from: 9)
            
            encryptedText.text = encryptText(message: String(xy), shift: 3)
            
            /////////////////////messageReceived.
        } else{
            encryptedText.text = encryptText(message: encryptedText.text!, shift: 3);
        }
        
        activeConversation?.insert(composeMessage(userInputT: encryptedText.text)!, completionHandler: nil)
        
        
        //activeConversation?.selectedMessage?.
    }
    
    //override var activeConversation: MSConversation?

    
    func didSelect(message: MSMessage, conversation: MSConversation) {
        print("didSelectFired")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        
        // Use this method to configure the extension and restore previously stored state.
    }
    
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dismisses the extension, changes to a different
        // conversation or quits Messages.
        
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.

        
        
        // Use this method to trigger UI updates in response to the message.
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }

}
