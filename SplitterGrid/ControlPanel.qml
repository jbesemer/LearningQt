/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt Charts module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.1
import QtQuick.Layouts 1.0

RowLayout {
    property alias openGLButton: openGLButton
    property alias antialiasButton: antialiasButton
    Layout.fillWidth: true
    signal animationsEnabled(bool enabled)
    signal seriesTypeChanged(string type)
    signal acquisitionRateChanged(variant rate);
    signal refreshRateChanged(variant rate);
    signal signalSourceChanged(string source, int signalCount, int sampleCount, double acquisitionRate);
    signal antialiasingEnabled(bool enabled)
    signal openGlChanged(bool enabled)

    readonly property int defaultSignalCount: 5;

    MultiButton {
        id: signalSourceButton
        text: "Source"
        items: ["sine", "square", "pulse"]
        currentSelection: 0
        onSelectionChanged: signalSourceChanged(
                                selection,
                                defaultSignalCount,
                                sampleCountButton.items[sampleCountButton.currentSelection],
                                acquisitionRateButton.items[acquisitionRateButton.currentSelection]);
    }

    MultiButton {
        id: sampleCountButton
        text: "Samples"
        items: ["1024", "3000", "10000", "30000"]
        currentSelection: 0
        onSelectionChanged: signalSourceChanged(
                                signalSourceButton.items[signalSourceButton.currentSelection],
                                defaultSignalCount,
                                selection,
                                acquisitionRateButton.items[acquisitionRateButton.currentSelection]);
    }

    MultiButton {
        id: acquisitionRateButton
        text: "Acq Speed"
        items: ["10", "30", "100", "300"] //, "500", "1200"]
        currentSelection: 2
        onSelectionChanged: signalSourceChanged(
                                signalSourceButton.items[signalSourceButton.currentSelection],
                                defaultSignalCount,
                                sampleCountButton.items[sampleCountButton.currentSelection],
                                selection);
    }

    MultiButton {
        text: "Refresh rate"
        items: ["1", "24", "60", "100"]
        currentSelection: 2
        onSelectionChanged: refreshRateChanged(items[currentSelection]);
    }

    MultiButton {
        id: openGLButton
        text: "OpenGL"
        items: ["false", "true"]
        currentSelection: 1
        onSelectionChanged: openGlChanged(currentSelection == 1);
    }

    MultiButton {
        text: "Graph"
        items: ["line", "scatter"]
        currentSelection: 0
        onSelectionChanged: seriesTypeChanged(items[currentSelection]);
    }

    MultiButton {
        id: antialiasButton
        text: "Antialias"
        items: ["OFF", "ON"]
        enabled: true
        currentSelection: 0
        onSelectionChanged: antialiasingEnabled(currentSelection == 1);
    }
}
