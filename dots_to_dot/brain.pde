//This class will set the acceleration

class Brain{
    PVector[] directions;
    int step = 0;

    //Constructor
    Brain(int size){
        directions = new PVector[size];
        randomize();
    }

    //First we want all the dots to move randomly so we will set all the directions random
    void randomize(){

        for(int i = 0; i < directions.length; i++){
            float randomAngle = random(2*PI);
            directions[i] = PVector.fromAngle(randomAngle);
        }

    }


}
