<p>&nbsp;</p>
<p align="center">
<img src="https://github.com/terra-rebels/terra-dart/blob/main/img/terradart.png" width=300>
</p>

<p align="center">
The Dart SDK for Terra
</p>

![diagram](https://raw.githubusercontent.com/terra-money/terra.js/master/img/terrajs-diagram.png)

<br/>

<p align="center">
  <img alt="GitHub" src="https://img.shields.io/github/license/terra-money/terra.js">
  <img alt="npm (scoped)" src="https://img.shields.io/npm/v/@terra-money/terra.js">
</p>

<p align="center">
  <a href="https://docs.terra.money/docs/develop/sdks/terra-js/README.html"><strong>Explore the Docs »</strong></a>
  <br />
  <br/>
  <a href="https://docs.terra.money/docs/develop/sdks/terra-js/common-examples.html">Examples</a>
  ·
  <a href="https://terra-money.github.io/terra-dart/">API Reference</a>
  ·
  <a href="https://www.npmjs.com/package/@terra-money/terra-dart">Pubspec Package</a>
  ·
  <a href="https://github.com/terra-rebels/terra-dart">GitHub</a>
</p>

Terra-dart is a Dart SDK for writing applications that interact with the Terra blockchain from either the Web or Mobile, or Flutter environments and provides simple abstractions over core data structures, serialization, key management, and API request generation.

## Features

- **Written in Dart**, with type definitions
- Versatile support for [key management](https://docs.terra.money/docs/develop/sdks/terra-js/keys.html) solutions
- Works with Flutter, in the browser, and Mobile
- Exposes the Terra API through [`LCDClient`](https://docs.terra.money/docs/develop/sdks/terra-js/query-data.html)
- Parses responses into native Dart types

We highly suggest using terra-dart in a code editor that has support for type declarations, so you can take advantage of the helpful type hints that are included with the package.

## Installation

Grab the latest version off [NPM](https://www.npmjs.com/package/@terra-money/terra-dart):

```sh
npm install @terra-money/terra-dart
```

## Usage

terra-dart can be used in Node.js, as well as inside the browser. Please check the [docs](https://docs.terra.money/docs/develop/sdks/terra-js/README.html) for notes on how to get up and running.

### Getting blockchain data
:exclamation: terra-dart can connect both terra-classic and terra network. If you want to communicate with classic chain, you have to set isClassic as `true`.
```ts
import { LCDClient, Coin } from '@terra-money/terra-dart';

// connect to pisco testnet
const terra = new LCDClient({
  URL: 'https://pisco-lcd.terra.dev',
  chainID: 'pisco-1',
  isClassic: false  // if it is unset, LCDClient assumes the flag is false.
});

// connect to columbus-5 terra classic network
const terra = new LCDClient({
  URL: 'https://columbus-lcd.terra.dev',
  chainID: 'columbus-5',
  isClassic: true  // *set to true to connect terra-classic chain*
});

// To use LocalTerra
// const terra = new LCDClient({
//   URL: 'http://localhost:1317',
//   chainID: 'localterra'
// });

// get the current balance of `terra1x46rqay4d3cssq8gxxvqz8xt6nwlz4td20k38v`
const balance = terra.bank.balance('terra1x46rqay4d3cssq8gxxvqz8xt6nwlz4td20k38v');
console.log(balance);
```

### Broadcasting transactions

First, [get](https://faucet.terra.money/) some testnet tokens for `terra1x46rqay4d3cssq8gxxvqz8xt6nwlz4td20k38v`, or use [LocalTerra](https://www.github.com/terra-money/LocalTerra).

```ts
import { LCDClient, MsgSend, MnemonicKey } from '@terra-money/terra-dart';

// create a key out of a mnemonic
const mk = new MnemonicKey({
  mnemonic:
    'notice oak worry limit wrap speak medal online prefer cluster roof addict wrist behave treat actual wasp year salad speed social layer crew genius',
});

// connect to bombay testnet
const terra = new LCDClient({
  URL: 'https://pisco-lcd.terra.dev',
  chainID: 'pisco-1',
});

// To use LocalTerra
// const terra = new LCDClient({
//   URL: 'http://localhost:1317',
//   chainID: 'localterra'
// });

// a wallet can be created out of any key
// wallets abstract transaction building
const wallet = terra.wallet(mk);

// create a simple message that moves coin balances
const send = new MsgSend(
  'terra1x46rqay4d3cssq8gxxvqz8xt6nwlz4td20k38v',
  'terra17lmam6zguazs5q5u6z5mmx76uj63gldnse2pdp',
  { uluna: 1200000}
);

wallet
  .createAndSignTx({
    msgs: [send],
    memo: 'test from terra-dart!',
  })
  .then(tx => terra.tx.broadcast(tx))
  .then(result => {
    console.log(`TX hash: ${result.txhash}`);
  });
```

## terra-dart in the browser

You can access all the objects of the `@terra-money/terra-dart` from the global `Terra` object if you load terra-dart with a `<script>` tag.

Include the following in your browser:

```html
<script
  crossorigin
  src="https://unpkg.com/@terra-money/terra-dart/dist/bundle.js"
></script>
```

You can find a small JSFiddle example that refreshes current Oracle votes [here](https://jsfiddle.net/tLm1b527/1/).

## terra-dart in React Native

In order to use terra-dart inside React Native, you need to add the [`node-libs-react-native`](https://github.com/parshap/node-libs-react-native) package and [`react-native-get-random-values`](https://github.com/LinusU/react-native-get-random-values) package to your React Native app's `package.json`.

```sh
yarn add node-libs-react-native react-native-get-random-values
```

You will need to register Node.js native modules in an entry point of your application, such as `index.tsx`:

```js
import 'node-libs-react-native/globals';
import 'react-native-get-random-values';
```

Also, add resolvers to your `metro.config.js`

```js
module.exports {
  // ...
  resolver: {
    // ...
    extraNodeModules: require('node-libs-react-native'),
  },
  // ...
}
```

## License

This software is licensed under the MIT license. See [LICENSE](./LICENSE) for full disclosure.

© 2020 Terraform Labs, PTE.

<hr/>

<p>&nbsp;</p>
<p align="center">
    <a href="https://terra.money/"><img src="https://assets.website-files.com/611153e7af981472d8da199c/61794f2b6b1c7a1cb9444489_symbol-terra-blue.svg" align="center" width=200/></a>
</p>
<div align="center">
  <sub><em>Powering the innovation of money.</em></sub>
</div>
