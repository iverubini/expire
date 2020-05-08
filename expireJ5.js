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

let micro;

let x=150;
let y=150;
let a = 0; 
let t; 
let tt;


function setup(){
  createCanvas(w=windowWidth, h=windowHeight);
  background(50, 200, 100);
  frameRate(100);
  noStroke();  
  micro = new p5.AudioIn();
  micro.start();
}

function draw(){
  noStroke();
  
  y1= year();
  m1= month();
  day1= day();
  h11= hour();
  minu1= minute();
  sec=second();

  let r=random(10, 60);
  let voz=micro.getLevel()*800;
  a=a+0.1; //qto menor, mais espaçada/suave fica a curva
  x=x+random(0,9); 
  let fala=micro.getLevel()*200;
  
  print(micro.getLevel(0));

  //if (voz>3) {print(fala);}
 
  fill(random(90, 255)+2*fala, 30+20*fala, random(50,100)+2.5*fala, 100);
  
  if(mouseIsPressed){ beginShape();
    vertex (mouseX+fala*8, mouseY+fala*10);
    vertex(mouseX, mouseY);
    vertex (mouseX+100*sin(fala), mouseY + 90*cos(fala));
    vertex (mouseX+fala*12, mouseY+10*cos(fala));
    endShape();
  } 

 

  //fill(150, fala*1.2, 150, 120);
  //ellipse(x, y+r*sin(a), fala*5, fala*5);
  //fill(voz*100, 120);
  //ellipse(x, y+r*sin(a), fala*5, fala*5);
  //fill(255-fala, 200);
  //ellipse(x, y+r*sin(a), fala*5, fala*5);
  fill(fala*50, fala*2, fala*60);
  ellipse(x, y+r*sin(a), fala*4.2, fala*4.2);
  fill(255, 150);
  ellipse(x+r*cos(a), y+r*sin(a), fala*3, fala*3);
  fill(0, 180);
  ellipse(x+r*cos(a), y+r*cos(a), fala*2, fala*2);
 
  if(x > (w - 50)) { x=50; y=y+120;} //cria uma linha
  if(frameCount > random(250,400) ) { frameCount=0; x=x+150; } //espaçador
  if( y > 500) { x=100; y=-1000; frameCount=0;
  fill(50, 200, 100); rect(0,0, width, height);}
  if (y < 0) { x=100; y=y+120;}
  
  //print(voz);
  //print ("outro")
  //print(micro.getLevel(1));

  }

//function touchStarted() {
//  getAudioContext().resume()
//}
  
