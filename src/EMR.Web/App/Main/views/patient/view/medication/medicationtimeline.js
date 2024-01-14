﻿(function () {
    angular.module('app').directive('medicationTimeline', function () {
        return {
            restrict: 'EA',
            template: "<svg></svg>",
            link: function ($scope, elem, attrs) {
                var timelineDataToPlot = $scope[attrs.chartData];

                function renderTimeLine() {
                    var group, barGroup, context, scruboffset = 0, scrubData, t1, scrubDisplay;

                    var m = [80, 160, 0, 80]; // top right bottom left
                    var m2 = [570, 160, 20, 80];
                    var w = 1200 - m[1] - m[3]; // width    
                    var h = 700 - m[0] - m[2]; // height
                    var h2 = 700 - m2[0] - m2[2];

                    var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];				//Array to display the current month on the TodayLine


                    var x = d3.time.scale().range([126, w + 160]);		//X-axis 
                    var x2 = d3.time.scale().range([126, w + 160]);		//X-axis in the scrubber region

                    var startdates = [];									//Array to store the startdates
                    var enddates = [];									//Array to store the enddates
                    console.log(timelineDataToPlot);
                    //This loop adds the startdates and enddates into the respective arrays	
                    for (var i = 0; i < timelineDataToPlot.length; i++) {
                        timelineDataToPlot[i].drugName = timelineDataToPlot[i].drugName.toLowerCase();
                        for (var j = 0; j < timelineDataToPlot[i].dateRanges.length; j++) {
                            timelineDataToPlot[i].dateRanges[j].startDate = new Date(timelineDataToPlot[i].dateRanges[j].startDate);
                            timelineDataToPlot[i].dateRanges[j].endDate = new Date(timelineDataToPlot[i].dateRanges[j].endDate);

                            startdates[startdates.length] = new Date(timelineDataToPlot[i].dateRanges[j].startDate);
                            enddates[enddates.length] = new Date(timelineDataToPlot[i].dateRanges[j].endDate);
                        }
                    }

                    var minDate = startdates[0]; //Variable to store the minimum Date
                    var maxDate = enddates[0]; //Variable to store the maximum Date


                    //Loop to find out the min and max Date
                    for (var i = 1; i < startdates.length; i++) {
                        if (startdates[i] < minDate)
                            minDate = startdates[i];

                        if (enddates[i] > maxDate)
                            maxDate = enddates[i];
                    }

                    minDate = new Date(minDate.getFullYear(), 0, 1);
                    maxDate = new Date(maxDate.getFullYear() + 1, 0, 1);

                    var lDate = new Date(); //Variable to store the left date to set brush extent
                    var rDate = new Date();	//Variable to store the right date to set brush extent 

                    var currDate = new Date(); //Stores the current Date		


                    var w1 = 1100 - 960; //calculate offset so that the today line (currDate) is aligned with the scrubber ( 1100 is the width of svg, 960 is the width being shown)
                    rDate = maxDate;
                    lDate.setTime(rDate.getTime() - (1000 * 60 * 60 * 24 * 365 * 2)); //2 years before the right date (note: that multiplication is calculating the # of miliseconds in 2 years 


                    //Moves the small today's date line so that it lines up with the large today's date line.
                    //Only works for the date September, 18, 2013
                    var sudoMaxDate = maxDate;
                    sudoMaxDate.setMonth(sudoMaxDate.getMonth() + 3);
                    sudoMaxDate.setDate(sudoMaxDate.getDate() - 20);

                    //Setting the domain of the x-axis	
                    x.domain([minDate, maxDate]);
                    x2.domain([minDate, sudoMaxDate]);


                    //Setting the Y-axis 	
                    var y = d3.scale.linear().domain([0, 19]).range([75, h - 40]);
                    var y2 = d3.scale.linear().domain([0, timelineDataToPlot.length]).range([0, 48]);

                    //Declaring the zoom behavior	
                    var zoom = d3.behavior.zoom()
                                .scaleExtent([.7, 1.3])
                                .on("zoom", zoomed);


                    //Declaring the brush 				
                    var brush = d3.svg.brush()
                                .x(x2)
                                .extent([lDate, rDate])
                                .on("brush", brushed);



                    //Declaring the drag for the scrubber				
                    var drag = d3.behavior.drag()
                                .on("dragstart", scrubstart)
                                .on("drag", scrub);

                    var vDrag = d3.behavior.drag()
                                .on("drag", scrolldrag);

                    //Creating the chart area	
                    var rawSvg = elem.find('svg')
                    var chart = d3.select(rawSvg[0])
                                .classed("chart", true)
                                .attr("width", w + m[1] + 50)
                                .attr("height", h + m[0] + m[2]);



                    //Appending a rectangular pane to the chart area	
                    var pane = chart.append("g");

                    pane.append("rect")
                        .attr("class", "pane")
                        .attr("x", 126)
                        .attr("width", w + 50)
                        .attr("y", 55)
                        .attr("height", h - 80)
                        .attr("stroke", "#EEEEEE")
                        .attr("stroke-width", 1);

                    //Setting the x-axis				
                    var xaxis = d3.svg.axis()
                                .scale(x)
                                .orient("top")
                                .tickSize(h - 80)
                                .tickPadding(13);

                    var xaxis2 = d3.svg.axis()
                                    .scale(x2)
                                    .orient("bottom")
                                    .tickPadding(3)
                                    .tickSize(1);

                    var xaxis3 = d3.svg.axis()
                                .scale(x)
                                .orient("top")
                                .tickSize(0)
                                .tickPadding(3);

                    //Append the x-axis to the chart
                    chart.append("g").attr("class", "x axis")
                            .attr("transform", "translate(-20, " + (h - 25) + ")")
                            .attr("font-size", "15px")
                            .call(xaxis);



                    //Variable to create the timeline bars 		
                    var medicines = chart.selectAll(".medicineGroup").data(timelineDataToPlot).enter().append('g').classed("medicineGroup", true)
                                            .attr('transform', function (d, i) { return 'translate(-20,' + (y(i)) + ')' });

                    //Selects each medicine group and draws the reactangle for each drug
                    //based on the start date and end date in the timelineDataToPlot array and displays the
                    //dosage of each drug for a given period of time							
                    medicines.each(function (d, i) {
                        group = d3.select(this);

                        barGroup = group.append("g").classed("barGroup", true); //Appends timeline bars and text to the bars		
                        barGroup.selectAll(".timeBars")
                            .data(d.dateRanges)
                            .enter()
                            .append("rect")
                            .classed("timeBars", true)
                            .attr("y", -10)
                            .attr("height", 20)
                            //.attr("stroke", "white")
                            .attr("fill", function (d) {
                                if (d.strength < 2) {
                                    return "rgba(47,47,47,.2)";
                                } else if (d.strength < 4) {
                                    return "rgba(47,47,47,.35)";
                                } else if (d.strength < 8) {
                                    return "rgba(47,47,47,.6)";
                                } else if (d.strength < 16) {
                                    return "rgba(47,47,47,1)";
                                } else {
                                    return "rgba(195,0,0,1)";
                                }
                            })
                            .attr("cursor", "move")
                            .call(zoom);

                        barGroup.selectAll(".timeBarstext")
                                .data(d.dateRanges)
                                .enter()
                                .append("text")
                                .classed("timeBarstext", true)
                                .attr("y", 4)
                                .attr("fill", "white")
                                .attr("text-anchor", "end")
                                .attr("font-size", "11px")
                                .text(function (d) { return d.doseSize + d.frequencyCodeName; });
                    });

                    pane.call(zoom);
                    var todayLine = chart.append("g"); //Appends a line indicatiin current date and month

                    //Append triangle above the line
                    todayLine.append("path")
                            .attr("class", "todayTriangle")
                            .attr("d", d3.svg.symbol().type("triangle-down"))
                            .attr("transform", "translate(" + (x(currDate) - 220) + ", 60)")
                            .attr("fill", "#999999");

                    todayLine.append("line")
                            .attr("class", "todayLine")
                            .attr("y1", 62)
                            .attr("y2", h - 25)
                            .attr("stroke", "#999999")
                            .attr("stroke-width", 2);

                    var day = currDate.getDate();
                    var month = currDate.getMonth();
                    var newDate = monthNames[month] + " " + day; //Stores the current date and month 

                    //Append the drug names on the y-axis
                    var yAxisLabel = chart.append("g");

                    yAxisLabel.append("rect")
                            .attr("class", "yAxisRect")
                            .attr("x", 0)
                            .attr("y", 54)
                            .attr("width", 125)
                            .attr("height", h + 50)
                            .attr("stroke", "white")
                            .attr("fill", "white");

                    medicines.each(function (d, i) {
                        yAxisLabel.append("text")
                            .attr("class", "yAxisText")
                            .attr("y", y(i) + 3)
                            .attr("x", 105)
                            .attr("height", 100)
                            .attr("stroke", "none")
                            .attr("fill", "rgba(67,67,67,.5)")
                            .attr("text-anchor", "end")
                            .attr("font-size", "12px")
                            .text(d.drugName);
                    });

                    yAxisLabel.append("rect")
                            .attr("x", 0)
                            .attr("y", 590)
                            .attr("width", 115)
                            .attr("height", h + 50)
                            .attr("fill", "white");


                    //Appends a draggable rectangle over the bars to display the names of the drugs
                    //selected by the it while dragging     
                    var scrubber = chart.append("g");

                    //Creates the draggable rectangle
                    scrubber.append("rect")
                        .attr("class", "scrubber")
                        .attr("x", w - 22)
                        .attr("width", "1000px")
                        .attr("y", 55)
                        .attr("height", h - 80)
                        .attr("fill", "#ffffff")
                        .attr("fill-opacity", .9)
                        .attr("cursor", "move")
                        .attr("stroke", "#c7c7c7")
                        .attr("stroke-width", 1)
                        .attr("stroke-dasharray", [0, 800 + (h - 80) + 800, h - 80])
                        .call(drag);

                    //Appends text over the scrubber and initially makes them invisible	
                    medicines.each(function (d, i) {
                        scrubDisplay = scrubber.append("g")
                                            .attr("transform", this.attributes[1].value)
                                            .classed("scrubDisplay", true);

                        scrubDisplay.append("text")
                                .attr("class", "displayLabel")
                                .attr("fill", "#000000")
                                .attr("width", "100px")
                                .attr("x", w + 50)
                                .attr("y", 3)
                                .attr("height", "20px")
                                .attr("font-size", "12px")
                                .attr("font-weight", "bold");

                        scrubDisplay.append("text")
                                .attr("class", "displayDose")
                                .attr("fill", "#000000")
                                .attr("width", "50px")
                                .attr("x", w + 115)
                                .attr("y", 3)
                                .attr("height", "20px")
                                .attr("font-size", "11px");
                    });

                    chart.append("rect")
                        .attr("x", -10)
                        .attr("y", -10)
                        .attr("width", w + 175)
                        .attr("height", 67)
                        .attr("fill", "white");

                    chart.append("g").attr("class", "xaxis2")
                            .attr("transform", "translate(-20, 50)")
                            .attr("fill", "rgba(67,67,67,.5)")
                            .attr("font-size", "12px")
                            .call(xaxis3);

                    //Append text above the line			
                    var todayLineText = chart.append("g");

                    todayLineText.append("text")
                            .attr("class", "todayLineText")
                            .attr("x", x(currDate) - 38)
                            .attr("width", 10)
                            .attr("y", 30)
                            .attr("height", 10)
                            .attr("fill", "black")
                            .attr("font-size", "11px")
                            .text("Today " + newDate);

                    //A vertical scroll bar to scroll the chart vertically
                    var scrollBar = chart.append("g");

                    scrollBar.append("rect")
                            .attr("class", "vScroller")
                            .attr("x", 1108)
                            .attr("width", 8)
                            .attr("y", 55)
                            .attr("height", (15 / timelineDataToPlot.length) * 515)
                            .attr("rx", 4)
                            .attr("ry", 4)
                            .attr("fill", "#AAA8A8")
                            .attr("cursor", "move")
                            .call(vDrag);

                    //Variable to append a mini version of the timeline to allow brushing to select
                    //region one wants to view
                    context = chart.append("g")
                                .attr("transform", "translate(0 , " + (m2[0] + 30) + ")");

                    //Appends a rectangular region to display the mini timeline			
                    context.append("rect")
                            .attr("x", 126)
                            .attr("width", w + 40)
                            .attr("y", -5)
                            .attr("height", 60)
                            .attr("stroke", "#d9d9d9")
                            .attr("stroke-width", .75)
                            .attr("fill", "#ededed");

                    context.append("rect")
                        .attr("x", 115)
                        .attr("y", 55)
                        .attr("width", w + 100)
                        .attr("height", h2)
                        .attr("fill", "white");

                    //Appends x-axis to the context area		
                    context.append("g")
                        .attr("class", "x axis")
                        .attr("fill", "rgba(67,67,67,.5)")
                        .attr("transform", "translate(0, " + (h2 - 55) + ")")
                        .call(xaxis2);

                    //Creates the timeline bars in the context area	
                    var contextBars = context.selectAll(".medicineGroup").data(timelineDataToPlot)
                                            .enter().append("g")
                                            .classed("contextBar", true)
                                            .attr("transform", function (d, i) { return "translate(0, " + (y2(i)) + ")"; });

                    //Selects each medicine group and draws the reactangle for each drug
                    //based on the start date and end date in the timelineDataToPlot array						
                    contextBars.each(function (d, i) {
                        var cGroup = d3.select(this);

                        cGroup.selectAll(".contextBars")
                                .data(d.dateRanges)
                                .enter()
                                .append("rect")
                                .classed("cBars", true)
                                .attr("x", function (d) { return x2(d.startDate); })
                                .attr("width", function (d) { return x2(d.endDate) - x2(d.startDate); })
                                //.attr("y", -1)
                                .attr("y", 2)
                                .attr("height", 1)
                                //.attr("height", 3)
                                //.attr("stroke", "white")
                                .attr("fill", function (d) {
                                    if (d.strength <2) {
                                        return "rgba(47,47,47,.2)";
                                    } else if (d.strength < 4) {
                                        return "rgba(47,47,47,.35)";
                                    } else if (d.strength <8) {
                                        return "rgba(47,47,47,.6)";
                                    } else if (d.strength < 16) {
                                        return "rgba(47,47,47,1)";
                                    } else {
                                        return "rgba(195,0,0,1)";
                                    }
                                });
                    });

                    //Appends a line indicating the current date in the context region
                    context.append("line")
                            .attr("class", "contextLine")
                            .attr("x1", x2(currDate))
                            .attr("x2", x2(currDate))
                            .attr("y1", -4)
                            .attr("y2", 54)
                            .attr("stroke-width", 1)
                            .attr("stroke", "black")
                            .attr("stroke-opacity", .5);

                    //Appends a brush over the context region	
                    var b = context.append("g")
                            .attr("class", "x brush");

                    //Adding visible left and right circle handles    
                    var leftHandle = b.append("svg:circle")
                        .attr("r", 7)
                        .attr("cx", 150)
                        .attr("cy", 25);

                    var rightHandle = b.append("svg:circle")
                        .attr("r", 7)
                        .attr("cx", 175)
                        .attr("cy", 25);

                    //makes sure that dragging the circles (handles) calls the brush function... otherwise dragging is broken in that region.    
                    b.call(brush);

                    b.selectAll("rect")
                        .attr("y", -4)
                        .attr("height", 58);

                    b.selectAll(".resize.e rect").attr("width", 25).attr("x", -5);
                    b.selectAll(".resize.w rect").attr("width", 25).attr("x", -5);

                    chart.append("rect")
                        .attr("x", 1119)
                        .attr("width", 1)
                        .attr("y", 55)
                        .attr("height", h - 20)
                        .attr("stroke", "#EEEEEE");

                    chart.append("rect")
                        .attr("x", 1120)
                        .attr("width", 50)
                        .attr("y", -10)
                        .attr("height", h + 48)
                        .attr("fill", "white");

                    chart.append("rect")
                            .attr("x", 0)
                            .attr("width", 110)
                            .attr("y", 0)
                            .attr("height", 55)
                            .attr("fill", "white");

                    //This function updates the timeline bars when zooming or dragging based on the
                    //x-axis and redraws them	
                    function updateBars() {
                        medicines.each(function (d, i) {
                            group = d3.select(this);

                            group.select(".barGroup").selectAll(".timeBars").each(function (d) {
                                d3.select(this)
                                .attr("x", function (d) { return x(d.startDate); })
                                .attr("width", function (d) { return x(d.endDate) - x(d.startDate); })
                            });

                            //Displays the dosage over the bars based on the width of the bars. If width is less than 30px the text
                            //is not displayed
                            group.select(".barGroup").selectAll(".timeBarstext").each(function (d) {
                                d3.select(this).attr("x", function (d) { return x(d.startDate) + (x(d.endDate) - x(d.startDate)) - 8; })
                                                .attr("fill", function (d) {
                                                    if ((x(d.endDate) - x(d.startDate)) < 30)
                                                        return "none";
                                                    else
                                                        return "white";
                                                });
                            });
                        });
                    }

                    //This function sets the scrub offset on start of drag	
                    function scrubstart(d) {
                        scruboffset = 0;
                    }

                    //This allows to move the scrubber over the bars and sets the extent to which it can
                    //be dragged	
                    function scrub(d) {
                        //console.log(d3.event.dy);
                        if (d3.event.x - scruboffset >= 1080)
                            scrubber.select(".scrubber").attr("x", 1080);
                        else if (d3.event.x - scruboffset <= 125)
                            scrubber.select(".scrubber").attr("x", 125);
                        else
                            scrubber.select(".scrubber").attr("x", d3.event.x - scruboffset);
                        //On dragging the scrubber updates the names of the drugs selected by it
                        updateOnScrub();
                    }

                    //Displays the drug names over the scrubber based on the time bars selected by it
                    var updateOnScrub = function () {
                        var ind = 0;
                        scrubber.selectAll(".scrubDisplay").each(function (d, j) {
                            var scrubGroup = d3.select(this);

                            scrubGroup.selectAll(".displayLabel").attr("x", scrubber.select(".scrubber").attr("x") * 1 + 30)
                                .attr("fill", "none");

                            scrubGroup.selectAll(".displayDose").attr("x", scrubber.select(".scrubber").attr("x") * 1 + 125)
                                .attr("fill", "none");

                            //console.log(scrubGroup)
                            for (var i = 0; i < timelineDataToPlot[ind].dateRanges.length; i++) {
                                if ((x.invert(1 * scrubber.select(".scrubber").attr("x") + 20) < timelineDataToPlot[ind].dateRanges[i].endDate) &&
                                    (x.invert(1 * scrubber.select(".scrubber").attr("x") + 20) > timelineDataToPlot[ind].dateRanges[i].startDate)) {

                                    scrubGroup.selectAll(".displayLabel").each(function (d) {
                                        d3.select(this)
                                            .attr("fill", "rgba(67,67,67,1)")
                                            .text(timelineDataToPlot[ind].drugName + " ");
                                    });

                                    scrubGroup.selectAll(".displayDose").each(function (d, j) {
                                        d3.select(this)
                                            .attr("fill", "rgba(67,67,67,1)")
                                            .text(timelineDataToPlot[ind].dateRanges[i].doseSize + timelineDataToPlot[ind].dateRanges[i].doseUnit + timelineDataToPlot[ind].dateRanges[i].frequencyCodeName);
                                    })
                                }
                            }
                            ind++;
                        });

                        //Updating yAxis labels of the timeline
                        updateYLabels();
                    };

                    //Changes the color of the yAxis labels based on the bars selected by the scrubber to
                    //indicate active and inactive medicines.
                    var updateYLabels = function () {
                        var scrubberArray = [];
                        scrubberArray = scrubber.selectAll(".displayLabel")[0]; //Adds the bars selected by the scrubber to this array

                        var yLabelArray = d3.selectAll(".yAxisText")[0]; //Adds the yAxis text to this array

                        for (var k = 0; k < scrubberArray.length; k++) {
                            if (scrubberArray[k].attributes[1].value == "rgba(67,67,67,1)") {
                                d3.select(yLabelArray[k]).attr("fill", "rgba(67,67,67,1)");
                            } else {
                                d3.select(yLabelArray[k]).attr("fill", "rgba(67,67,67,.5)");
                            }
                        }
                    };

                    //Gets the translation value of the scroll bar and allows for scrolling of the chart
                    //in the vertical direction by calling the updateOnScroll function
                    function scrolldrag(d) {
                        var yVal = scrollBar.select(".vScroller").attr("y") * 1 + d3.event.dy;
                        if (yVal < 55)
                            yVal = 55;
                        else if (yVal > (593 - scrollBar.select(".vScroller").attr("height") * 1))
                            yVal = (593 - scrollBar.select(".vScroller").attr("height") * 1);
                        var deltaY = scrollBar.select(".vScroller").attr("y") * 1 - yVal;
                        scrollBar.select(".vScroller").attr("y", yVal);
                        updateOnScroll(deltaY);
                    };

                    //Updates the position of the labels on the left, on the scrubber and the drags the chart
                    //when the scroll bar is dragged
                    var updateOnScroll = function (yVal) {
                        chart.selectAll(".medicineGroup").each(function (d, j) {
                            var tranStr = d3.select(this).attr("transform");
                            if (tranStr != null)
                                tranStr = tranStr.substring(14, tranStr.length - 1);
                            else
                                tranStr = 0;
                            d3.select(this).attr('transform', 'translate(-20,' + (tranStr * 1 + yVal) + ')');
                        });

                        scrubber.selectAll(".displayLabel").each(function (d, j) {
                            var scrubStr = d3.select(this).attr("transform");
                            if (scrubStr != null)
                                scrubStr = scrubStr.substring(13, scrubStr.length - 1);
                            else
                                scrubStr = 0;
                            d3.select(this).attr('transform', 'translate(0, ' + (scrubStr * 1 + yVal) + ')');
                        });

                        scrubber.selectAll(".displayDose").each(function (d, j) {
                            var scrubStr = d3.select(this).attr("transform");
                            if (scrubStr != null)
                                scrubStr = scrubStr.substring(13, scrubStr.length - 1);
                            else
                                scrubStr = 0;
                            d3.select(this).attr('transform', 'translate(0, ' + (scrubStr * 1 + yVal) + ')');
                        });

                        yAxisLabel.selectAll(".yAxisText").each(function (d, j) {
                            var labelStr = d3.select(this).attr("transform");
                            if (labelStr != null)
                                labelStr = labelStr.substring(13, labelStr.length - 1);
                            else
                                labelStr = 0;
                            d3.select(this).attr('transform', 'translate(0, ' + (labelStr * 1 + yVal) + ')');
                        });
                    };

                    //Allows dragging the chart and zooming along the x-axis and based on the zoom/drag moves the brush
                    //to indicate the region of the timeline that is in focus
                    function zoomed() {
                        //console.log(d3.event);
                        if (d3.event.scale == 1) {
                            if (d3.event.sourceEvent.webkitMovementX != null) {
                                var dir = -d3.event.sourceEvent.webkitMovementX * .2;
                                var tx1 = x2(brush.extent()[0]) + dir;
                                var tx2 = x2(brush.extent()[1]) + dir;
                                //dir = d3.select(".extent").attr("x")*1+dir;
                                if (tx1 < 127) {
                                    tx2 += 127 - tx1;
                                    tx1 = 127;
                                }
                                if (tx2 > 1120) {
                                    tx1 += 1120 - tx2;
                                    tx2 = 1120;
                                }
                                d3.select(".extent").attr("x", tx1);
                                brush.extent([x2.invert(tx1), x2.invert(tx2)]);
                                x.domain(brush.extent());
                                brushed();

                                //zoom.translate([0,0]);
                            } else {
                                var dir = -d3.event.translate[0] / 25;
                                var tx1 = x2(brush.extent()[0]) + dir;
                                var tx2 = x2(brush.extent()[1]) + dir;
                                //dir = d3.select(".extent").attr("x")*1+dir;

                                if (tx1 < 127) {
                                    tx2 += 127 - tx1;
                                    tx1 = 127;
                                }

                                if (tx2 > 1120) {
                                    tx1 += 1120 - tx2;
                                    tx2 = 1120;
                                }

                                d3.select(".extent").attr("x", tx1);
                                brush.extent([x2.invert(tx1), x2.invert(tx2)]);
                                x.domain(brush.extent());
                                brushed();

                                zoom.translate([0, 0]);
                            }
                        } else {
                            var zScale = d3.event.scale;
                            var mid = (x2(brush.extent()[1]) - x2(brush.extent()[0])) / 2 + x2(brush.extent()[0]);
                            var zWidth = (x2(brush.extent()[1]) - x2(brush.extent()[0])) * zScale;

                            var ts1 = mid - zWidth / 2;
                            var ts2 = mid + zWidth / 2;

                            if (zWidth > x2(minDate.setMonth(minDate.getMonth() + 1)) - 126) {
                                if (ts1 < 127)
                                    ts1 = 127;

                                if (ts2 > 1120)
                                    ts2 = 1120;

                                d3.select(".extent").attr("x", ts1);
                                d3.select(".extent").attr("width", zWidth);

                                brush.extent([x2.invert(ts1), x2.invert(ts2)])
                                x.domain(brush.extent());
                                brushed();
                            }
                            minDate.setMonth(minDate.getMonth() - 1);
                            zoom.scale(1)
                        }
                    };

                    // -----------

                    //Allows brushing over the mini timeline and helps selecting a particular
                    //section of the timeline
                    function brushed() {
                        leftHandle.attr("cx", function () {
                            return x2(brush.extent()[0]) + 1;
                        });
                        rightHandle.attr("cx", function () {
                            return x2(brush.extent()[1]) - 1;
                        });

                        x.domain(brush.extent());
                        barGroup.selectAll(".timeBars").attr("x", function (d) { return x(d.startDate); });
                        barGroup.attr("width", 5);
                        chart.select("g.x.axis").call(xaxis);
                        chart.select("g.xaxis2").call(xaxis3);
                        updateBars();
                        updateOnScrub();
                        updateTodayLine();
                    }

                    brushed();

                    var brushFunc = function () {
                        leftHandle.attr("cx", function () {
                            return x2(brush.extent()[0]) + 1;
                        });
                        rightHandle.attr("cx", function () {
                            return x2(brush.extent()[1]) - 1;
                        });

                        x.domain(brush.extent());
                        barGroup.selectAll(".timeBars").attr("x", function (d) { return x(d.startDate); });
                        barGroup.attr("width", 5);
                        chart.select("g.x.axis").call(xaxis);
                        chart.select("g.xaxis2").call(xaxis3);
                        updateBars();
                        updateOnScrub();
                        updateTodayLine();
                    }

                    //Redraws the today line when zooming/dragging the timeline
                    function updateTodayLine() {
                        d3.select(".todayTriangle").attr("transform", "translate(" + (x(currDate) - 20) + ", 59)")
                        d3.select(".todayLine").attr("x1", x(currDate) - 20)
                                .attr("x2", x(currDate) - 20);

                        d3.select(".todayLineText").attr("x", x(currDate) - 38)
                                                .attr("width", 10);
                    }

                    //Change brush & update Graph
                    //Today Button: Moves the brush (while maintaining width) so that the 'today line' aligns with the left edge of the 'scrubber'
                    //2 Years, 5 Years, & 6 months: Resizes the brush while maintaing the center point
                    function timeButtonClicked(d) {
                        var elem = d3.select(this);
                        var id = elem.attr("id");
                        var left = brush.extent()[0];
                        var right = brush.extent()[1];

                        var one_day = 1000 * 60 * 60 * 24;
                        var d1 = left.getTime();
                        var d2 = right.getTime();

                        var diff = (d1 - d2) / 2;
                        var centerDate = left.getTime() - diff;

                        if (elem.attr("class").indexOf("active") >= 0) {
                            elem.attr("class", "");
                        }
                        else {
                            d3.selectAll('ul.time-list li').attr("class", "");
                            elem.attr("class", "active");
                            switch (id) {
                                case "twoYears":
                                    d3.select('rect.scrubber').attr("x", 938);
                                    left.setTime(centerDate + (one_day * 365));
                                    right.setTime(centerDate - (one_day * 365));
                                    break;
                                case "fiveYears":
                                    left.setTime(centerDate + (one_day * 365 * 2.5));
                                    right.setTime(centerDate - (one_day * 365 * 2.5));
                                    break;
                                case "sixMonths":
                                    d3.select('rect.scrubber').attr("x", 960);
                                    left.setTime(centerDate + (one_day * 365 / 4));
                                    right.setTime(centerDate - (one_day * 365 / 4));
                                    break;
                                case "todayButton":
                                    var diff2 = right.getTime() - left.getTime();
                                    if (diff2 >= 107227274850) {
                                        right = x.invert(w);
                                        left.setTime(right.getTime() + diff2);
                                        d3.select('rect.scrubber').attr("x", function () {
                                            return d3.select('line.todayLine').attr("x1");
                                        });
                                    }
                                    else {
                                        var w1 = 1100 - d3.select("rect.scrubber").attr("x"); //calculate offset so that the today line is aligned with the scrubber
                                        w1 = x(currDate) + w1;
                                        left.setTime(x.invert(w1));
                                        right.setTime(left.getTime() + (diff * 2));
                                    }
                                    break;
                                default:
                                    console.log("not sure how I got here");
                            }
                            var tx1 = x2(right);
                            var tx2 = x2(left);
                            if (tx1 < 127) {
                                tx2 += 127 - tx1;
                                tx1 = 127;
                            }
                            if (tx2 > 1120) {
                                tx1 += 1120 - tx2;
                                tx2 = 1120;
                            }
                            d3.select(".extent").attr("x", tx1);
                            brush.extent([x2.invert(tx1), x2.invert(tx2)]);
                            x.domain(brush.extent());
                            brushed();
                            context.select('g.x.brush').call(brush);
                        }
                    }


                    d3.selectAll('ul.time-list li').on("click", timeButtonClicked);
                    //should there be something here?
                }

                d3.select('#prescriptiontimelinedetail').on('keydown', function () {
                    var keyCode = d3.event.keyCode;
                    var offset = 10;
                    if (keyCode == 38) {
                        // UP -- scroll up (e.g. dragging the bar on the right)
                        var yVal = scrollBar.select(".vScroller").attr("y") * 1 - offset;
                        if (yVal < 55)
                            yVal = 55;
                        else if (yVal > (593 - scrollBar.select(".vScroller").attr("height") * 1))
                            yVal = (593 - scrollBar.select(".vScroller").attr("height") * 1);
                        var deltaY = scrollBar.select(".vScroller").attr("y") * 1 - yVal;
                        scrollBar.select(".vScroller").attr("y", yVal);
                        updateOnScroll(deltaY);
                    }
                    else if (keyCode == 40) {
                        // DOWN -- scroll down (e.g. dragging the bar on the right)
                        var yVal = scrollBar.select(".vScroller").attr("y") * 1 + offset;
                        if (yVal < 55)
                            yVal = 55;
                        else if (yVal > (593 - scrollBar.select(".vScroller").attr("height") * 1))
                            yVal = (593 - scrollBar.select(".vScroller").attr("height") * 1);
                        var deltaY = scrollBar.select(".vScroller").attr("y") * 1 - yVal;
                        scrollBar.select(".vScroller").attr("y", yVal);
                        updateOnScroll(deltaY);

                    }
                    else if (keyCode == 37) {
                        // Left -- move time scrubber to the left (drag)
                        var dir = -offset;
                        var tx1 = x2(brush.extent()[0]) + dir;
                        var tx2 = x2(brush.extent()[1]) + dir;
                        //dir = d3.select(".extent").attr("x")*1+dir;
                        if (tx1 < 127) {
                            tx2 += 127 - tx1;
                            tx1 = 127;
                        }
                        if (tx2 > 1120) {
                            tx1 += 1120 - tx2;
                            tx2 = 1120;
                        }
                        d3.select(".extent").attr("x", tx1);
                        brush.extent([x2.invert(tx1), x2.invert(tx2)]);
                        x.domain(brush.extent());
                        brushFunc();

                    }
                    else if (keyCode == 39) {
                        // Right -- move time scrubber to the right (drag)
                        var dir = offset;
                        var tx1 = x2(brush.extent()[0]) + dir;
                        var tx2 = x2(brush.extent()[1]) + dir;
                        //dir = d3.select(".extent").attr("x")*1+dir;
                        if (tx1 < 127) {
                            tx2 += 127 - tx1;
                            tx1 = 127;
                        }
                        if (tx2 > 1120) {
                            tx1 += 1120 - tx2;
                            tx2 = 1120;
                        }
                        d3.select(".extent").attr("x", tx1);
                        brush.extent([x2.invert(tx1), x2.invert(tx2)]);
                        x.domain(brush.extent());
                        brushFunc();

                    }
                    else if (keyCode == 187) {
                        // + -- Zooming In - make time scrubber larger (scrolling)	
                        var zScale = .9;
                        //console.log(zScale)
                        var mid = (x2(brush.extent()[1]) - x2(brush.extent()[0])) / 2 + x2(brush.extent()[0]);
                        var zWidth = (x2(brush.extent()[1]) - x2(brush.extent()[0])) * zScale;

                        var ts1 = mid - zWidth / 2;
                        var ts2 = mid + zWidth / 2;

                        if (zWidth > x2(minDate.setMonth(minDate.getMonth() + 1)) - 126) {
                            if (ts1 < 127)
                                ts1 = 127;

                            if (ts2 > 1120)
                                ts2 = 1120;

                            d3.select(".extent").attr("x", ts1);
                            d3.select(".extent").attr("width", zWidth);

                            brush.extent([x2.invert(ts1), x2.invert(ts2)])
                            x.domain(brush.extent());
                            brushFunc();
                        }
                        minDate.setMonth(minDate.getMonth() - 1);
                        zoom.scale(1)
                    }
                    else if (keyCode == 189) {
                        // - -- Zooming our - make the time scrubber smaller (scrolling)
                        var zScale = 1.1;
                        //console.log(zScale)
                        var mid = (x2(brush.extent()[1]) - x2(brush.extent()[0])) / 2 + x2(brush.extent()[0]);
                        var zWidth = (x2(brush.extent()[1]) - x2(brush.extent()[0])) * zScale;

                        var ts1 = mid - zWidth / 2;
                        var ts2 = mid + zWidth / 2;

                        if (zWidth > x2(minDate.setMonth(minDate.getMonth() + 1)) - 126) {
                            if (ts1 < 127)
                                ts1 = 127;

                            if (ts2 > 1120)
                                ts2 = 1120;

                            d3.select(".extent").attr("x", ts1);
                            d3.select(".extent").attr("width", zWidth);

                            brush.extent([x2.invert(ts1), x2.invert(ts2)])
                            x.domain(brush.extent());
                            brushFunc();
                        }
                        minDate.setMonth(minDate.getMonth() - 1);
                        zoom.scale(1)
                    }
                });
                $scope.$watch(attrs.watchMe, function (newValue, oldValue) {
                    if (newValue > 0) {
                        renderTimeLine();
                    }
                });
            }
        };
    });

})();