# Issue coin on EVM chains

#### Install Foundry CLI
```
curl -L https://foundry.paradigm.xyz | bash
```


#### Compile
```
forge build
```

#### Test
```
forge test
```

#### Deploy and Verify
```
forge script script/JustaCoin.s.sol:DeployJustaCoin --rpc-url goerli --broadcast --verify -vvvv
```