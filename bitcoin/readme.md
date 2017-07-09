## What is Bitcoin?
### Bitcoin is Internet of money, a network for propagating value and securing the ownership of digital assets via distributed computation. 
###  Bitcoin consists of:
#### 1. A decentralized peer‐to‐peer network ﴾the bitcoin protocol﴿
#### 2. A public transaction ledger ﴾the blockchain﴿
#### 3. A set of rules for independent transaction validation and currency issuance ﴾consensus rules﴿
#### 4. A mechanism for reaching global decentralized consensus on the valid blockchain ﴾proof‐of‐work algorithm﴿

* Bitcoin Users can transfer bitcoin over the network to do just about anything that can be done with conventional currencies, including buy and sell goods, send money to people or organizations, or extend credit. Bitcoin can be purchased, sold, and exchanged for other currencies at specialized currency exchanges.

* Unlike traditional currencies, bitcoin are entirely virtual. There are no physical coins or even digital coins. The coins are
implied in transactions that transfer value from sender to recipient. Users of bitcoin own keys that allow them to prove
ownership of bitcoin in the bitcoin network. With these keys they can sign transactions to unlock the value and spend it by
transferring it to a new owner. Keys are often stored in a digital wallet on each user’s computer or smartphone. Possession of
the key that can sign a transaction is the only prerequisite to spending bitcoin, putting the control entirely in the hands of
each user.

* Bitcoin is a distributed, peer‐to‐peer system. As such there is no "central" server or point of control. Bitcoin are created
through a process called "mining," which involves competing to find solutions to a mathematical problem while processing
bitcoin transactions.

*  Any participant in the bitcoin network ﴾i.e., anyone using a device running the full bitcoin protocol stack﴿
may operate as a miner, using their computer’s processing power to verify and record transactions. Every 10 minutes on
average, someone is able to validate the transactions of the past 10 minutes and is rewarded with brand new bitcoin.
Essentially, bitcoin mining decentralizes the currency‐issuance and clearing functions of a central bank and replaces the need
for any central bank with this global competition.

* The bitcoin protocol includes built‐in algorithms that regulate the mining function across the network. The difficulty of the
processing task that miners must perform is adjusted dynamically so that, on average, someone succeeds every 10 minutes
regardless of how many miners ﴾and how much processing﴿ are competing at any moment. The protocol also halves the rate
at which new bitcoin are created every four years, and limits the total number of bitcoin that will be created to a fixed total
just below 21 million coins. The result is that the number of bitcoin in circulation closely follows an easily predictable curve
that approaches 21 million by the year 2140. Due to bitcoin’s diminishing rate of issuance, over the long term, the bitcoin
currency is deflationary. Furthermore, bitcoin cannot be inflated by "printing" new money above and beyond the expected
issuance rate.

## What is the big Challenges for Bitcoin ?
### 1. Creation of a virtual coin/note
 - How is it created in the first place? -> Solution : Provide incentives for miners
 - How do you prevent inflation? (What prevents anyone from creating lots of coins?) -> Solution : Limit the creation rate of the BitCoins

### 2. Validation
 - Is the coin legit? (proof-of-work) -> Solution : Use of Cryptographic Hashes
 - How do you prevent a coin from double-spending? -> Solution : Broadcast to all nodes

### 3. Buyer and Seller protection in online transactions
 - Buyer pays, but the seller doesn’t deliver
 - Seller delivers, buyer pays, but the buyer makes a claim. 
 
### 4. Trust on third-parties
 - Rely on proof instead of trust
 - Verifiable by everyone
 - No central bank or clearing house

## How to guarantee the sucure Bitcoin transaction?
### 1. Authentication
* Am I paying the right person? Not some other impersonator? 
* Solution : Public Key Crypto: Digital Signatures
![Key pair: public key and private key
]({{http://www.patternics.com}}/blockchain/image/encription.JPG)
* Public Key Crypto: Digital Signature
* Key pair: public key and private key

### 2. Integrity
* Is the coin double-spent? 
* Can an attacker reverse or change transactions?
* Soulution : Digital Signatures and Cryptographic Hash
![First, create a message digest using a cryptographic hash Then, encrypt the message digest with your private key]({{http://www.patternics.com}}/blockchain/image/digital_sig.JPG)
* First, create a message digest using a cryptographic hash 
![Cryptographic Hash Functions]({{http://www.patternics.com}}/blockchain/image/collision_res.JPG)
* Then, encrypt the message digest with your private key


### 3. Availability
* Can I make a transaction anytime I want?
* Solution : Broadcast messages to the P2P network

### 4. Confidentiality
* Are my transactions private? Anonymous? 
* Solution : Pseudonymity

## How to validate the legitimacy of coin and prevent double spending?
### 1. Is the coin legit? (proof-of-work) ->  Use of Cryptographic Hashes



![Cryptographic Hash Functions]({{http://www.patternics.com}}/blockchain/image/collision_res.JPG)
#### * Bitcoin guarantee the legitimacy of coin (proof-of-work) by Cryptographic Hash Functions.
* Consistent: hash(X) always yields same result
* One-way: given Y, hard to find X s.t. hash(X) = Y 
* Collision resistant: given hash(W) = Z, hard to find X such that hash(X) = Z 

### 2. How do you prevent a coin from double-spending? -> Broadcast to all nodes
#### * Bitcoin prevent the double-spending by Broadcasting to all nodes.


* Acknowledgement : 
Some of the slides, content, or pictures are borrowed from the following resources, and some pictures are obtained through Google search without being referenced below:
-L24-BitCoin and Security, many of the slides borrowed from this presentation with modifications. 
-Ian Miers, Zerocoin: Anonymous Distributed E-Cash from Bitcoin, IEE S&P slides
-Amir Houmansadr, CS660: Advanced Information Assurance Spring 2015


