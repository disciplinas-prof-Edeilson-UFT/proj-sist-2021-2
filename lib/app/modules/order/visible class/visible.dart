class Visible {
  Visible(this.visible, this.test);
  bool visible;
  String test;

  void setVisible(){
    if(visible == false){
      visible = true;
    }else{
      visible = false;
    }
  }

  void setTest(){
    test = 'foi mudado';
  }

}