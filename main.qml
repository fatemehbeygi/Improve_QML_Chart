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

    property int pointsNo : 1000

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 26

        ChartView{
            id: chart
            Layout.fillWidth: true
            Layout.fillHeight: true

            LineSeries{
                id: lineSerie
                axisX: ValueAxis{
                    id: vAxisX
                }
                axisY: ValueAxis{
                    id: vAxisY
                }
            }

            RowLayout{
                anchors.right: parent.right
                anchors.bottom: parent.bottom

                Rectangle{
                    Layout.preferredWidth: 28
                    Layout.preferredHeight: width
                    radius: width/2
                    color: "Cyan"
                    ToolButton{
                        anchors.fill: parent
                        text: "⟳"
                        font.pointSize: 20
                        onClicked: {
                            vAxisX.min = 0
                            vAxisX.max = pointsNo
                        }
                    }
                }
                Rectangle{
                    Layout.preferredWidth: 28
                    Layout.preferredHeight: width
                    radius: width/2
                    color: "Cyan"
                    ToolButton{
                        anchors.fill: parent
                        text: "-"
                        font.pointSize: 20
                        onClicked: {
                            if(lineSerie.count == 0)
                                return
                            vAxisX.min = 0
                            vAxisX.max = Math.max(vAxisX.max + 0.1 * vAxisX.max, 10)
                        }
                    }
                }
                Rectangle{
                    Layout.preferredWidth: 28
                    Layout.preferredHeight: width
                    radius: width/2
                    color: "Cyan"
                    ToolButton{
                        anchors.fill: parent
                        text: "+"
                        font.pointSize: 20
                        onClicked: {
                            if(lineSerie.count == 0)
                                return
                            vAxisX.min = 0
                            vAxisX.max = vAxisX.max - 0.1 * vAxisX.max
                        }
                    }
                }
            }

            ColumnLayout{
                x: 0
                y: parent.plotArea.y

                Rectangle{
                    Layout.preferredWidth: 28
                    Layout.preferredHeight: width
                    radius: width/2
                    color: "Cyan"
                    ToolButton{
                        anchors.fill: parent
                        text: "+"
                        font.pointSize: 20
                        onClicked: {
                            if(lineSerie.count == 0)
                                return
                            vAxisY.min = 0
                            vAxisY.max = vAxisY.max - 0.1 * vAxisY.max
                        }
                    }
                }
                Rectangle{
                    Layout.preferredWidth: 28
                    Layout.preferredHeight: width
                    radius: width/2
                    color: "Cyan"
                    ToolButton{
                        anchors.fill: parent
                        text: "-"
                        font.pointSize: 20
                        onClicked: {
                            if(lineSerie.count == 0)
                                return
                            vAxisY.min = 0
                            vAxisY.max = Math.max(vAxisY.max + 0.1 * vAxisY.max, 10)
                        }
                    }
                }
                Rectangle{
                    Layout.preferredWidth: 28
                    Layout.preferredHeight: width
                    radius: width/2
                    color: "Cyan"
                    ToolButton{
                        anchors.fill: parent
                        text: "⟳"
                        font.pointSize: 20
                        onClicked: {
                            vAxisY.min = 0
                            vAxisY.max = 100
                        }
                    }
                }
            }

        }

        RowLayout{
            Layout.alignment: Qt.AlignRight

            TabBar{
                id: tabbar
                currentIndex: 3

                TabButton{
                    width: 100
                    text: "1,000"
                    onClicked: {
                        pointsNo = 1000
                        databuilder.paintChart(lineSerie, pointsNo)
                    }

                }
                TabButton{
                    width: 100
                    text: "10,000"
                    onClicked: {
                        pointsNo = 10000
                        databuilder.paintChart(lineSerie, pointsNo)
                    }

                }
                TabButton{
                    width: 100
                    text: "100,000"
                    onClicked: {
                        pointsNo = 100000
                        databuilder.paintChart(lineSerie, pointsNo)
                    }

                }

                TabButton{
                    width: 100
                    leftInset: 10
                    text: "Clear"
                    onClicked: {
                        lineSerie.clear()
                    }
                }
            }
        }
    }
}
