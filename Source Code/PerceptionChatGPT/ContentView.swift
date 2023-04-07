//
//  ContentView.swift
//  PerceptionChatGPT
//
//  Created by Perception on 07/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State var tfValue  = ""
    var body: some View {
        VStack {
            
            
            LotteView()
                .scaleEffect(0.2)
                .offset(y: 0)
                .frame(width: 200,height: 100)
                .padding(.bottom,80)
            
            ScrollView{
                LazyVStack{
                    HStack(alignment:.top){
                    Image("logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                    
                    Text("Hello, world!")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(){
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.accentColor)
                            }
                        Spacer()
                }
                    
                    HStack(alignment:.top){
                        Spacer()
                    
                    Text("""
Why do we use it?
                         It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).


                         Where does it come from?
                         Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

                         The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.

                         Where can I get some?
                         There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.

""")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(){
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("green"))
                            }
                        Image("chatgpt")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                }
                }
            }
           
            
            
            Spacer()
            
            HStack{
                TextField("Enter your Message", text: $tfValue)
                
                Image(systemName: "paperplane.fill")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .background(){
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color("purple"))
                            .frame(width: 40, height: 40 , alignment: .center)
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
