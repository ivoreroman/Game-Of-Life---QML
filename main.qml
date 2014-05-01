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
                Rectangle { width: 10; height: 10
                    color: "lightgray"; border.color: "white";
                }
            }
        }
    }
}
