//
//  ViewController.swift
//  projectSliderCard
//
//  Created by Saloni Agarwal on 19/06/21.
//

import UIKit
import CardSlider

struct Item: CardSliderItem {
    var image: UIImage
    var rating: Int?
    var title: String
    var subtitle: String?
    var description: String?
    
    
}

class ViewController: UIViewController,CardSliderDataSource {
    
    var cardData = [Item]()
    
    func item(for index: Int) -> CardSliderItem {
        cardData[index]
    }
    
    func numberOfItems() -> Int {
        cardData.count
    }
    

    @IBOutlet weak var myButton: UIButton!
    
    @IBAction func didTabButton(_ sender: Any) {
        
        //initialise cardSlider
        let vc = CardSliderViewController.with(dataSource: self)
        vc.title = "Welcome!"
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        APIManager.shared.getData { [self] data in
           
            //to set Image in card..
            var i = 0;
            for items in data!{
                i = i + 1;
                if( i > 3){
                    i = 1;
                }
                
                //add data in card
                cardData.append(Item(image: UIImage(named: "\(i)")!, rating: nil, title: "Card \(items.id!)", subtitle: items.text!, description: ""))
            }
            
        }
    }


}

