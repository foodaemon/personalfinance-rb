/*
* function to populate year drop down
*/
var piePlot = "";

var chart;
var legend;

function populateYear(){
    var yearFrom = new Date().getFullYear();
    var yearDiff = yearFrom - 2000;
    for(var i = 0; i <= yearDiff; i++){
        $('#date_year').append(
            $('<option></option>')
                .attr('value', yearFrom)
                .text(yearFrom)
        );
        console.log(yearFrom);
        yearFrom = yearFrom - 1;
    }
    $('#date_year').val($('#year_selected').val());
}

/*
 * function to populate year drop down
 */
function populateMonth(){
    for(var i = 1; i <= 12; i++){
        $('#date_month').append(
            $('<option></option>')
                .attr('value', i)
                .text(i)
        );
    }
    $('#date_month').val($('#month_selected').val());
}

/*
 * Function to plot pie chart
 * */
function drawTransactionsPieChart() {
    var jsonData = $.ajax({
        type: 'GET',
        url: '/dashboard/index.json',
        dataType: 'JSON',
        data: 'year=' + $('#date_year').val() + '&month=' + $('#date_month').val(),
        async: false
    }).responseText;
    var chartData = jQuery.parseJSON(jsonData);

    AmCharts.ready(function () {
        // PIE CHART
        chart = new AmCharts.AmPieChart();
        chart.dataProvider = chartData;
        chart.titleField = "category";
        chart.valueField = "amount";
        chart.outlineColor = "#FFFFFF";
        chart.outlineAlpha = 0.8;
        chart.outlineThickness = 2;
        chart.balloonText = "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>";
        // this makes the chart 3D
        chart.depth3D = 15;
        chart.angle = 30;

        // WRITE
        chart.write("chartdiv");
    });
}

// jquery events
$(document).ready(function() {
    populateYear();
    populateMonth();

    drawTransactionsPieChart();

    $('#view_date').click(function(){
        var date_year = $('#date_year').find('option:selected').val();
        var date_month = $('#date_month').find('option:selected').val();
        var url = $('#transactions_url').val() +"?year=" + date_year + "&month=" + date_month;
        document.location.href = url;
    });

    $(window).resize(function() {
        piePlot.replot( { resetAxes: true } );
    });

});