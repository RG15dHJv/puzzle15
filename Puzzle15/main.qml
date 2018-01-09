import QtQuick 2.0
import QtQuick.Window 2.2

Window {
    visible: true
    width: 480
    height: 480
    title: qsTr("Puzzle 15")

    //считать из файла расположение
    //расположить плитки на поле (визуально и логически)
    //создать логику перемещений плиток

    //детали визуализации перемещений:
    // определить плитки для движения
    // объединить их в общую анимацию
    // поменять их координаты

    Rectangle {
        id: gameField

        property variant tiles : null;

        anchors.fill: parent
        color: "#474747"; focus: true

        function doLayout() {

            if (tiles != null)
                return;

            tiles = new Array(15);

            var created = 0;

            for (var i = 0; i < 4; i++)
            {
                for (var j = 0; j < 4; j++)
                {
                    if (created == 15) break;

                    var newTile = tile.createObject(gameField);

                    newTile.capture = i
                    newTile.posX = i;
                    newTile.posY = j;
                    newTile.color = "red";

                    tiles[created] = newTile;

                    created++;
                }
            }

            repaint()
        }

        function repaint() {
            for (var i = 0; i < 15; i++ ) {
                var curTile = tiles[i];
                curTile.capture=i;
                var a = Math.min(width, height) / 4;
                curTile.x =  a * curTile.posX;
                curTile.y =  a * curTile.posY;
                curTile.width = a;
                curTile.height = a;
            }
        }

        Component {
            id: tile

            Rectangle {
                width: parent.width/4
                height: parent.height/4
                color: "green"

                border {
                    width: 2
                    color: "steelblue"
                }

                property alias capture: textVal.text
                property int posX: 0
                property int posY: 0

                Behavior on x { SmoothedAnimation { duration: 200 } }
                Behavior on y { SmoothedAnimation { duration: 200} }

                Text {
                    id: textVal
                    anchors.centerIn: parent
                    font.pixelSize: 20
                }

                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton
                    onClicked: {
                        parent.color = "blue"
                    }
                }
            }
        }

        Component.onCompleted: doLayout()
    }
    onHeightChanged: { console.log("Height changed"); gameField.repaint() }
    onWidthChanged: { console.log("Width changed"); gameField.repaint() }

//    onWindowChanged: {
//        console.log("Window changed")

//    }
}




