//
//  ViewController.swift
//  ChartsVisibleXRangeMax
//
//  Created by Derek Fong on 2017-01-02.
//  Copyright © 2017 Subtitle Designs Inc. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var chartView: LineChartView!
    
    // number of random data points to generate
    let dataPoints: Int = 10
    
    // max number of values we'll show in viewport
    let maxValuesInViewport: Double = 4.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        chartView.scaleXEnabled = false
        chartView.scaleYEnabled = false
        chartView.pinchZoomEnabled = false
        chartView.doubleTapToZoomEnabled = false

        var values: [ChartDataEntry] = [ChartDataEntry]()
        
        for i in 0 ..< dataPoints {
            let value = arc4random_uniform(UInt32(500))
            values.append(ChartDataEntry(x: Double(i), y: Double(value)))
        }

        let set: LineChartDataSet = LineChartDataSet(values: values, label: nil)
        set.axisDependency = .left
        
        var dataSets: [LineChartDataSet] = [LineChartDataSet]()
        dataSets.append(set)
        
        let data = LineChartData(dataSets: dataSets)
        chartView.data = data
        
        if values.count > Int(maxValuesInViewport) {
            chartView.setVisibleXRangeMaximum(maxValuesInViewport)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

