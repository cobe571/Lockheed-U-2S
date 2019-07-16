# ========
# L'idée :
# ========
#
# Dès que toutes les pogos (index 2 et 3) ne touchent plus le sol et que la vitesse est supérieure
# à 50 kt forcer l'état remonté de 2 et 3 et créer un flag MP pour larguer les pogos
#
# POGOLACHES étant la variable à lier en MP permettra la gestion de submodel pour
# simuler le laché des pogos au décollage
#
#SI
#  /gear/gear[2]/wow = 0
#  /gear/gear[3]/wow = 0
#OU
#  POGOSLACHES = 1
#ALORS
#  /gear/gear[2]/position-norm = 0
#  /gear/gear[3]/position-norm = 0
#  POGOLACHES = 1
#FINSI
#
#The wings lift aound 50 kts : pilot's manual p85
var pogosRelease = func(){
     #print("wow2 ");
     if((getprop("/gear/gear[2]/wow")==0 and getprop("/velocities/airspeed-kt")>50) or getprop("/sim/multiplay/generic/int[6]")==0){
         #print("test");
         setprop("/gear/gear[2]/position-norm", 0);
         setprop("/sim/multiplay/generic/int[6]", 0);
         setprop("/sim/multiplay/generic/int[9]", 1);
     }else{settimer(pogosRelease,0.1);}
}
var pogosRelease2 = func(){
     #print("wow3 ");
     if((getprop("/gear/gear[3]/wow")==0 and getprop("/velocities/airspeed-kt")>50) or getprop("/sim/multiplay/generic/int[7]")==0){
         #print("test2");
         setprop("/gear/gear[3]/position-norm", 0);
         setprop("/sim/multiplay/generic/int[7]", 0);
         setprop("/sim/multiplay/generic/int[10]", 1);
     }else{settimer(pogosRelease2,0.1);}
}

var loop = func{
  pogosRelease();
  pogosRelease2();
}
loop();
