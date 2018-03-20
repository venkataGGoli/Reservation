//
//  ReservationViewController.swift
//  MassageReservation
//
//  Created by venkatagovardhan on 3/19/18.
//  Copyright © 2018 venkatagovardhan. All rights reserved.
//

import UIKit

class ReservationViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var Reservebutton: UIButton!
    @IBOutlet weak var Reservelabel: UILabel!
    @IBOutlet weak var SelectedDate: UILabel!
    @IBOutlet weak var donebutton: UIButton!
    @IBOutlet weak var Pickdate: UIDatePicker!
    @IBOutlet weak var viewcollection: UICollectionView!
    var selectedtime: String = ""
    let dateArray = ["09:00 AM","10:00 AM","11:00 AM","12:00 PM","01:00 PM","02:00 PM","03:00 PM","04:00 PM","05:00 PM","06:00 PM","07:00 PM","08:00 PM"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dateArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "datecollection", for: indexPath) as! CollectionViewCell
        cell.datelabel.text = dateArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        selectedtime =  dateArray[indexPath.row]
        Reservebutton.isHidden = false
        Reservelabel.isHidden = true
        donebutton.isHidden = true
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Pickdate.isHidden = true
        Reservebutton.isHidden = true
        Reservelabel.isHidden = false
        viewcollection.isHidden = true
        donebutton.isHidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func CalendarButtonAction(_ sender: Any) {
        Pickdate.minimumDate = NSDate() as Date
        
        Pickdate.isHidden = false
        viewcollection.isHidden = true
        Reservebutton.isHidden = true
        Reservelabel.isHidden = true
        donebutton.isHidden = false
        
    }
    
    
    
    @IBAction func DoneAction(_ sender: Any) {
        
       let dateformat =  DateFormatter()
    dateformat.dateFormat = "EEEE, MMM d, yyyy"
        
        
        SelectedDate.text = dateformat.string(from: Pickdate.date)
        
        Pickdate.isHidden = true
        viewcollection.isHidden = false
        Reservebutton.isHidden = true
        Reservelabel.isHidden = false
        
    }
    
   
    
    
    @IBAction func ReserveButtonAction(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "viewcontroller") as! ViewController
        self.present(nextViewController, animated:true, completion:nil)
        
    
        //mainViewController.timeview.text = selectedtime
        nextViewController.dateview = SelectedDate
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

