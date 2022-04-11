public class CorporateHolder {
    private String contact;

    public CorporateHolder(int ID, String address, String contact) {
        // idk id and address
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
