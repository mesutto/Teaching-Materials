
    let form = document.getElementById("info");

    form.addEventListener("submit", function (e) {

      e.preventDefault();

      var angle = Number(form.angle.value);
      var power = Number(form.power.value)/100;
      var negativeTorque = Number(form.friction.value)/1000;
      var canvas = document.getElementById("canvas");
      var dc  = canvas.getContext("2d");
      var mgnt = canvas.getContext("2d");
      var w = 0; //komik bir yama yaptým þimdilik eski versiyonda 170 derece verince diðer kutupta küçük salýným yapmasý lazýmdý

      var a = window.setInterval(function(){
        if (angle <= -90)
        {
          angle = angle + 180;
        }
        if (angle>=90)
        {
          angle = -(180-angle);
        }
        Torque =	-power*Math.sin((angle)*Math.PI/180);
        w = w + Torque*1;
        if (w>0){
          w = w - negativeTorque*1
        }
        if(w<0){
          w = w + negativeTorque*1
        }
        if(w === 0){
          w = 0;
        }
        angle = (angle + w*1) % 360;

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
        form.addEventListener("submit", function (e) {
        e.preventDefault();
        clearInterval(a);});
    }, 5);
    });

