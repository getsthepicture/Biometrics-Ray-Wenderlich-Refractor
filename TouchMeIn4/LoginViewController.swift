/// Copyright (c) 2017 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit
import CoreData

class LoginViewController: UIViewController {

  // MARK: Properties
  var managedObjectContext: NSManagedObjectContext?
  //constant strings used as username and password for this example
  let usernameKey = "Batman"
  let passwordKey = "Hello Bruce!"

  // MARK: - IBOutlets
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var createInfoLabel: UILabel!  

  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
}
//currious to know why this is in an extension.......
// MARK: - IBActions
extension LoginViewController {

  @IBAction func loginAction(sender: Any) {
    
    guard let username = usernameTextField.text else {
      print("no username was entered in the textfield")
      return
    }
    guard let password = passwordTextField.text else {
      print("no password was entered in the textfield")
      return
    }
    if checkLogin(username: username, password: password){
      performSegue(withIdentifier: "dismissLogin", sender: self)
    } else {
      let alertController = UIAlertController.init(title: "Wait! Something's Wrong!", message: "Security Feature 2.7", preferredStyle: .alert)
      let alert = UIAlertAction.init(title: "Retry", style: .cancel, handler: nil)
      alertController.addAction(alert)
      self.present(alertController, animated: true, completion: nil)
    }
  }
  
  func checkLogin(username: String, password: String) -> Bool {
    if username == usernameKey && password == passwordKey{
      return true
    } else {
      return false
    }
  //  return username == usernameKey && password == passwordKey
    //I like how this is simple and one clean line of code
  }
  
  
}
