---
name: stonkfun-research
description: Research tokens on StonkFun, the Solana launchpad for tokens paired with tokenized stocks (xStocks) and stablecoins. Use when the user mentions StonkFun, xStock pairs, a StonkFun token, launches, burns, holder rewards, creator fees, or StonkFun platform revenue.
argument-hint: "[token mint or creator wallet]"
---

# StonkFun research

Use the StalkChain connector's `stonk_*` tools.

## Pick the call

- **One token, everything:** `stonk_token_report` with `mint`. It covers market data, launch record, burns, holder rewards, airdrop, creator fees, backing and the creator's other launches. Start here for any single token.
- **Browse or search:** `stonk_tokens` with `sort` (`marketCap`, `newest` or `volume`) and optional `q` to search by name or ticker.
- **Everything one wallet launched:** `stonk_launches` with `creator`. Many launches with few survivors is a serial-launcher pattern worth pointing out.
- **Platform view:** `stonk_stats` for totals and graduation thresholds, `stonk_revenue` for revenue, buybacks and burns, `stonk_rewards` for holder payouts across tokens.
- **Launching your own:** `stonk_pairs` for what a token can pair against, and `stonk_launchlab_pricing` with `quoteMint` for curve settings.

StonkFun mints are ordinary Solana tokens. For holder safety, smart money and dev checks on the same mint, follow the **token-check** skill.

## Answer in this shape

Lead with what the user asked. For a token: price, market cap, 24h volume, launch date, and who launched it. Then burns, rewards and fees, but only if they're non-zero or the user asked. Then anything notable, such as heavy burns, a creator with many dead launches, or unclaimed fees.

## Rules

- A missing value is `null`, never zero. Most tokens launch without an airdrop, and that's normal.
- Not financial advice. Present the data.
- Keep raw JSON out of the answer.
