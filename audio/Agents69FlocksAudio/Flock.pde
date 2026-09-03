class Flock{
  ArrayList<Bird> bs ;
  
  Flock(){
    bs = new ArrayList<Bird>();
  }
  void run(float a_){
    for(Bird b: bs){
      b.run(bs,a_);
    }
  }
  
  void addBird(Bird b_){
    bs.add(b_);
  }
}
