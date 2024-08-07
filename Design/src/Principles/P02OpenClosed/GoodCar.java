package Principles.P02OpenClosed;

public class GoodCar {
    /**
     * Extract an interface beeepable and implements with different class
     * can add different beep sound without altering class Car
     */
    public Beepable beeper;
    public void beep() {
        this.beeper.beep();
    }

    interface Beepable {
        void beep();
    }

    class BeepBeeper implements Beepable {
        @Override
        public void beep() {
            System.out.println("Beep beep!");
        }
    }

    class BooBeeper implements Beepable{
        @Override
        public void beep() {
            System.out.println("Boo boo!");
        }
    }

    public static void main(String[] args) {
        GoodCar goodCar = new GoodCar();
        goodCar.beeper = goodCar.new BeepBeeper();
        goodCar.beep();
    }
}
