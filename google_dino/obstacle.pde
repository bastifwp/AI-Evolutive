class Obstacle{

    //Variables of the obstacle
    PVector pos;
    PVector vel;
    float obsWidth;
    float obsHeigth;


    Obstacle(float speed, float obsWidth, float obsHeigth){
        vel = new PVector(-speed, 0);
        this.obsWidth = obsWidth;
        this.obsHeigth = obsHeigth;
        pos = new PVector(width + 100, height/2 + 50);
    }

    void show(){
        fill(255, 0, 0);
        rect(pos.x, pos.y-obsHeigth, obsWidth, obsHeigth);
    }

    //This should only move to left by the speed
    void move(){
        pos.add(vel);
    }



}