---
name: wallet-lookup
description: Look up any crypto wallet address. Use when the user pastes a wallet address or asks what a wallet holds, what it's worth, how much it has made or lost, how old it is, who funded it, what it has been doing, or whether it belongs to a known trader.
argument-hint: <wallet address>
---

# Look up a wallet

Tell the user who or what this wallet is, what it holds, and what it has done. Use the StalkChain connector, and spend credits only on the chain the address belongs to.

## 1. Identify the chain

- **Solana** addresses are base58, 32–44 characters.
- **EVM** addresses (Ethereum, Base, BNB Chain, Monad, Hyperliquid, Robinhood Chain) are `0x` followed by 40 hex characters. One EVM address is the same wallet on every EVM chain.

## 2. Look it up

**Solana wallet**
1. `stalkchain_wallet_pnl` with `wallet`: realised and unrealised profit, win rate, total invested, average buy size and current positions.
2. To see what it holds right now: `stalkchain_wallet_portfolio` with `wallet` and `chains: ["solana"]`.

**EVM wallet**
1. `stalkchain_wallet_portfolio` with `wallet`: holdings and USD value on every chain. It is priced per five chains, so pass `chains` when the user names specific ones.
2. `stalkchain_wallet_age` with `wallet`: first transaction and lifetime activity per chain. A brand-new wallet moving large sums is the clearest warning sign.
3. If asked what it has been doing, or who funded it: `stalkchain_wallet_transfers` with `wallet` and `chain`, the newest transfers first.

**Is it a known trader?** StalkChain can't look up who owns an arbitrary address: trader search matches names and handles, not wallets. If the user thinks it belongs to a particular trader, ask for the handle, run the **trader-check** skill, and compare the wallets it returns with this address.

## 3. Answer in this shape

**Wallet:** shortened address (`0x1234…abcd`), chain, and the trader's name if known.

**Worth now:** total USD value and its top five holdings.

**Track record (Solana):** profit, win rate and number of tokens traded.

**Age and activity:** first seen, number of transactions, and any warning such as "created 2 days ago".

**Recent activity:** only if transfers were fetched. Summarise the largest moves; don't list everything.

## Rules

- A missing value is `null`, never zero.
- Public blockchain data is public, but don't speculate about the real-world identity of a wallet owner beyond what the data shows.
- Keep raw JSON out of the answer.
