PFont f;

int pixelsize = 4;
int gridsize  = pixelsize * 7 + 5;
Player blue;
int direction = 1 ;
// rückgabe typ 
boolean incresseY = false;
ArrayList enemies = new ArrayList();
      


void setup() {
  blue = new Player();
    background(0);
    noStroke();
    size(800, 550);
    f = createFont("Arial", 36, true);
      for (int i = 0; i<14; i= i+1){
    for (int j = 0; j<3; j= j+1){
      Enemy e = new Enemy(i*50+60,j*50+60);
      enemies.add(e);
    }
  } 
}

void drawspaceship(String sprite[], int x, int y ){
for (int i = 0; i < sprite.length; i = i+1) {
  String row = (String) sprite[i];
  for (int j = 0; j < row.length(); j = j+1) {
    
if (row.charAt(j) == '1') {
                    rect(x+(j * pixelsize), y+(i * pixelsize), pixelsize, pixelsize);
                }

  }
}
}


void draw(){
fill(155);
background(0);
blue.move();

   blue.drawspaceship();
   for (int i = 0; i < enemies.size (); i = i+1){
     Enemy e = (Enemy)enemies.get(i);
     if (e.outside()){
     direction = direction *(-1);
     incresseY = true;
     // sagt wir berechen ab sobald ein gegner gefunden ist 
     break;
     }
  
   }
   for (int i = 0; i < enemies.size(); i = i+1){
       Enemy e = (Enemy)enemies.get(i);
       e.move();
       e.drawspaceship();
       
   }
   incresseY = false;
   
fill(255,0,0);
}

int a=1;
int b=2;

int Plusrechnen(int x, int y){
  int Ergebnis = x+y;
  return Ergebnis;
} 

int Kommpletesergebnis= Plusrechnen(a,b);
int z = Plusrechnen(6,5);



class Player {
 int x;
 int y;
 String[] sprite;
 Player(){
   x = 355;      // position des schiffes gegeben 
   y = 465;      // position des schiffes gegeben 
   // darstellung des Raumschiffes
   sprite = new String[5];
   sprite[0] = "0010100";
   sprite[1] = "0110110";
   sprite[2] = "1111111";
   sprite[3] = "1111111";
   sprite[4] = "0111110";
 }
  // zeichnet das Raumschiff
 void drawspaceship(){
   for (int i = 0; i < sprite.length; i = i+1) {
     String row = (String) sprite[i];
     for (int j = 0; j < row.length(); j = j+1) {
      // buchstabe und zeichen an stelle j 
       if (row.charAt(j) == '1') {
         rect(x+(j * pixelsize), y+(i * pixelsize), pixelsize, pixelsize);
       }   // funktion mit argumente 
                    // blau ist eine funktion die durch die programiersprache bereitgestellt wird            
      }
    }
  }
  // tastenbewegung WSAD 
  void move(){
  if (keyPressed && key== 'a') {
    x= x-5;
    if( x<0){
      x=0;     
    }
  } 
  if(keyPressed && key=='d'){
    x= x+5;
    if(x>800){
      x=800-28;
  } }
  if(keyPressed && key=='w'){
    y= y-5;
    if(y<0){
    y=0;}
  }
  if(keyPressed && key== 's'){
   y= y+5;
  if( y > 550){
   y=550-20;
  }
}

  }
}
// gegner Pos zum bewegen 
class Enemy {
int x;
int y;
String[] sprite;
Enemy(int xpos, int ypos){
  x = xpos;
  y = ypos; 
   sprite = new String[5];
   sprite[0] = "1011101";
   sprite[1] = "0101010";
   sprite[2] = "1111111";
   sprite[3] = "0101010";
   sprite[4] = "1000001";
   
 }
  void drawspaceship(){
   for (int i = 0; i < sprite.length; i = i+1) {
     String row = (String) sprite[i];
     for (int j = 0; j < row.length(); j = j+1) {
      // buchstabe und zeichen an stelle j 
       if (row.charAt(j) == '1') {
         rect(x+(j * pixelsize), y+(i * pixelsize), pixelsize, pixelsize);
       }   // funktion mit argumente 
                    // blau ist eine funktion die durch die programiersprache bereitgestellt wird            
      }
    }
  }
  // gibt position an 
  void move() {
    if (frameCount % 60== 0) {
      // gibt die x position ein 
      x = x + (gridsize * direction);   
  }
  // wie die raumscheiffe sich nach unten bewegen und wie schnell oder langsam 
  if (incresseY) {
    y = y + (gridsize /2);}
  }

// funktion name (outside)
  boolean outside() {
    return x + (direction * gridsize) < 0 || x + (direction * gridsize) > width - gridsize;
}
}
