import Charts
import SwiftUI

struct PieChart: NSViewRepresentable {


    var entries : [PieChartDataEntry]

    typealias NSViewType = PieChartView
    var colors: [Color] = [.yellow, .purple, .green, .blue]
    let chart = PieChartView()

    func makeNSView(context: Context) -> NSViewType {
        chart.delegate = context.coordinator
        chart.data = addData()
        return chart
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    class Coordinator: NSObject, ChartViewDelegate {
        var parent: PieChart
        init(parent: PieChart) {
            self.parent = parent
        }
        func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
            let labelText = entry.value(forKey: "label")! as! String
            let num = Int(entry.value(forKey: "value")! as! Double)
            parent.chart.centerText = """
                                         \(labelText)
                                         \(num)% of Customers
                                         """
        }
    }

    func configureChart( _ pieChart: PieChartView) {
        pieChart.rotationEnabled = false
        pieChart.animate(xAxisDuration: 0.5, easingOption: .easeInOutCirc)
//        pieChart.drawEntryLabelsEnabled = false
        pieChart.highlightValue(x: -1, dataSetIndex: 0, callDelegate: false)
    }

    func updateNSView(_ nsView: NSViewType, context: Context) {
        nsView.data = addData()
        let paragraphStyle: NSMutableParagraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.alignment = .center
        let centerText: NSMutableAttributedString = NSMutableAttributedString(string: "Discount types:")

        nsView.centerAttributedText = centerText
        nsView.chartDescription?.text = ""
        configureChart(nsView)
        formatLegend(legend: nsView.legend)
        formatCenter(nsView)
//        formatDescription(nsView.chartDescription)
    }

    func formatDataSet(_ dataSet: ChartDataSet) {
        dataSet.drawValuesEnabled = false
    }

    func formatCenter(_ pieChart: PieChartView) {
//        pieChart.holeColor = Color.
//        pieChart.centerText = category.rawValue.capitalized
        pieChart.centerTextRadiusPercent = 0.95
    }

    func formatDescription( _ description: Description) {
//        description.text = category.rawValue.capitalized
        description.font = NSFont.boldSystemFont(ofSize: 17)
    }

    func addData() -> PieChartData{
        let data = PieChartData()
        let ds1 = PieChartDataSet(entries: entries, label: "")
        ds1.colors = ChartColorTemplates.material()
        formatDataSet(ds1)
        data.addDataSet(ds1)
        return data
    }

    func formatLegend(legend:Legend){
        legend.horizontalAlignment = .right
        legend.verticalAlignment = .top
    }
}
