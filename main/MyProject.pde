// Class: CS ???? 
// Semester: Fall ??
// Project number: ??
// Project title: ??
// Student(s):

//======================= My global variables
PImage PictureOfStudent1, PictureOfStudent2; // picture of students' faces: data/pic1.jpgand data/pic2.jpg

boolean lerp=true, spiral=true; // toggles to display vector interpoations
float b=0, c=0.5, d=1; // initial knots
int partShown = 2;
String [] PartTitle = new String[10];


int numberOfParts = PartTitle.length;
PNTS DrawnPoints = new PNTS(); // class containing array of points, used to standardize GUI
PNTS SmoothenedPoints = new PNTS(); // class containing array of points, used to standardize GUI
DUCKS DucksRow = new DUCKS(20);

//**************************** My text  ****************************
String title ="CS6491, Spring 2022, Project 1";            
Boolean team=true; // if team of 2 students
String name ="First2 LASTNAME2, First1 LASTNAME1";
//String name ="Student: MyFirstName MY-LAST-NAME";

String subtitle = "Playing with points and vectors";    
String guide="MyProject keys: '0' through '9' to select project parts, 'a' to start/stop animation "; // help info

//======================= my setup, executed once at the beginning 
void mySetup()
  {
  DrawnPoints.declare(); // declares all ControlPoints. MUST BE DONE BEFORE ADDING POINTS 
  SmoothenedPoints.declare(); // declares all ControlPoints. MUST BE DONE BEFORE ADDING POINTS 
  DrawnPoints.empty(); // reset pont list P
  SmoothenedPoints.empty(); // reset pont list P
  //initDucklings(); // creates Ducling[] points
  }

//======================= called in main() and executed at each frame to redraw the canvas
void showMyProject(PNT A, PNT B, PNT C, PNT D, PNT E, PNT F) // four points used to define 3 vectors
  {
  if(0<=partShown && partShown<numberOfParts)
    {
    switch(partShown) 
      {
      case 0: showPart0(A,B,C,D,E,F); break;
      case 1: showPart1(A,B,C,D,E,F); break;
      case 2: showPart2(A,B,C,D,E,F); break;
      case 3: showPart3(A,B,C,D,E,F); break;
      case 4: showPart4(A,B,C,D,E,F); break;
      case 5: showPart5(A,B,C,D,E,F); break;
      case 6: showPart6(A,B,C,D,E,F); break;
      case 7: showPart7(A,B,C,D,E,F); break;
      case 8: showPart8(A,B,C,D,E,F); break;
      case 9: showPart9(A,B,C,D,E,F); break;
      }
    }
  }

//====================================================================== PART 0
void showPart0(PNT A, PNT B, PNT C, PNT D, PNT E, PNT F) //
  {
  PartTitle[0] =    "sandbox"; 
  guide=" ";
  cw(black,4); showLoop(A,B,C); cw(grey,4);  showLoop(D,E,F);
  
  A.circledLabel("A"); B.circledLabel("B"); 
  C.circledLabel("C"); D.circledLabel("D");
  E.circledLabel("E"); F.circledLabel("F");

  }

//====================================================================== PART 1
void showPart1(PNT A, PNT B, PNT C, PNT D, PNT E, PNT F) //    
  {
  PartTitle[1] =    "Triangle Split"; 
  guide=" ";
 
  cw(black,4); showLoop(A,B,C); // shows triangle in black

  float area = triangleArea(A,B,C);  // computes area of triangle (not used, yet)

  float ab = d(A,B), bc = d(B,C), cd = d(C,D); // cpomputes edge lengths
  
  //midLine(A,B,C);
  //midLine(B,C,A);
  //midLine(C,A,B);
  midLinePlus(A,B,C);
  midLinePlus(B,C,A);
  midLinePlus(C,A,B);
  

  
  
  
  //if(ab>bc && ab>cd) splitMedian(C,A,B); // if edge A2B is longest, splits using median from C
  //   else if (bc>cd) splitMedian(A,B,C);
  //              else splitMedian(B,C,A);
                
  // ?????

  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); // shows names of the vertices
  }
  
