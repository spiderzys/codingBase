



import UIKit

protocol ViewModelBinded:UIViewController {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType? {get set}
  
}



protocol ScrollableViewControllerProtocol: UIViewController {
    
    func observeKeyboardNotification()
    func keyboardWillShow(_ notification: NSNotification)
    func keyboardWillHide(_ notification: NSNotification)
    
}

