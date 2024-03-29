import Charts
import SwiftUI

struct LineChart : NSViewRepresentable {
    
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
        let ds1 = LineChartDataSet(entries: entries, label: "Yearly Sales")
        ds1.colors = [NSUIColor.red]
        ds1.circleColors = [NSColor.init(red: 133 / 255, green: 194 / 255, blue: 39 / 255, alpha: 0.93)]

        data.addDataSet(ds1)

        return data
    }
    
    func formatLeftAxis(leftAxis: YAxis){
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: formatter)
    }
    
    func formatXAxis(xAxis: XAxis){
        xAxis.valueFormatter = IndexAxisValueFormatter(values: YearlyRevenueTransaction.months)
        xAxis.labelPosition = .bottom
    }

    func formatLegend(legend:Legend){
//        legend.horizontalAlignment = .right
//        legend.verticalAlignment = .top
//        legend.drawInside = true
//        legend.yOffset = 30.0
    }
}



//struct LineChart_Previews: PreviewProvider {
//    static var previews: some View {
////        LineChart(entries: RevenueTransaction.dataEntriesForDay(22, transactions: RevenueTransaction.allTransactions), entries2: RevenueTransaction.dataEntriesForDay(22, transactions: RevenueTransaction.allTransactions))
//    }
//}
