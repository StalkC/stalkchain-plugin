---
name: defi-safety
description: Check DeFi protocols, yields and hacks. Use when the user asks where to earn yield or APY on a token, whether a DeFi protocol or app is safe, has been hacked or exploited, is growing or dying, or which blockchain has the most money and stablecoins.
argument-hint: "[protocol, token symbol, or chain]"
---

# DeFi safety and yield

Use the StalkChain connector.

## Pick the call

- **"Where can I earn on X?"** `stalkchain_token_yields` with `symbol`, plus `chain` if named, `stablesOnly: true` for stablecoin yield, and `minTvlUsd` to skip tiny pools. Results are ranked by the money already in the pool, not the headline APY, because the biggest APY is usually the riskiest.
- **"Is this protocol safe?"** `stalkchain_protocol_report` with `protocol`. It gives TVL with 1, 7 and 30-day change, chains, audit status, and any exploit on record.
- **"Has this been hacked?" or "What got exploited lately?"** `stalkchain_defi_hacks` with `query` (protocol name) or `chain`.
- **"Which chain has the money?"** `stalkchain_chain_health`, which compares TVL and stablecoin supply. Stablecoins sitting idle are dry powder.

## Answer in this shape

**Yield question:** the top five pools as a table: protocol, chain, APY (base plus reward), 7-day trend, pool size and impermanent-loss risk. Then one sentence on the trade-off between the highest APY and the deepest pool.

**Safety question:** TVL and its trend, audits, then exploits with dates and amounts lost. A shrinking TVL or a past exploit belongs at the top.

## Rules

- A high APY made of reward tokens can vanish. Say how much of it is reward.
- A missing value is `null`, never zero.
- Not financial advice. Present the data.
