//
//  ViewController.swift
//  uiimage_from_url


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var image_element: UIImageView!

    enum ErrorHandling:ErrorType
    {
        case NetworkError
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        load_image("https://github.com/jyazdani/store-maps/blob/master/guide-austin-465-1.png?raw=true")
    }

    func load_image(urlString:String)
    {
        let imgURL: NSURL = NSURL(string: urlString)!
        let request: NSURLRequest = NSURLRequest(URL: imgURL)
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request){
            (data, response, error) -> Void in
            
            if (error == nil && data != nil)
            {
                func display_image()
                {
                    self.image_element.image = UIImage(data: data!)
                }
            
                dispatch_async(dispatch_get_main_queue(), display_image)
            }
   
        }
        
        task.resume()
    }


}