void midLine(PNT A, PNT B, PNT C)
{
  VCT AB = V(B,A);
  VCT CB = V(B,C);
  VCT norm_AB = AB.normalize();
  VCT norm_CB = CB.normalize();
  
  AB = V(B,A);
  CB = V(B,C);
  
  VCT v_B = V(B.x, B.y);
  
  float a = det(norm_AB, norm_CB);
  float b = det(v_B, norm_CB) + det(norm_AB, v_B);
  float c = -0.5 * det(AB, CB);
  
  float s = (-b - sqrt(b*b - 4 * a * c)) / (2 * a);
  
  VCT diff_AB = norm_AB.scaleBy(s);
  VCT diff_CB = norm_CB.scaleBy(s);
  
  PNT p1 = P(B.x+diff_AB.x, B.y+diff_AB.y);
  PNT p2 = P(B.x+diff_CB.x, B.y+diff_CB.y);
  show(p1, p2);
  
  println("-----");
  println(A.x, A.y);
  println(B.x, B.y);
  println(C.x, B.x);
  println("-");
  println(AB.x, AB.y);
  println(CB.x, CB.y);
  println("-");
  println(a);
  println(b);
  println(c);
  println(s);
}

void midLinePlus(PNT A, PNT B, PNT C)
{
  VCT AB = V(B,A);
  VCT CB = V(B,C);
  VCT norm_AB = AB.normalize();
  VCT norm_CB = CB.normalize();
  
  AB = V(B,A);
  CB = V(B,C);
  
  VCT v_B = V(B.x, B.y);
  
  float a = det(norm_AB, norm_CB);
  float b = det(v_B, norm_CB) + det(norm_AB, v_B);
  float c = -0.5 * det(AB, CB);
  
  float s = sqrt(d(A,B)*d(C,B)/2);
  //float t = d(A,B)*d(C,B)/(2*s)
  
  VCT diff_AB = norm_AB.scaleBy(s);
  VCT diff_CB = norm_CB.scaleBy(s);
  
  PNT p1 = P(B.x+diff_AB.x, B.y+diff_AB.y);
  PNT p2 = P(B.x+diff_CB.x, B.y+diff_CB.y);
  show(p1, p2);
  
  println("-----");
  println(A.x, A.y);
  println(B.x, B.y);
  println(C.x, B.x);
  println("-");
  println(AB.x, AB.y);
  println(CB.x, CB.y);
  println("-");
  println(a);
  println(b);
  println(c);
  println(s);
}


void splitMedian(PNT A, PNT B, PNT C)
  {
  PNT M = P(B,C);      // M midpoint between B and C
  cw(dgreen,5); show(A,M); // draws segment from A to M in green of thickness 5
  float Lm = d(A,M); // computes length of the cut
  rect(1,150,Lm,10); // shows length as horizontal bar (for ease of comparison)
  label(100+Lm,150,"Lm = "+nf(Lm,1,2),dgreen); // writes length next to the bar
  }



//====================================================================== PART 2
void showPart2(PNT C1, PNT C2, PNT C3, PNT P1, PNT P2, PNT P3) //   
  {
  PartTitle[2] = "Bent caplet"; 
  guide=" ";
  float r1=d(C1,P1), r2=d(C2,P2), r3=d(C3,P3); // the radii of the 3 circles (center Ci, through point Pi)
  
  VCT T12 = R(U(C1,P1)); // Unit tangent to Circle1 at P1
                 
  // ?????

  // shows the 3 circles in different colors
  cw(magenta,4); show(C1,r1); 
  cw(lime,4); show(C2,r2); 
  cw(cyan,4); show(C3,r3); 

  if(showIDs) // diabled by pressing toggle key 'I'
    {  
    cwf(grey,6); show(P1,V(100,T12),"T12"); // shows labelled tangent vector scaled by 100 for visibility
 
    C1.circledLabel("C1"); P1.circledLabel("P1"); // shows labelled control points (animated using arrows)
    C2.circledLabel("C2"); P2.circledLabel("P2");
    C3.circledLabel("C3"); P3.circledLabel("P3");
    }
  }
  


//====================================================================== PART 3
void showPart3(PNT A, PNT B, PNT C, PNT D, PNT E, PNT F) //    
  {
  PartTitle[3] = "Free"; 
  guide=" ";
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }


//====================================================================== PART 4
void showPart4(PNT A, PNT B, PNT C, PNT D, PNT E, PNT F) //    
  {
  PartTitle[4] =   "Log-spiral pattern"; // https://pin.it/7wgYDeq 
  guide="  ";
  cwF(red,3); show(A,B,C);
  cwF(blue,3);
  drawSpiral(A,B,C,60);
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); //D.writeLabel("D");
  }

