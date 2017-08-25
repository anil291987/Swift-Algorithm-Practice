//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
func findGreatestValueInList(list: [Int])-> Int?{
    if list.count == 0 {
        return nil
    }
    var greatestValue = -1
    for number in list {
        if number > greatestValue {
            greatestValue = number
        }
    }
    return greatestValue
}
//findGreatestValueInList(list: [1,2,3,10,2,200,202])
//findGreatestValueInList(list: [-3,-2,-1,0,1,2,100])
[1,2,3].max()


// Top 3 ways to best Handle Optionals
class MyViewController: UIViewController {
    let redLabel: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.backgroundColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    let blueLabel: UILabel = {
        let label = UILabel()
        label.text = "4"
        label.backgroundColor = .blue
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    let winnerLabel: UILabel = {
        let label = UILabel()
        label.text = "Who won?"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Roll Dices", style: .plain, target: self, action: #selector(handleRollDices))
        
        //lets make our views using UIStackView
        let arrangedSubviews  = [redLabel, blueLabel]
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        
        stackView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 12).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(winnerLabel)
        
    NSLayoutConstraint.activate([winnerLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 12),winnerLabel.widthAnchor.constraint(equalTo: view.widthAnchor),winnerLabel.heightAnchor.constraint(equalToConstant:24)])
    }
    @objc func handleRollDices() {
        let redValue = arc4random_uniform(6) + 1
        redLabel.text = "\(redValue)"
        
        let blueValue = arc4random_uniform(6) + 1
        blueLabel.text = "\(blueValue)"
        
//        redLabel.text =  nil
        blueLabel.text = nil
        evaluateWinner()
    }
    fileprivate func evaluateWinner(){
        winnerLabel.text = "Figuring out who won...."
        
//            guard let redText = redLabel.text else {
//                winnerLabel.text = "Red Value invalid"
//                return
//            }
//            guard let blueText = blueLabel.text else {
//                winnerLabel.text = "Blue Value invalid"
//
//                return
//            }
        guard let redText = redLabel.text, let blueText = blueLabel.text else {
            winnerLabel.text = "Values are invalid"
            return
        }
            if redText == blueText {
                winnerLabel.text = "Tie"
            }else if redText > blueText{
                winnerLabel.text = "Red Won"
            }else{
                winnerLabel.text = "Blue Text"
            }
//        if blueLabel.text == redLabel.text {
//            winnerLabel.text = "Tie"
//        }else if blueLabel.text! > redLabel.text!{
//            winnerLabel.text = "Blue won"
//        }else{
//            winnerLabel.text = "Red won"
//        }
    }
    
    
}
PlaygroundPage.current.liveView = UINavigationController(rootViewController: MyViewController())
