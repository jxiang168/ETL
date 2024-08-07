package Principles.P02OpenClosed;

public class PoorCar {
    /**
     * Poor car
     * To add a new sound you have to modify beep() method in Car class
     */
    enum BeepSound {
        BeepSound,BooSound
    }

    public BeepSound beepSound  ;

    public void beep() {
        switch (beepSound) {
            case BeepSound -> System.out.println("Beep Beep!");
            case BooSound -> System.out.println("Boo Boo!");
            default -> System.out.println("------!");
        }
    }

    public static void main(String[] args) {
        PoorCar poorCar = new PoorCar();
        poorCar.beepSound = BeepSound.BooSound;
        poorCar.beep();
    }

}
