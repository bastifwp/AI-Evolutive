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
            directions[i] = PVector.fromAngle(randomAngle); //We create a vector from an angle
        }

    }


    Brain clone(){
        Brain clone = new Brain(directions.length);

        for(int i = 0; i < directions.length; i++){
            clone.directions[i] = directions[i].copy();
        }

        return clone;
    }

    void mutate(){
        float mutationRate = 0.01; //Chance of a direction to be mutated
        for(int i = 0; i < directions.length; i++){
            float rand = random(1);
            if(rand < mutationRate){
                //We must mutate the current direction. The mutation will be select a new random direction
                float randomAngle = random(2*PI);
                directions[i] = PVector.fromAngle(randomAngle);
            }
        }

    }

}
