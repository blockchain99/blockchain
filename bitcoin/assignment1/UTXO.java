package bitcoin1;
import java.util.Arrays;
//UTXO: Represents an unspent transaction output
//Contains the hash of the transaction from which it originates as well as 
//its index within that transaction. 

//We have included equals, hashCode, and compareTo functions in UTXO 
//that allow the testing of equality and comparison between two UTXOs 
//based on their indices and the contents of their txHash arrays.
/*
 * If you receive three transactions of 0.5 BTC, 1.0 BTC, and 0.2 BTC, your sum would be 1.7 BTC...
 * yet your inputs would still be the 0.5, 1.0, and 0.2 BTC. 
 * At no point does the independent transactions (inputs) destroy themselves 
 * and become the 1.7 BTC exclusively.
 */

public class UTXO implements Comparable<UTXO> {

    /** Hash of the transaction from which this UTXO originates */
    private byte[] txHash; // indicating the corresponding previous block(output) 

    /** Index of the corresponding output in said transaction */
    private int index;  //indicating the index of the corresponding previous block(output) 

    /**
     * Creates a new UTXO corresponding to the output with index <index> in the transaction whose
     * hash is {@code txHash}
     */
    public UTXO(byte[] txHash, int index) { //contain the corresponding output(in the perspective of previous block)
        this.txHash = Arrays.copyOf(txHash, txHash.length);
        this.index = index;
    }

    /** @return the transaction hash of this UTXO */
    public byte[] getTxHash() {
        return txHash;
    }

    /** @return the index of this UTXO */
    public int getIndex() {
        return index;
    }

    /**
     * Compares this UTXO to the one specified by {@code other}, considering them equal if they have
     * {@code txHash} arrays with equal contents and equal {@code index} values
     */
    public boolean equals(Object other) {
        if (other == null) {
            return false;
        }
        if (getClass() != other.getClass()) {
            return false;
        }

        UTXO utxo = (UTXO) other;
        byte[] hash = utxo.txHash; // hash of corresponding previous block(output) 
        int in = utxo.index;       // index of the instance of corresponding previous block(output) 
        if (hash.length != txHash.length || index != in)
            return false;
        for (int i = 0; i < hash.length; i++) {
            if (hash[i] != txHash[i])
                return false;
        }
        return true;
    }

    /**
     * Simple implementation of a UTXO hashCode that respects equality of UTXOs // (i.e.
     * utxo1.equals(utxo2) => utxo1.hashCode() == utxo2.hashCode())
     */
    public int hashCode() {
        int hash = 1;
        hash = hash * 17 + index;
        hash = hash * 31 + Arrays.hashCode(txHash);
        return hash;
    }

    /** Compares this UTXO to the one specified by {@code utxo} */
    public int compareTo(UTXO utxo) {
        byte[] hash = utxo.txHash;
        int in = utxo.index;
        if (in > index)
            return -1;
        else if (in < index)
            return 1;
        else {
            int len1 = txHash.length;
            int len2 = hash.length;
            if (len2 > len1)
                return -1;
            else if (len2 < len1)
                return 1;
            else {
                for (int i = 0; i < len1; i++) {
                    if (hash[i] > txHash[i])
                        return -1;
                    else if (hash[i] < txHash[i])
                        return 1;
                }
                return 0;
            }
        }
    }
}
