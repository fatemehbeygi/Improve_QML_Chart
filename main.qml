import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtCharts 2.0

Window {
    width: 1024
    height: 600
    visible: true
    title: qsTr("Hello World")

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 26

        ChartView{
            id: chart
            Layout.fillWidth: true
            Layout.fillHeight: true

            LineSeries{
                id: lineSerie
            }
        }
        Button{
            Layout.alignment: Qt.AlignRight
            text: "Generate"
            onClicked: {
                databuilder.paintChart(lineSerie, 100000)
            }
        }
    }
}
