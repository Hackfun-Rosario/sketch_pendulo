
// posición inicial
float offset = 0.5; // desfase
// posición de origen con desfase (ox, oy) que emulan la posición (0, 0)
// (x, y) son las posiciones que se suman o restan a la de origen
float ox, oy, x, y;

// parámetros del péndulo (longitud de la cadena y radio del peso)
int len, rad;

// logo... no shit. la imagen en svg (es shape, no image)
PShape logo;

void setup() {
  // definimos el tamaño de la imagen y el color (0 = negro) del fondo
  size(600, 800);
  background(0, 1.0);
  
  // definimos la posición inicial del péndulo, la longitud y el tamaño del peso/círculo
  ox = offset*width;
  oy = 0;
  len = int (height*0.87);
  rad = 128;
  
  // cargamos el archivo svg con el logo
  logo = loadShape("./logo.svg");
}

void draw() {
  // llenamos el background con transparencia para generar un efecto de fantasmeo
  noStroke(); // quitamos el trazo
  fill(0, 0, 0, 25); // ponemos imagen negra con 10% de transparencia
  rect(0, 0, width, height); // dibujamos la recta desde 0,0 hasta el tamaño de la pantalla
 
  // shapes properties
  fill(0, 200, 0); // ponemos color de relleno
  stroke(0,200,0); // ponemos color del trazo 
  strokeWeight(16); // definimos tamaño del trazo
  
  // generamos movimiento del péndulo. (x,y) marca el punto en que se termina de dibujar la línea, y marca el centro del peso del péndulo
  x = sin(PI/47*(millis()/47))*0.23;
  y = cos(x);
  
  // dibujamos las formas
  line(ox, oy, ox+x*len, oy+y*len); // la cadena
  circle(ox+x*len, oy+y*len, rad*1.5); // el peso
  shape(logo, ox+x*len-rad, oy+y*len-rad, rad*2, rad*2); // el logo
}
