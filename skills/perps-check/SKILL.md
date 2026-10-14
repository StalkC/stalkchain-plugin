---
name: perps-check
description: Read the perps market on Hyperliquid before trading it. Use when the user asks about funding rates, open interest, whether longs or shorts are crowded, a funding arbitrage between Hyperliquid, Binance and Bybit, what is hot on Hyperliquid, stock perps such as TSLA or NVDA, or a perp chart.
argument-hint: "[coin or stock ticker]"
---

# Check a perp market

Answer one question: **who is paying whom, how crowded is it, and what is it doing?** Use the StalkChain connector. Each call below is 250 credits; most answers need two.

## 1. The market

`stalkchain_perps_markets` with `coins` set to what the user named (`venue: "stocks"` for TSLA, NVDA, HOOD, gold or the S&P 500): mark price, 24h change and volume, open interest in USD, funding per hour and per year, and premium to the oracle.

No coin named ("what is hot on Hyperliquid")? Call it with `sortBy` set to `volume`, `openInterest`, `funding` or `fundingNegative` and `limit: 10`.

## 2. Funding

`stalkchain_perps_funding` with `coins` and, when the user asks about a trend, `days` (one coin only):

- Positive funding means longs pay shorts; the longs are crowded. Negative means the opposite.
- The spread between venues is a basis trade only if it is wide and both venues have depth. Say that it ignores fees, borrow and the risk of the spread moving.
- With `days`: the average, the extremes, and how often longs paid.

## 3. Only if asked

- A chart: `stalkchain_perps_candles` with `coin`, `interval` and `hours`.
- Who is positioned: `stalkchain_perps_leaderboard`, then `stalkchain_perps_wallet` for a named wallet. Ask before checking more than three wallets.

## 4. Answer in this shape

**Market:** price, 24h change, volume and open interest, in one line.

**Funding:** per year on Hyperliquid, Binance and Bybit, and who pays.

**What it means:** one or two sentences, e.g. "Longs have paid 95% of hours this week; positioning is one-sided."

Then one line: *"This is data, not financial advice."*

## Rules

- Quote funding per year as well as per hour; hourly numbers look tiny and mislead.
- Open interest is in USD. Don't mix it with coin units.
- Never tell the user to open, close or size a position. Lay out the facts.
- A missing value is `null`, never zero. Keep raw JSON out of the answer.
