class button{
  int x;
  int y;
  color c;
  String text;
  button(int _x, int _y, color _c, String _text){
    x = _x;
    y = _y;
    c = _c;
    text = _text;
  }
   
   void drawButton(){
     fill(c);
     rect(x,y,100,50);
     fill(0);
     textAlign(CENTER);
     text(text,x+50,y+27.5);
   }
}
