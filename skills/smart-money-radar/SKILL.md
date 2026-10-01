---
name: smart-money-radar
description: Find what top crypto traders and smart money are buying or selling right now. Use when the user asks what's trending, what KOLs or whales are buying, which coins several traders just entered, what is hot today, or wants a list of new opportunities to research.
argument-hint: "[time window, chain, or buy/sell]"
---

# What smart money is doing right now

Give the user a short, ranked list of coins with a reason for each, then offer to check any of them. Use the StalkChain connector. Every lookup spends credits, and the live feeds are cheap, so start there.

## 1. Pick the right lens

Read what the user asked for. Default to the last hour of buys on all chains.

- **"What are traders buying?"** Call `stalkchain_fomo_multi_trader_entries` with `windowMinutes` (default 60), `minTraders` (default 3, lower it to 2 if nothing comes back), and `side: "buy"`. This returns coins that several different tracked traders bought in the window.
- **"Is anyone piling into the same coin?"** Call `stalkchain_fomo_coordinated_activity` with `side`, `minTraders` and `windowMinutes`.
- **"What's trending?"** Call `stalkchain_fomo_token_board` with `board: "trending"`, or `"graduated"` for coins that just left the launch curve.
- **"What's the feed saying?"** Call `stalkchain_fomo_alerts` with `limit` around 50 for the raw live buys and sells.
- **"What are traders writing about?"** Call `stalkchain_fomo_theses_recent`. It costs more, so use it only when asked.

Add `chain` (e.g. `solana`, `base`, `robinhood`) when the user names one.

## 2. Answer in this shape

A numbered list, at most ten coins, each on one line:

`1. TICKER (chain): 5 traders bought in the last hour, about $42K in total, led by @handle`

Then add one sentence on the overall pattern, for example "Mostly new Solana launches under $1M" or "Rotation into Base coins".

Close with an offer: *"Want me to check any of these before you buy? I'll look at holders, the dev, liquidity and real volume."* If they pick one, follow the **token-check** skill.

## Rules

- A coin several traders bought is a lead to research, not a recommendation. Never say "buy this".
- Say "tracked traders", not "everyone": the feeds cover a curated set of known traders.
- If nothing matches, widen the window or lower `minTraders` once, then say plainly that it's quiet.
- Keep raw JSON out of the answer.
