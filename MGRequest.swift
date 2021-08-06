//  MAGRAF Studio
//  https://magraf.fr
//  contact@magraf.fr

class MGRequest: UIViewController {
   
    
    func MGSetRequestApi(endpoint: String, parameters: [[String: String]], MGSetAction: Int) -> String {
        var setReturn: String!
        
        let semaphore = DispatchSemaphore (value: 0)
        
				var MGGetParam: String! = ""
        
        for gate in parameters {
            
            for (key, value) in gate {
                let myParam = key + "=" + value + "&"
                MGGetParam.append(contentsOf: myParam)
            }
        }
        
        let postData =  MGGetParam.data(using: .utf8)

        var request = URLRequest(url: URL(string: endpoint)!,timeoutInterval: 50000)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                        print(String(describing: error))
                        semaphore.signal()
                        return
                }
                print(String(data: data, encoding: .utf8)!)
                setReturn = String(data: data, encoding: .utf8)!
								
            DispatchQueue.main.async {
                self.MGRequestAction(MGGetIdRq: MGSetAction, MGGetData: setReturn)
            }
            semaphore.signal()

        }

        task.resume()
        semaphore.wait()
        return setReturn
    }
    
    
    
    func MGRequestAction(MGGetIdRq: Int, MGGetData: String) {
		
        switch MGGetIdRq {
            case 1:
            		// Do something here
        		case 2:
            		// Do something else here
       			case 3:
            		// Do something else here again
        		default:
            		print("Set default action");
        }
        
    }
