//
//  TextView.swift
//  GoalBate
//
//  Created by Syed ShahRukh Haider on 17/06/2021.
//

import SwiftUI
import Combine
import Foundation
import SwiftUI

struct TextView: UIViewRepresentable{
    @Binding var text: String
    @Binding var didStartEditing: Bool
    @Binding var height: CGFloat
    @Binding var isReturn: Bool
    var placeHolder:String
    var textCustomColor = UIColor.black
    var placeholderCustomColor = UIColor.gray
   //
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        
        textView.isScrollEnabled = true
        textView.alwaysBounceVertical = false
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        
        textView.text = text
        textView.backgroundColor = UIColor.clear
        textView.textColor = textCustomColor
        textView.font = UIFont(name: "", size: 18)
        
        context.coordinator.textView = textView
        textView.delegate = context.coordinator
        textView.layoutManager.delegate = context.coordinator

        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        
        if didStartEditing {
      
          
                uiView.textColor = textCustomColor //UIColor(Color("Pink"))
                uiView.text = text
       
      
              }
              else {
                  uiView.text = placeHolder
                  if text.isEmpty{
                  uiView.textColor = placeholderCustomColor
                  }else{
                      uiView.textColor = textCustomColor
                  }
              }
      
              uiView.font = UIFont.preferredFont(forTextStyle: .caption1)
              uiView.delegate = context.coordinator
              uiView.layoutManager.delegate = context.coordinator
    }

    
    func makeCoordinator() -> Coordinator {
        return Coordinator(dynamicSizeTextField: self)
    }
}

class Coordinator: NSObject, UITextViewDelegate, NSLayoutManagerDelegate {
    
    var dynamicHeightTextField: TextView
    
    weak var textView: UITextView?

    
    init(dynamicSizeTextField: TextView) {
        self.dynamicHeightTextField = dynamicSizeTextField
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.dynamicHeightTextField.text = textView.text
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
//            textView.resignFirstResponder()
            textView.text = textView.text + "\n"
            self.dynamicHeightTextField.text = textView.text
            return false
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
       
        self.dynamicHeightTextField.isReturn.toggle()
    }
    
    func layoutManager(_ layoutManager: NSLayoutManager, didCompleteLayoutFor textContainer: NSTextContainer?, atEnd layoutFinishedFlag: Bool) {
        
        DispatchQueue.main.async { [weak self] in
            guard let textView = self?.textView else {
                return
            }
            let size = textView.sizeThatFits(textView.bounds.size)
            
            if self?.dynamicHeightTextField.height != size.height {
                self?.dynamicHeightTextField.height = size.height - 7.5
            }
        }

    }
}
