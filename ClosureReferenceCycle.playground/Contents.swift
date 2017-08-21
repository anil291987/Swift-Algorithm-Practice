//: Playground - noun: a place where people can play

class HTMLElement {
    let name: String
    let text: String
    
    lazy var asHTML: () -> String = { [weak self] in
        guard let this = self else { return ""}
        return "<\(this.name)>\(this.text)</\(this.name)>"
    }
    
    init(name: String, text: String) {
        self.name = name
        self.text = text
    }
    deinit {
         print("HTMLElement \(name) is being deallocatted")
    }
}

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "some simple paragraph body text")
paragraph?.asHTML() // <p>some simple paragraph body text</p>
paragraph = nil

