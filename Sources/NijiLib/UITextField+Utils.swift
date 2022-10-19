//
//  UITextField+Utils.swift
//

#if !os(macOS)
import Foundation
import UIKit

/// Utility extension for `UITextField`.
public extension UITextField {
    func addDoneButtonInputView(primaryColor: UIColor = UIColor.darkGray,
                                secondaryColor: UIColor = UIColor.white) {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        toolbar.barStyle = .default
        toolbar.barTintColor = primaryColor
        toolbar.tintColor = secondaryColor
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .done, target: target, action: #selector(doneButtonAction))
        ]
        inputAccessoryView = toolbar
    }
    
    @objc private func doneButtonAction() {
        resignFirstResponder()
    }
    
    func addDatePickerInputView<T>(target: T,
                                   selector: Selector,
                                   minimumDate: Date? = nil,
                                   maximumDate: Date? = nil) {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        toolbar.barStyle = .default
        toolbar.barTintColor = primaryColor
        toolbar.tintColor = secondaryColor
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .done, target: target, action: selector)
        ]
        inputAccessoryView = toolbar
        
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 216))
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        if let date = minimumDate {
            datePicker.minimumDate = date
        }
        if let date = maximumDate {
            datePicker.maximumDate = date
        }
        inputView = datePicker
    }
}
#endif
