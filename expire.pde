
/*   

EXPIRE

Expire é um código em JavaScript de comandos básicos que permite registrar
frases, reflexões, cantorias e movimentos respiratórios em formas geométricas
abstratas.

Feito por Ive Rubini durante os encontros de Programação Recreativa
em Processing organizados por Diego de los Campos.

http://iverubini.hotglue.me
https://www.openprocessing.org/user/46850/
tiago.rubini@gmail.com


*/

import processing.pdf.*;
import ddf.minim.*;

Minim minim;
AudioInput in;

float x=100, y=100,a, t, tt;

int y1= year();
int m1= month();
int day1= day();
int h11= hour();
int minu1= minute();
int sec=second();


void setup (){
  
  size(800,600);
  beginRecord (PDF, y1+"-"+m1+"-"+day1+"-"+h11+"-"+minu1+"-"+sec+".pdf");
  background(50, 200, 100);
  frameRate(100);
  noStroke();
  minim = new Minim(this);
in = minim.getLineIn();

  
}

void draw (){
  
  noStroke();
  
  float r=random(10, 40);
  int i=in.bufferSize() - 1;
  float voz=in.left.get(i)*800+in.right.get(i)*800;
  a=a+0.2; //qto menor, mais espaçada/suave fica a curva
  x=x+random(0,3); 
  float fala=in.left.get(i)*100+in.right.get(i)*100;

  
 if (voz>3) {print(fala);}
 
 
  fill(random(18, 255), 30+10*fala, random(50, 100), 100);
  if(mousePressed){ beginShape();
  vertex (mouseX+fala, mouseY+fala);
  vertex(mouseX, mouseY);
  vertex (mouseX+30*sin(fala), mouseY + 45*cos(fala));
  vertex (mouseX+fala*10, mouseY+fala*10*cos(fala));
  endShape();
  } 

 
  
  fill(100, fala, 200, 30);
  ellipse(x, y+r*sin(a), fala, fala);
  fill(150, voz*1.2, 150, 60);
  ellipse(x, y+r*sin(a), fala, fala);
  fill(voz*100, 120);
  ellipse(x, y+r*sin(a), fala, fala);
  fill(255, 170);
  ellipse(x, y+r*sin(a), fala, fala);
  fill(voz*50, voz, voz*70, 240);
  ellipse(x, y+r*sin(a), fala, fala);
 
  
  if(x > 700) { x=100; y=y+120;} //cria uma linha
  if(frameCount > random(150,400) ) { frameCount=0; x=x+150; } //espaçador
  if( y > 500) { x=100; y=-1000; frameCount=0;
  //if(x<-20 &&y>500){ x=100; y=120; frameCount=0; 
  fill(50, 200, 100); rect(0,0, width, height);}
  if (y < 0) { x=100; y=y+120;}
  

  println(voz);
  
  }
  
    void keyPressed () {
  if (key == TAB ) {
  
  endRecord(); 
  beginRecord (PDF, year()+"-"+month()+"-"+day()+"-"+hour()+"-"+minute()+"-"+second()+".pdf");}
    } 
 
