class Flock{
  ArrayList<Bird> bs ;
  
  Flock(){
    bs = new ArrayList<Bird>();
  }
  void run(float f_){
    for(Bird b: bs){
      b.run(bs, f_);
    }
  }
  
  void addBird(Bird b_){
    bs.add(b_);
  }
}