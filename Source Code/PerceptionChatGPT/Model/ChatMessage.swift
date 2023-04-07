//
//  ChatMessage.swift
//  PerceptionChatGPT
//
//  Created by Perception on 08/04/2023.
//

import Foundation


struct ChatMessage{
    let id : String
    let content : String
    let dateCreated: Date
    let sender : MessageSender
}


enum MessageSender{
    case me
    case gpt
}


extension ChatMessage{
    static let sampleMessage = [
        ChatMessage(id: UUID().uuidString, content: "Hello!", dateCreated: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a", dateCreated: Date(), sender: .gpt),
        ChatMessage(id: UUID().uuidString, content: "tell me more", dateCreated: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).", dateCreated: Date(), sender: .gpt)
    ]
}
