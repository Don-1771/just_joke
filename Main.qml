import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Item {
        id: myItem

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 320

        Text{
            id: mytext
            text: qsTr("<html><b>Hello</b> <i><font color='red'>World</font></i><br>
                        <a href='https://max.ru/'>https://desktop.telegram.org/</a></html>")
            anchors.centerIn: parent
            font.pointSize: 35
            color: "green"
            linkColor: "blue"

            onLinkHovered: {
                console.log("Навели на " + link)
                if(link)
                {
                   font.bold = true
                }
                else{
                    font.bold = false
                }
            }

            onLinkActivated: Qt.openUrlExternally(link)
        }
    }

    Rectangle{
        id: myArea
        color: "blue"
        width: 300
        height: 300

        anchors.top: myItem.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        MouseArea{
            id: myMouseArea
            anchors.fill: parent

            acceptedButtons: Qt.LeftButton | Qt.RightButton
            //По умолчанию, MouseAreaреагирует только на Qt.LeftButton.
            //Эта строка расширяет область действия,
            //позволяя обрабатывать также щелчки правой кнопкой мыши

            hoverEnabled: true
            //По умолчанию ( false), сигналы типа onEntered, onExited,
            //и onPositionChanged срабатывают только при удерживании кнопки мыши.
            //Установка этого параметра true позволяет системе MouseAreaобнаруживать курсор,
            //как только он попадает в область поиска, независимо от того, нажата ли кнопка.

            onClicked: {
                console.log("Clicked: " + mouse.button)
                if(mouse.button === Qt.LeftButton) parent.color = "green"
                if(mouse.button === Qt.RightButton) parent.color = "red"
            }

            onDoubleClicked: console.log("Press double clicked " + mouse.button);
            onPositionChanged: console.log("X: " + mouseX + "Y: " + mouseY)
            onEntered: parent.color = "orange"
            onExited: parent.color = "blue"
        }
    }


}
