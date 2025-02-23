class Dino{

    //Some variables for the dinasour
    PVector pos;
    PVector vel;
    PVector acc;

    float dinoWidth;
    float dinoHeigth;
    float gravity;

    float bigJumpSpeed = -20;
    float smallJumpSpeed = -17;

    boolean jumping;

    Dino(float g) {
        pos = new PVector(width/3, height/2+50);
        vel = new PVector(0, 0);
        acc = new PVector(0, 0);

        gravity = g;    

        dinoWidth = 10;
        dinoHeigth = 50;
        jumping = false;

    }

    void show(){
        fill(0);
        rect(pos.x-dinoWidth, pos.y-dinoHeigth, 10, 50);
    }

 
    void jump(){
        //We change the 
        pos.add(vel);
        vel.add(acc);

        //If we are on the floor (or deeper) we restart jumping variables
        if(pos.y >= height/2+50){
            acc.y = 0;
            vel.y = 0;
            pos.y = height/2+50;

            jumping = false;

        }

        //Jumping condition
        if(keyPressed && !jumping){
            if(key == CODED){

                //Big jump
                if(keyCode == UP){
                    vel.y = bigJumpSpeed;
                    print("Big jump ");
                    jumping = true;

                }

                //Small jump
                if(keyCode == RIGHT){
                    vel.y = smallJumpSpeed;
                    print("Small Jump ");
                    jumping = true;
                }          

                //Should improve this so it knows if is touching ground
                if(jumping){
                    acc.y = gravity;
                }


            }


        }       

     

    }

}
