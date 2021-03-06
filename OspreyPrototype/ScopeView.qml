import QtQuick 2.13
import QtCharts 2.13

ChartView {
    id: chartView
    animationOptions: ChartView.NoAnimation
    theme: ChartView.ChartThemeDark
    legend.visible: false
    property bool openGL: true
    property bool openGLSupported: true

    //property bool isRunning:false
    //onIsRunningChanged: {
    //    refreshTimer.running=isRunning
    //}

    function updateChart(){
        dataSource.update(chartView.series(0))
    }

    onOpenGLChanged: {
        if (openGLSupported) {
            series("signal 1").useOpenGL = openGL;
            //series("signal 2").useOpenGL = openGL;
        }
    }
    Component.onCompleted: {
        if (!series("signal 1").useOpenGL) {
            openGLSupported = false
            openGL = false
        }
    }

    ValueAxis {
        id: axisY1
        min: -1
        max: 4
    }

    ValueAxis {
        id: axisY2
        min: -10
        max: 5
    }

    ValueAxis {
        id: axisX
        min: 0
        max: 1024
    }

    LineSeries {
        id: lineSeries1
        name: "signal 1"
        axisX: axisX
        axisY: axisY1
        useOpenGL: chartView.openGL
    }
    LineSeries {
        id: lineSeries2
        name: "signal 2"
        axisX: axisX
        axisYRight: axisY2
        useOpenGL: chartView.openGL
    }

    function changeSeriesType(type) {
        chartView.removeAllSeries();

        // Create two new series of the correct type. Axis x is the same for both of the series,
        // but the series have their own y-axes to make it possible to control the y-offset
        // of the "signal sources".
        if (type == "line") {
            var series1 = chartView.createSeries(ChartView.SeriesTypeLine, "signal 1",
                                                 axisX, axisY1);
            series1.useOpenGL = chartView.openGL

            // var series2 = chartView.createSeries(ChartView.SeriesTypeLine, "signal 2",
            //                                     axisX, axisY2);
            // series2.useOpenGL = chartView.openGL
        } else {
            var series1 = chartView.createSeries(ChartView.SeriesTypeScatter, "signal 1",
                                                 axisX, axisY1);
            series1.markerSize = 2;
            series1.borderColor = "transparent";
            series1.useOpenGL = chartView.openGL

            // var series2 = chartView.createSeries(ChartView.SeriesTypeScatter, "signal 2",
            //                                      axisX, axisY2);
            // series2.markerSize = 2;
            // series2.borderColor = "transparent";
            // series2.useOpenGL = chartView.openGL
        }
    }

    function createAxis(min, max) {
        // The following creates a ValueAxis object that can be then set as a x or y axis for a series
        return Qt.createQmlObject("import QtQuick 2.0; import QtCharts 2.0; ValueAxis { min: "
                                  + min + "; max: " + max + " }", chartView);
    }

    function setAnimations(enabled) {
        if (enabled)
            chartView.animationOptions = ChartView.SeriesAnimations;
        else
            chartView.animationOptions = ChartView.NoAnimation;
    }

    function changeAcquisitionRate(rate){
        dataSource.changeAcquisitionRate(Number(rate))
    }

    function changeRefreshRate(rate) {
        refreshTimer.interval = 1 / Number(rate) * 1000;
    }
}