void drawSpiral(PNT A, PNT B, PNT C, int recursionCount)
  {
  if(recursionCount==0) return;
  PNT D = extrapolateLogSpiral(A,B,C);
  // ????
  }
  
PNT extrapolateLogSpiral(PNT A, PNT B, PNT C)
  {
  VCT AB = V(A,B);
  VCT BC = V(B,C);
  // ????
  return P(   );
  }

//====================================================================== PART 5
void showPart5(PNT A, PNT B, PNT C, PNT D, PNT E, PNT F) //    
  {
  PartTitle[5] =   "Michell truss";
  guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  int k=11, r=11;
  PNT[][] T = new PNT[r][k];
  PNT O = ScreenCenter();
  VCT V = V(O,A);
  for(int i=0; i<k; i++) T[0][i]=P(O,R(V,TWO_PI*i/k));
  cw(green,2);
  
  
  // six lines of code
  
  
 
  //A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }
  
//====================================================================== PART 6
int recursionDepth=9;  
void showPart6(PNT A, PNT B, PNT C, PNT D, PNT E, PNT F) //    
  {
  PartTitle[6] =   "Recursive tree growth";
  guide=" ";
  //A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }

  
  
//====================================================================== PART 7
void showPart7(PNT A, PNT B, PNT C, PNT D, PNT E, PNT F) //    
  {
  PartTitle[7] =   "Cubic interpolating motion";
  guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  cwF(cyan,5); show(A,B,C,D);
  cwF(red,3); drawNeville(A,B,C,D);
 
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }

void drawNeville(PNT A, PNT B, PNT C, PNT D)
  {
  beginShape();
  // ???    
  endShape();
  }

  
//====================================================================== PART 8
void showPart8(PNT A, PNT B, PNT C, PNT D, PNT E, PNT F) //    
  {
  PartTitle[8] =   "Polyline smoothing";
  guide="f:iterate smoothing, I:show/hide IDs, A:will CRASH if you delete too many points!";
  cwF(black,3); ControlPoints.drawPolyline(); // draws polyline joining control points
  ControlPoints.drawAllVerticesInColor(3,red); // draw dots at vertices
  //if(showIDs) {cwF(blue,1); ControlPoints.writeIDsInEmptyDisks(); }
  cwF(red,1); ControlPoints.showPickedPoint(25);
  int n = ControlPoints.pointCount();
  if(keyPressed && key=='f' && n>4)
    {
    // ???
    }
  //A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }
    
//====================================================================== PART 9
void showPart9(PNT A, PNT B, PNT C, PNT D, PNT E, PNT F) //    
  {
  PartTitle[9] =   "Smoothing while I draw";
  guide="Place. Press RMB to erase&start. Hold LMB & drag. Wait till all ducks arrive. Release.";
  PNT SmoothP = DucksRow.move(Mouse());
  if(mousePressed && (mouseButton == RIGHT))
    {
    DrawnPoints.empty(); 
    SmoothenedPoints.empty(); 
    DucksRow.init(Mouse());
    }
  if(mousePressed && (mouseButton == LEFT))
    {
    DrawnPoints.addPoint(Mouse()); 
    SmoothenedPoints.addPoint(SmoothP); 
    }
  cwF(orange,1); DrawnPoints.drawCurve();
  cwF(blue,5); SmoothenedPoints.drawPolylineWithGaps(); // SmoothenedPoints.drawCurve(); 
  DucksRow.showRow();
  }
  
  


    
//======================= called when a key is pressed
void myKeyPressed()
  {
  //int k = int(key); if(47<k && k<58) partShown=int(key)-48;
  if(key=='<') {DucksRow.decrementCount(); }
  if(key=='>') {DucksRow.incrementCount(); }
  }
  
//======================= called when the mouse is dragged
void myMouseDragged()
  {
  if (keyPressed) 
    {
    //if (key=='b') b+=2.*float(mouseX-pmouseX)/width;  // adjust knot value b    
    //if (key=='c') c+=2.*float(mouseX-pmouseX)/width;  // adjust knot value c    
    //if (key=='d') d+=2.*float(mouseX-pmouseX)/width;  // adjust knot value a 
    }
  }

//======================= called when the mouse is pressed 
void myMousePressed()
  {
  if (!keyPressed) 
    {
    if(partShown==2 || partShown==3)
      {
      }
    }
  }
  
