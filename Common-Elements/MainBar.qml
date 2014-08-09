import QtQuick 2.2
import QtQuick.Layouts 1.1
import 'qrc:///Core/core' as Core

Rectangle {
    id: capcalera
    color: '#D0FA58'

    Core.UseUnits { id: units }

    property string pageTitle: qsTr("Appsemblea")
    property int midaMainBar: units.fingerUnit + units.nailUnit * 2
    default property alias buttons: flowBarLayout.children

    signal goBack()

    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    height: midaMainBar
    clip: true

    RowLayout {
        id: flowBarLayout
        anchors.fill: parent
        anchors.margins: units.nailUnit
        spacing: 2 * units.nailUnit

        Core.Button {
            id: backButton
            text: qsTr('Enrere')
            color: 'white'
            onClicked: goBack()
        }

        Text {
            id: pageText
            states: [
                State {
                    name: 'elide'
                    PropertyChanges {
                        target: pageText
                        elide: Text.ElideRight
                        fontSizeMode: Text.VerticalFit
                    }
                },
                State {
                    name: 'smaller'
                    PropertyChanges {
                        target: pageText
                        elide: Text.ElideNone
                        fontSizeMode: Text.HorizontalFit
                    }
                }
            ]
            state: 'elide'

            Layout.fillHeight: true
            Layout.fillWidth: true
            anchors.leftMargin: units.fingerUnit
            anchors.rightMargin: units.nailUnit
            color: 'green'
            text: pageTitle
            font.pixelSize: units.titleReadUnit
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter

            MouseArea {
                anchors.fill: parent
                onClicked: pageText.state = (pageText.state == 'elide')?'smaller':'elide'
            }
        }
    }
}
