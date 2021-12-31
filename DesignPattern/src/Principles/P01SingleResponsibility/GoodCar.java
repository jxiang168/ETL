package Principles.P01SingleResponsibility;

/**
 * @Description
 * @Author eric_ou
 * @Date
 */
public class GoodCar {
    // If you want to change beep and run behavior, you have to modify Car class
    public void beep () {
        //System.out.println("Beep beep!");
        System.out.println("Buu buu!");
    }
    public void run () {
        //System.out.println("Wooooooo~");
        System.out.println("Tututututu~");
    }

    public static void main(String[] args) {
        GoodCar goodCar = new GoodCar();
        goodCar.beep();
        goodCar.run();
    }
}

