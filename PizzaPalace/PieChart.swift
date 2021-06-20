import Charts
import SwiftUI

struct PieChart: NSViewRepresentable {

    typealias NSViewType = PieChartView
    private var colors: [Color] = [.yellow, .purple, .green]

    func makeNSView(context: Context) -> NSViewType {
        let chart = PieChartView()
        //it is convenient to form chart data in a separate func
        chart.data = addData()
        return chart
    }

    func updateNSView(_ nsView: NSViewType, context: Context) {
        nsView.data = addData()

        let paragraphStyle: NSMutableParagraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.alignment = .center
        let centerText: NSMutableAttributedString = NSMutableAttributedString(string: "CLDP")

        nsView.centerAttributedText = centerText
        nsView.chartDescription?.text = "CLDP Report"
    }

    func addData() -> PieChartData{
        let data = PieChartData()
        let ys1 = Array(1..<4).map { x in return sin(Double(x) / 2.0 / 3.141 * 1.5) * 100.0 }
        let yse1 = ys1.enumerated().map { x, y in return PieChartDataEntry(value: y, label: String(x)) }
        let ds1 = PieChartDataSet(entries: yse1, label: "")
        ds1.colors = ChartColorTemplates.material()
        data.addDataSet(ds1)
        return data
    }
}
