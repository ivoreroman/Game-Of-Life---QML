import QtQuick 2.2
import QtQuick.Window 2.1

Window {

    visible: true
    width: 400
    height: 400

    Rectangle {
        width: 400; height: 400; color: "white"


        Grid {
            x: 0; y: 0
            rows: 40; columns: 40;

            Repeater { model: parent.rows * parent.columns
                Rectangle {
                    id: cell
                    state: "DEAD"
                    width: 10; height: 10
                    border.color: "white"

                    states: [
                        State {
                            name: "DEAD"
                            PropertyChanges { target: cell; color: "lightgray"}
                        },
                        State {
                            name: "ALIVE"
                            PropertyChanges { target: cell; color: "cornflowerblue"}
                        }
                    ]

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            if (clicked) {
                                if (cell.state == "DEAD")
                                    cell.state = "ALIVE"
                                else
                                    cell.state = "DEAD"
                            }
                        }
                        onClicked: {
                            if (cell.state == "DEAD")
                                cell.state = "ALIVE"
                            else
                                cell.state = "DEAD"
                        }
                    }
                }
            }
        }
    }
}
