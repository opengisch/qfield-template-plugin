import QtQuick
import QtQuick.Controls

import org.qfield
import org.qgis
import Theme

Item {
  id: plugin

  property var mainWindow: iface.mainWindow()
  property var positionSource: iface.findItemByObjectName('positionSource')

  Component.onCompleted: {
    iface.addItemToPluginsToolbar(pluginButton)
  }
  
  QfToolButton {
    id: pluginButton
    iconSource: 'icon.svg'
    iconColor: Theme.mainColor
    bgcolor: Theme.darkGray
    round: true
    
    onClicked: {
      let position = positionSource.positionInformation
      if (positionSource.active && position.latitudeValid && position.longitudeValid) {
        mainWindow.displayToast(qsTr('Your current position is ' + position.latitude + ', ' +position.longitude))
      } else {
        mainWindow.displayToast(qsTr('Your current position is unknown'))
      }
    }
  }
}
