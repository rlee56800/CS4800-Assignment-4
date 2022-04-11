package Number5;
public class Account {
    AccountHolder holder;
    double balance = 0.0;

    public Account(double amt, AccountHolder holder) {
        balance = amt;
        this.holder = holder;
    }

    public double deposit(double amt) {
        balance += amt;
        return balance;
    }

    public double withdraw(double amt) {
        balance -= amt;
        return balance;
    }

    public double getBalance() {
        return balance;
    }

    public AccountHolder getHolder() {
        return holder;
    }

    public void setBalance(double amt) {
        balance = amt;
    }

    public void setHolder(AccountHolder holder) {
        this.holder = holder;
    }
}
