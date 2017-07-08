# blockchain
Blockchain lecture for ethreum, bitcoin programming, some images and articles are refereced from other web sites. Ethreum smart contract, solidity, Bitcoin technology.

#### What is Blockchain?
##### Blockchain is a decentralized distributed ledger (data structure) where data is being stored
##### inside blocks in form of transactions

Blockchain is a data structure, which is arrange of data in computer memory, for example Excel sheet, Google Doc and PDF files.
Suppose that we have a book, in which each page make reference for the previous page through a page number one less than a current page number. We can detect and identify the removal of a page when a page has been removed through the page number.

Also, we can detect the alteration of contents of specific page through page number.
If anyone changes the content of the page,  then the next page number will not match if we try to generate it using altered page content since the page number is produced by crunching the content of the previous page.    

Blockchain is in same shooses, each block is built on top of the recent block and use its
previous block’s content as a signature. Building a block & adding it in the Blockchain is the task of the miner nodes

* In public Blockchain it is made computationally difficult to add a block to prevent
attacks.
• Miners try to guess a number in such a way that if it gets crunched with the most
recent block’s fingerprint than it will create a new fingerprint which will be less that the
last/most recent block in the Blockchain.
• It takes time & computational power to add a Block in the Blockchain. Hence there is
some reward (25 BTC in case of Bitcoin Blockchain)
• Private Blockchain can chose other methods to add a block as they can trust the
miners using a contract etc.


## Installation and usage
Program is written in java, solidity. it one may need solidity shoulde be installed ( https://docs.continuum.io/anaconda/install ) or install python 2.7 and then install Numpy, Scipy, Pandas, matplotlib,jupyter manually as follows.
#### Remix
If you just want to try Solidity for small contracts, you can try Remix which does not need any installation. If you want to use it without connection to the Internet, you can go to https://github.com/ethereum/browser-solidity/tree/gh-pages and download the .ZIP file as explained on that page.

#### npm / Node.js
This is probably the most portable and most convenient way to install Solidity locally.

A platform-independent JavaScript library is provided by compiling the C++ source into JavaScript using Emscripten. It can be used in projects directly (such as Remix). Please refer to the solc-js repository for instructions.

It also contains a commandline tool called solcjs, which can be installed via npm:

> npm install -g solc

#### Docker
We provide up to date docker builds for the compiler. The stable repository contains released versions while the nightly repository contains potentially unstable changes in the develop branch.

> docker run ethereum/solc:stable solc --version

### Meta

Yoonsu Park - http://www.patternics.com Distributed under the MIT license. See LICENSE for more information( https://en.wikipedia.org/wiki/MIT_License ). https://github.com/blockchain99/blockchain
