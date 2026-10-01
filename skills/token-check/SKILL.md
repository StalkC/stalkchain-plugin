---
name: token-check
description: Check a crypto coin or token before buying it. Use when the user asks whether a coin is safe, legit, a rug, worth buying, who holds it, whether the dev or insiders are selling, whether smart money is in it, or pastes a token address or ticker and wants to know about it.
argument-hint: <token address or ticker>
---

# Check a coin before buying

Answer one question for the user: **what do the facts say about this coin right now?** Use the StalkChain connector. Every lookup spends the user's credits, so start with the cheapest call that can answer and only go deeper when the first results justify it.

## 1. Pin down the token

- A Solana mint is base58, 32–44 characters. An EVM contract is `0x` followed by 40 hex characters.
- If the user gave a ticker or name instead of an address, call `stalkchain_fomo_search` with `q` set to it and `type: "tokens"`. If several tokens share the ticker, show the top matches with chain and market cap, and ask which one. Never guess between look-alikes: scam tokens copy popular tickers.

## 2. Run the core checks

Run these, in parallel where your client allows:

1. `stalkchain_fomo_analyze_token` with `address`. This gives buy and sell flow, smart-money holders, and the dev's and insiders' positions in one call.
2. **Solana only:** `stalkchain_token_onchain` with `token`. This gives the true total holder count, whether the liquidity pool is burned, whether mint or freeze authority is still live, top-10 concentration, sniper and insider share, and a risk score.
3. **Solana only:** `stalkchain_token_quality` with `token`. This shows organic versus total volume; a low organic share means wash trading.

## 3. Go deeper only when it matters

- The user mentions a position size, or liquidity looks thin: `stalkchain_token_exit_check` with `token` and `usd` set to their size. This quotes what they would really get back on a sale.
- The coin is new (days old), or the dev is unknown: `stalkchain_token_deployer` with `token`, which lists everything that wallet launched before and how each one ended.
- Many early wallets, or the launch looks sniped: `stalkchain_token_early_buyers` with `token`.
- The user wants to know whether the big holders are leaving: `stalkchain_fomo_kol_sell_pressure` with `address`.

## 4. Answer in this shape

**Verdict:** one plain sentence, e.g. "Several serious red flags" or "No major red flags found in the data".

**Red flags:** only the ones the data shows. Examples: mint authority still live, LP not burned, dev sold, top 10 hold over 50%, mostly wash volume, deployer has dead launches, heavy sniper share.

**Good signs:** for example LP burned, authorities revoked, tracked traders holding, organic volume, buyers outnumbering sellers.

**Smart money:** how many tracked traders hold it and whether they are adding or selling.

**Can you get out?** Only if an exit check was run.

Then one line: *"This is data, not financial advice."*

## Rules

- A missing value is `null`, never zero. Say "not available", never "0".
- "Tracked traders" are a curated set of known traders, not every holder. Say "tracked traders" and keep them apart from total holders.
- An empty dev or insider list means no dev position is known. It does not mean the dev has none, and it is not a safety signal.
- Do not tell the user to buy or sell. Lay out the facts and let them decide.
- Keep raw JSON out of the answer. Quote the numbers that matter, with units.
