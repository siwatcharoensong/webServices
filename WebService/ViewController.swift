import UIKit

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView:UITableView!
    
    
    var dataString:[Any]?
    
    var jsonArr:[Dictionary] = [Dictionary <String, AnyObject>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setData()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.jsonArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let data = jsonArr[indexPath.row]
        cell.setValue(data: data)
        
        return cell
    }
    
    func setData()
    {
        let webUrlName = URL(string: "http://test.systemme.com/apilist.php")
        let session = URLSession.shared
        var url = URLRequest(url: webUrlName!)
        
        let task = session.dataTask(with: url) { (data, resp, error) in
            guard error == nil && data != nil else
            {
                print("connection error or data is nill")
                return
            }
            do  {
                self.dataString = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as?                                                                      [Any]
                
                for data in self.dataString!
                {
                    let json = data as? Dictionary <String, AnyObject>
                    self.jsonArr.append(json!)
                }
                print(self.jsonArr)
            }catch {
                print("error")
            }
        }
        self.tableView.reloadData()
        task.resume()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
