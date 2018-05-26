    var d = document.getElementById('form');
    d.style.position = "absolute";
    d.style.left = 270+'px';
    d.style.top = 320+'px';
    let form = document.getElementById("info");
    form.addEventListener("submit", function (e) {
    e.preventDefault();
    var dps = []; // dataPoints
    var chart = new CanvasJS.Chart("chartContainer", {
      title :{
      text: "Torque time graph"
      },
      axisY: {
        includeZero: false
      },
      data: [{
        type: "line",
        dataPoints: dps
      }]
    });
    var xVal = 0;
    var yVal = 0;
    var updateInterval = 1000;
    var dataLength = 2000; // number of dataPoints visible at any point


      var velocityinfo = document.getElementById('velocityinfo');
      var imax = Number(form.imax.value);
      var inductance = 0.001;
      var coefficient = imax*imax*inductance; // more efficient rather than multipyling same thing every cycle
      var canvas = document.getElementById("canvas");
      var dc  = canvas.getContext("2d");
      var mgnt = canvas.getContext("2d");
      var wE = Number(form.wE.value);
      var wM = Number(form.wM.value);
      var w = wM;
      var delta = Number(form.delta.value)*Math.PI/180;
      var t = 0;
      var angle = Number(form.delta.value); // initial angle
      var updateChart = function (count) {
      	count = count || 1;
      	for (var j = 0; j < count; j++) {
      		yVal = Torque;
      		dps.push({
      			x: t,
      			y: Torque
      		});
      	}
      	if (dps.length > dataLength) {
      		dps.shift();
      	}
      	chart.render();
      };


        var a = window.setInterval(function(){
        Torque =	coefficient*Math.sin(2*(wM*t+delta))*(Math.cos(wE*t)*(Math.cos(wE*t)));
        w = w + Torque*1;
        angle = (angle + w*1) % 360; // no time - angular velocity formula
        velocityinfo.value= w;
        dc.clearRect(0, 0, canvas.width, canvas.height);
        mgnt.beginPath();
        mgnt.arc(110,200,125,8*(Math.PI)/12,4*(Math.PI)/12,true);
        mgnt.fillStyle = "#FF0000";
        mgnt.stroke();
        mgnt.closePath();
        mgnt.beginPath();
        mgnt.arc(110,200,125,-8*(Math.PI)/12,-4*(Math.PI)/12,false);
        mgnt.stroke();
        mgnt.closePath();
        dc.save();
        dc.fillStyle = "#000000";
        dc.translate(110,200);
        dc.rotate( angle*Math.PI/180 );
        dc.translate(-110,-200);

        dc.beginPath();
        dc.moveTo(100, 100);
        dc.lineTo(120, 100);
        dc.lineTo(120,300);
        dc.lineTo(100,300);
        dc.closePath();

        dc.fill();

        dc.restore();
        updateChart();
        t = t + 0.001;
        form.addEventListener("submit", function (e) {
        e.preventDefault();
        clearInterval(a);});
    }, 5);
});
