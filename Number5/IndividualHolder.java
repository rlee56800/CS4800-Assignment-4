package Number5;
import java.util.Random;

public class IndividualHolder extends AccountHolder {
    private String name;
    private String SSN;

    public IndividualHolder(int ID, String address, String name, String SSN) {
        super(ID, address);
        this.name = name;
        this.SSN = SSN;
    }

    public int getNextID() {
        Random rand = new Random();
        return rand.nextInt(1000000);
    }

    public String getName() {
        return name;
    }

    public String getSSN() {
        return SSN;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSSN(String SSN) {
        this.SSN = SSN;
    }
}
