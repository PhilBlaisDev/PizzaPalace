import Charts
import SwiftUI

struct CxVisitsLineChart : NSViewRepresentable {
    
    var entries : [ChartDataEntry]
    typealias NSViewType = LineChartView

    func makeNSView(context: Context) -> NSViewType {
        let chart = LineChartView()
        chart.data = addData()
        return chart
    }

    func updateNSView(_ nsView: NSViewType, context: Context) {
        nsView.data = addData()
        nsView.rightAxis.enabled = false
        formatLeftAxis(leftAxis: nsView.leftAxis)
        formatXAxis(xAxis: nsView.xAxis)
        formatLegend(legend: nsView.legend)

        nsView.chartDescription?.text = ""
        nsView.gridBackgroundColor = NSUIColor.white
        nsView.notifyDataSetChanged()
    }

    func addData() -> LineChartData{
        let data = LineChartData()
        let ds1 = LineChartDataSet(entries: entries, label: "Customer Visits")
        ds1.colors = [NSUIColor.red]
        ds1.circleColors = [NSColor.init(red: 133 / 255, green: 194 / 255, blue: 39 / 255, alpha: 0.93)]

        data.addDataSet(ds1)

        return data
    }
    
    func formatLeftAxis(leftAxis: YAxis){
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: formatter)
    }

    func formatXAxis(xAxis: XAxis){
        xAxis.valueFormatter = IndexAxisValueFormatter(values: RevenueTransaction.time)
        xAxis.labelPosition = .bottom
//        xAxis.axisMinimum = 0
    }

    func formatLegend(legend:Legend){

    }
}