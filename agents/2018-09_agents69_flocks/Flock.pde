class Flock{
  ArrayList<Bird> bs ;
  
  Flock(){
    bs = new ArrayList<Bird>();
  }
  void run(){
    for(Bird b: bs){
      b.run(bs);
    }
  }
  
  void addBird(Bird b_){
    bs.add(b_);
  }
}