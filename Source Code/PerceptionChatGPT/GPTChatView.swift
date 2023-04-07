//
//  ContentView.swift
//  PerceptionChatGPT
//
//  Created by Perception on 07/04/2023.
//

import SwiftUI
import Combine

struct GPTChatView: View {
    
    @State private var chatMessages :[ChatMessage] = [] //ChatMessage.sampleMessage
    @State var tfValue  = ""
    @State var didStartEditing = false
    @State var isReturn = false
    @State var showGroupInfo = false
    @State var textHeight: CGFloat = 0
    var textFieldHeight: CGFloat {
        let minHeight: CGFloat = 20
        let maxHeight: CGFloat = 150
        
        if textHeight < minHeight {
            return minHeight
        }
        
        if textHeight > maxHeight {
            return maxHeight
        }
        
        return textHeight
    }
    @State var isWait  = false
    
    let openAIVM = OpenAIViewModel()
    @State var cancellable  = Set<AnyCancellable>()
    
    var body: some View {
        VStack {
            
            
            LotteView(title: "lets-chat")
                .scaleEffect(0.2)
                .offset(y: 0)
                .frame(width: 200,height: 100)
                .padding(.bottom,80)
            
            ScrollView(showsIndicators: false){
                LazyVStack{
             
                    ForEach(chatMessages,id:\.id){ msg in
                        chatView(Message: msg)
                    }
                    if isWait{
                        LotteView(title: "loading")
                            .scaleEffect(0.2)
                            .offset(y: 0)
                            .frame(width: 80,height: 40)
                            .padding(.bottom,80)
                    }
                    
                
                }
            }
            .padding(.horizontal)
            
            
            Spacer()
            
            HStack{
                TextView(text: $tfValue, didStartEditing: $didStartEditing, height: $textHeight, isReturn: $isReturn, placeHolder: "SEND MESSAGE")
                    .onTapGesture {
                        didStartEditing = true
                    }
                    .frame(height: self.textHeight + 5)
                    .padding(.horizontal,5)
                    .padding(.vertical,3)
                    .background(RoundedRectangle(cornerRadius: 12)
                        .fill(Color("Gray")))
                
                Image(systemName: "paperplane.fill")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(){
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color("purple"))
                            .frame(width: 40, height: 40 , alignment: .center)
                    }
                    .onTapGesture {
                        sendMessage()
                    }
            }
            .padding(.horizontal,4)
            .background(){
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray,lineWidth: 1)
            }
        }
       
        .padding()
    }
    
    @ViewBuilder
    func chatView(Message: ChatMessage) -> some View{
        
        
        HStack(alignment:.top){
            if Message.sender == .me {Spacer()}
          
            if Message.sender == .gpt{
            Image("chatgpt")
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 30)
        }
            Text(Message.content)
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .padding(.vertical,10)
                .padding(.horizontal)
                .background(){
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Message.sender == .me ? Color.accentColor : Color("green"))
                }
            if Message.sender == .me{
            Image("logo")
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 30)
        }
            if Message.sender == .gpt {Spacer()}
    }
    }
    
    func sendMessage(){
        isWait.toggle()
        let myMsg = ChatMessage(id: UUID().uuidString, content: tfValue, dateCreated: Date(), sender: .me)
        
        self.chatMessages.append(myMsg)
        
        openAIVM.sendMessage(message: tfValue).sink { completion in
            //error
        } receiveValue: { response in
            guard let txt = response.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\""))) else{return}
            let gptMsg = ChatMessage(id: response.id, content: txt, dateCreated: Date(), sender: .gpt)
            self.chatMessages.append(gptMsg)
            isWait.toggle()
        }
        .store(in: &cancellable)

        tfValue = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GPTChatView()
    }
}
