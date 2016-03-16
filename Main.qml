import QtQuick 2.0
import Ubuntu.Components 1.1

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "inputmethod.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(60)
    height: units.gu(85)

    Page {
        title: i18n.tr("inputmethod")

        Column {
            spacing: units.gu(2)

            TextField {
                id: input
            }

            Text {
                text: "Input method: " + "<b>" + Qt.inputMethod.visible + "</b>"
            }

            Button {
                text: "Hide Input method"
                onClicked: {
                    Qt.inputMethod.hide();
                }
            }

        }

        // http://doc.qt.io/qt-5/qml-qtqml-qt.html
        Component.onCompleted: {
            var keys = Object.keys(Qt.inputMethod);
            for(var i = 0; i < keys.length; i++) {
                var key = keys[i];
                // prints all properties, signals, functions from object
                console.log(key + ' : ' + Qt.inputMethod[key]);

                if (key === "locale") {
                    console.log("Native lang: " + Qt.inputMethod[key].nativeLanguageName);
                }
            }

            var rect = Qt.inputMethod.keyboardRectangle;
            console.log("keyboard size: " + rect.width + " " + rect.height);

            // for Qt.Application
            keys = Object.keys(Qt.application);
            for(var i = 0; i < keys.length; i++) {
                var key = keys[i];
                // prints all properties, signals, functions from object
                console.log(key + ' : ' + Qt.application[key]);
            }

            console.log("===========================================");
            console.log("OS: " + Qt.platform.os);
        }
    }
}

