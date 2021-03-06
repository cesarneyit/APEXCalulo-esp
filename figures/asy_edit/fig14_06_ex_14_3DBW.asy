import graph3;
import apexstyle;


//ASY file for 

size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(17,17,11);
defaultrender.merge=true;


usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={-1,1};
real[] myzchoice={-1,1};
defaultpen(0.5mm);
pair xbounds=(-1.25,1.25);
pair ybounds=(-1.25,1.25);
pair zbounds=(-1.25,1.25);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the parabola z=y^2 for t from -2 to 2
triple g(real t) {return (sqrt(3)/2*cos(t),sqrt(3)/2*sin(t),.5);}
path3 mypath=graph(g,0,2pi,operator ..); draw(mypath,rgb(.3,.3,.3));

//Draw the cylinder z=y^2
triple f(pair t) {
  return (sin(t.x)*cos(t.y),sin(t.x)*sin(t.y),cos(t.x));
}
surface s=surface(f,(pi/3,0),(pi,2pi),8,8,Spline);
pen p=rgb(0,0,.7);
draw(s,emissive(surfacepen),meshpen=apexmeshpen);



//Draw the cylinder z=y^2
triple f(pair t) {
  return (t.y*sqrt(3)/2*cos(t.x),t.y*sqrt(3)/2*sin(t.x),.5);
}
surface s=surface(f,(0,0),(2pi,1),8,8,Spline);
pen p=rgb(0,0,.7);
draw(s,emissive(surfacepen),meshpen=apexmeshpen);







// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-2,2,operator ..);

//pen p=rgb(0,0,1);
//draw(s,palergb(.3,.3,.3)+opacity(.5),meshpen=p,render(merge=true));

//draw(s,palergb(.3,.3,.3));
//draw(s,lightrgb(.3,.3,.3),meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+rgb(.3,.3,.3));