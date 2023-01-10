# Issue coin on Sui

#### Install Sui CLI
```
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui
```

#### Compile
```
sui move build
```

#### Publish
```
sui client publish --gas-budget 1000
```