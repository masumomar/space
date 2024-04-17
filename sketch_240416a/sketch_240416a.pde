PFont f;

int pixelsize = 4;
int gridsize  = pixelsize * 7 + 5;

void setup() {
    background(191);
    noStroke();
    size(800, 550);
    f = createFont("Arial", 36, true);
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
fill(0);
   
   String[] sprite = new String[5];
   sprite[0] = "0010100";
   sprite[1] = "0110110";
   sprite[2] = "1111111";
   sprite[3] = "1111111";
   sprite[4] = "0111110";
for (int i = 0; i < sprite.length; i = i+1) {
  String row = (String) sprite[i];
  for (int j = 0; j < row.length(); j = j+1) {
    
if (row.charAt(j) == '1') {
                    rect(100+(j * pixelsize), 100+(i * pixelsize), pixelsize, pixelsize);
                }

  }
}  
fill(0);

        String[] enemySprite    = new String[5];
        enemySprite[0] = "0010100";
        enemySprite[1] = "0110110";
        enemySprite[2] = "1111111";
        enemySprite[3] = "1111111";
        enemySprite[4] = "0111110";
drawspaceship(enemySprite,180,180);
for(int i=0;i<25;i=i+1){
  for(int j=0;j<5;j=j+1){
    drawspaceship(enemySprite,i*32,j*24);
  }
}
}
