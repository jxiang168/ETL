package Principles.P01SingleResponsibility;

/**
 * @Description
 * @Author eric_ou
 * @Date
 */
public class PoorCar {
    // Improve: Split Car into Beeper and Wheels, and compose a Car.
    // In this case, you do not need to modify Car, and adjust Beeper and Wheels seperately.
    private Beeper beeper;
    private Wheels wheels;

    PoorCar() {
        this.beeper = new Beeper();
        this.wheels = new Wheels();
    }

    public void beep () {
        this.beeper.beep();
    }
    public void run () {
        this.wheels.run();
    }

    class Beeper {
        public void beep() {
            //System.out.println("Beep beep!");
            System.out.println("Buu buu!");
        }
    }

    class Wheels {
        public void run() {
            //System.out.println("Wooooooo~");
            System.out.println("Tututututu~");
        }
    }

    public static void main(String[] args) {
        GoodCar goodCar = new GoodCar();
        goodCar.beep();
        goodCar.run();
    }
}

