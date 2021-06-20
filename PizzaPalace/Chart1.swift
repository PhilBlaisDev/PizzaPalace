import Charts
import SwiftUI

struct Chart1 : NSViewRepresentable {
    //Bar chart accepts data as array of BarChartDataEntry objects
    var entries : [BarChartDataEntry]
    var entries2 : [BarChartDataEntry]

    typealias NSViewType = BarChartView

    func makeNSView(context: Context) -> NSViewType {
        let chart = BarChartView()
        //it is convenient to form chart data in a separate func
        chart.data = addData()
        return chart
    }

    func updateNSView(_ nsView: NSViewType, context: Context) {
        nsView.data = addData()
        nsView.rightAxis.enabled = false
        if nsView.scaleX == 1.0 {
            nsView.zoom(scaleX: 1.5, scaleY: 1, x: 0, y: 0)
        }
        nsView.setScaleEnabled(false)
        formatLeftAxis(leftAxis: nsView.leftAxis)
        formatXAxis(xAxis: nsView.xAxis)
        formatLegend(legend: nsView.legend)

        let barWidth = 0.1
        let barSpace = 0.0
        let groupSpace = 0.05
        (nsView.data as! BarChartData).barWidth = barWidth
        nsView.xAxis.axisMinimum = Double(RevenueTransaction.allTransactions[0].amount)
        nsView.xAxis.axisMaximum = Double(RevenueTransaction.allTransactions[0].amount) + (nsView.data as! BarChartData).groupWidth(groupSpace: groupSpace, barSpace: barSpace) * Double(RevenueTransaction.allTransactions.count)
        // (0.4 + 0.05) * 2 (data set count) + 0.1 = 1
        (nsView.data as! BarChartData).groupBars(fromX: Double(RevenueTransaction.allTransactions[0].amount), groupSpace: groupSpace, barSpace: barSpace)

        nsView.gridBackgroundColor = NSUIColor.white
        nsView.notifyDataSetChanged()
    }

    func addData() -> BarChartData{
        let data = BarChartData()

        let formatter = NumberFormatter()
        formatter.numberStyle = .none

        let dataSet = BarChartDataSet(entries: entries, label: "Revenue")
        dataSet.colors = [NSColor.init(red: 133 / 255, green: 194 / 255, blue: 39 / 255, alpha: 0.93)]
        dataSet.label = "Revenue"
        dataSet.stackLabels = ["Revenue"]
        dataSet.valueFormatter = DefaultValueFormatter(formatter: formatter)

        let dataSet2 = BarChartDataSet(entries: entries2, label: "Cost")
        dataSet2.colors = [NSUIColor.red]
        dataSet2.label = "Staff Cost"
        dataSet2.stackLabels = ["Staff Cost"]
        dataSet2.valueFormatter = DefaultValueFormatter(formatter: formatter)

        data.dataSets.append(dataSet)
        data.dataSets.append(dataSet2)

        return data
    }
    
    func formatLeftAxis(leftAxis: YAxis){
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: formatter)
//        print("Legend = \(RevenueTransaction.formatForLeftSideLegend())")
//        leftAxis.valueFormatter = IndexAxisValueFormatter(values: RevenueTransaction.formatForLeftSideLegend())

    }
    
    func formatXAxis(xAxis: XAxis){
        xAxis.valueFormatter = IndexAxisValueFormatter(values: RevenueTransaction.time)
        xAxis.labelPosition = .bottom
//        xAxis.axisMinimum = 0
    }

    func formatLegend(legend:Legend){
//        legend.horizontalAlignment = .right
//        legend.verticalAlignment = .top
//        legend.drawInside = true
//        legend.yOffset = 30.0
    }
}



struct Chart1_Previews: PreviewProvider {
    static var previews: some View {
        Chart1(entries: RevenueTransaction.dataEntriesForDay(22, transactions: RevenueTransaction.allTransactions), entries2: RevenueTransaction.dataEntriesForDay(22, transactions: RevenueTransaction.allTransactions))
    }
}
