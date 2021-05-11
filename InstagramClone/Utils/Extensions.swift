//
//  Extensions.swift
//  InstagramClone
//
//  Created by bogdanov on 11.05.21.
//

import UIKit

extension UIApplication {
    func endEditing()  {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
