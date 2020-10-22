# BottomAccountsListView
List button for third party accounts. 
It's only code that helps me or someone how to construct the best code. Maybe it's not perfect. But for me, it is a good solution for my purpose that easily brings this one to another project.

Give me a "<b>Start<\b>" if you arrge with that.

### How to use

```swift

class ViewController: UIViewController {

    let listView: AccountHorizontalListView = {
        return AccountHorizontalListView(items: [
            ("iCloud", UIImage.add),
            ("Google", UIImage.add),
            ("Yahoo", UIImage.add),
            ("Facebook", UIImage.add),
            ("LinkedIn", UIImage.add),
            ("Apple", UIImage.add),
            ("iCloud", UIImage.add),
            ("iCloud", UIImage.add)
        ])
    }()
    
    override func loadView() {
        super.loadView()
        
        self.view.addSubview(listView)
        self.listView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[v]-0-|", options: [], metrics: nil, views: ["v": listView]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v(80)]-0-|", options: [], metrics: nil, views: ["v": listView]))
        
        // Action
        self.listView.didTabOnChange = { index in
            print("didTabOnChange:", index)
        }
    }
}

```

# Demo
<img src="https://github.com/onebuffer/BottomAccountsListView/blob/main/Resources/Screen%20Shot%202020-10-22%20at%209.50.53%20AM.png" width="100%">
<img src="https://github.com/onebuffer/BottomAccountsListView/blob/main/Resources/Screen%20Shot%202020-10-22%20at%209.50.45%20AM.png" width="30%">

## Contact
- Email: caophuocthanh@gmail.com
- Site: https://onebuffer.com
- Linkedin: https://www.linkedin.com/in/caophuocthanh/
