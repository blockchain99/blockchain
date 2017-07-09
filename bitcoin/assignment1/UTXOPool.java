package bitcoin1;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;
//represents the current set of outstanding UTXOs and contains a map from 
//each UTXO to its corresponding transaction output. 

/*
 * UTXO pool keeps track of all your unspent BTC (UTXO). In the example above, 
 * it would be the 0.5 BTC, 1.0 BTC, and 0.2 BTC, which is your unspent transaction output.
 *  When you do decide to spend a quantity of BTC, your Bitcoin wallet will utilize 
 *  your UTXOs as inputs for another transaction
 */
// UTXOPool class simply keeps track of the UTXOs
public class UTXOPool {

    /**
     * The current collection of UTXOs, with each one mapped to its corresponding transaction output
     */
    private HashMap<UTXO, Transaction.Output> H;

    /** Creates a new empty UTXOPool consist of UTXO, transaction output*/
    public UTXOPool() {
        H = new HashMap<UTXO, Transaction.Output>(); //key(UTXO), value(Transactiion.Output)
    }

    /** Creates a new UTXOPool that is a copy of {@code uPool} */
    public UTXOPool(UTXOPool uPool) {
        H = new HashMap<UTXO, Transaction.Output>(uPool.H);
    }

    /** Adds a mapping from UTXO {@code utxo} to transaction output @code{txOut} to the pool */
    public void addUTXO(UTXO utxo, Transaction.Output txOut) {
        H.put(utxo, txOut);
    }

    /** Removes the UTXO {@code utxo} from the pool */
    public void removeUTXO(UTXO utxo) {
        H.remove(utxo);
    }

    /**
     * @return the transaction output corresponding to UTXO {@code utxo}, or null if {@code utxo} is
     *         not in the pool.
     */
    public Transaction.Output getTxOutput(UTXO ut) {
        return H.get(ut);
    }

    /** @return true if UTXO {@code utxo} is in the pool and false otherwise */
    public boolean contains(UTXO utxo) {
        return H.containsKey(utxo);
    }

    /** Returns an {@code ArrayList} of all UTXOs in the pool */
    public ArrayList<UTXO> getAllUTXO() {
        Set<UTXO> setUTXO = H.keySet();
        ArrayList<UTXO> allUTXO = new ArrayList<UTXO>();
        for (UTXO ut : setUTXO) {
            allUTXO.add(ut);
        }
        return allUTXO;
    }
}
