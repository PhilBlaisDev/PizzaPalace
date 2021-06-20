import Charts
import SwiftUI

struct LineChart : NSViewRepresentable {
    
    var entries : [ChartDataEntry]
    typealias NSViewType = LineChartView

    func makeNSView(context: Context) -> NSViewType {
        let chart = LineChartView()
        //it is convenient to form chart data in a separate func
        chart.data = addData()
        return chart
    }

    func updateNSView(_ nsView: NSViewType, context: Context) {
        nsView.data = addData()
        nsView.rightAxis.enabled = false
        formatLeftAxis(leftAxis: nsView.leftAxis)
        formatXAxis(xAxis: nsView.xAxis)
        formatLegend(legend: nsView.legend)


        nsView.chartDescription?.text = "Linechart Demo"
        nsView.gridBackgroundColor = NSUIColor.white
        nsView.notifyDataSetChanged()
    }

    func addData() -> LineChartData{
//        let ys1 = Array(1..<10).map { x in return sin(Double(x) / 2.0 / 3.141 * 1.5) }
//        let ys2 = Array(1..<10).map { x in return cos(Double(x) / 2.0 / 3.141) }
//
//        let yse1 = ys1.enumerated().map { x, y in return ChartDataEntry(x: Double(x), y: y) }
//        let yse2 = ys2.enumerated().map { x, y in return ChartDataEntry(x: Double(x), y: y) }
        
        let data = LineChartData()
        let ds1 = LineChartDataSet(entries: entries, label: "Yearly Sales")
        ds1.colors = [NSUIColor.red]
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
