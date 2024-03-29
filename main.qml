import QtQuick 2.2
import QtQuick.Window 2.1

import "gameLogic.js" as Logic

Window {

    visible: true
    width: 400
    height: 400

    Rectangle {
        width: 400; height: 400; color: "white"


        Grid {
            id: field
            x: 0; y: 0
            rows: 40; columns: 40;

            Repeater { model: parent.rows * parent.columns
                Rectangle {
                    id: cell
                    width: 10; height: 10
                    border.color: "white"
                    color: "lightgray"

                    property bool isAlive: false
                    property bool nextGen: false


                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        function changeColor() {
                            if (isAlive)
                                cell.color = "cornflowerblue"
                            else
                                cell.color = "lightgray"
                        }

                        onEntered: {
                            if (clicked) {
                                isAlive = !isAlive
                                changeColor()
                            }
                        }
                    }
                }
            }
        }

        Timer {
            interval: 100
            running: true
            repeat: true
            onTriggered: Logic.nextGeneration(field);
        }
    }
}
