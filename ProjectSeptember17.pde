//PROJECT 4; SEPTEMBER 2017; DEVANSH KOTHARI

PImage player;
PImage endscreen;
PImage stadium;
PImage flag;
PImage victory;
int COUNT = 30;
float[] Xs = new float[COUNT];
float[] Ys = new float[COUNT];
float[] H = new float[COUNT];
float[] W = new float[COUNT];
boolean gameover= false;

void setup ()
{
  fullScreen();
  imageMode(CENTER);
  player = loadImage("player.png");
  player.resize(100, 100);
  stadium = loadImage("stadium.jpg");
  stadium.resize(width, height);
  endscreen = loadImage("endscreen.jpg");
  endscreen.resize(width, height);
  flag = loadImage("flag.png");
  flag.resize(100, 100);
  victory = loadImage("victory.jpg");
  victory.resize(width, height);
  for (int i=0; i <COUNT; i++)
  {
    Xs[i] = random(width);
    Ys[i] = random(height);
    H[i] = random(10, 70 );
    W[i] = random(5, 90);
  }
}

void draw() 
{
  background(stadium);
  image(flag, 1350, 50);
  image(player, mouseX, mouseY);
  for (int i=0; i<COUNT; i++)
  {
    fill(#2B2E2D);
    ellipse(Xs[i], Ys[i], H[i], W[i]);
    H[i]=H[i]+0.35;
    W[i]=W[i]+0.35;
    if (dist(mouseX, mouseY, Xs[i], Ys[i])<W[i]/2 && millis()/1000>3)
    {   
      gameover=true;
    }
  }
  fill(#FFFFFF);
  textSize(42);
  text(millis()/1000, 100, 100);

  if (dist(1350, 50, mouseX, mouseY)<30)
  {  
    background(victory);
  }
  if (gameover==true)
  {
    background(endscreen);
  }
}