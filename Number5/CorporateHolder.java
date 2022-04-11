package Number5;
import java.util.Random;

public class CorporateHolder extends AccountHolder {
    private String contact;

    public CorporateHolder(int ID, String address, String contact) {
        super(ID, address);
        this.contact = contact;
    }

    public int getNextID() {
        Random rand = new Random();
        return rand.nextInt(1000000);
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }
}
