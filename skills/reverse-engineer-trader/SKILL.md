---
name: reverse-engineer-trader
description: Reverse-engineer a Solana trader's memecoin playbook from their real on-chain fills, for any wallet address or FOMO trader handle. Use when the user asks to reverse-engineer a trader or wallet, decode their strategy, find the rules they trade by, say whether they are skilled or lucky, or what setup, entry, exit and risk habits their wins share. Also answers to "reverse engineer wallet". Research only; never places or copies trades.
argument-hint: <Solana wallet address or trader handle>
---

# Reverse-engineer this trader

Rebuild how a Solana trader actually makes (or loses) money, from their fills on chain: **the setups they take, how they enter and exit, how they size and cut, and whether the edge is skill or luck.** Use the StalkChain connector. This is research only: it never copies, places or schedules a trade.

For a quick "should I copy them" check use **trader-check**; for habits from a tracked trader's closed positions use **trader-playbook**. This skill goes further: it works on any wallet, tests the edge against chance, and writes the rules out.

## 1. Pin down the wallet

- **A Solana address:** use it as is. A `0x` address is not supported here; say so and offer **trader-playbook** for a tracked handle.
- **A handle or name:** `stalkchain_fomo_search` with `q` and `type: "traders"` (250 credits) returns the trader's wallets and PnL. Confirm the account if several match. Use the Solana wallet with the most activity; mention the others.

## 2. Gather the record, cheapest and most telling first

Tell the user the plan and its cost before you start (usually 750–1,250 credits) and stop to ask before going past 1,500.

1. `stalkchain_wallet_decode` with `wallet`. It tests the wallet's picks against random coins it could have bought with the same rule (skilled or lucky), writes the rule it trades by, finds linked wallets (same owner, buys before or after it, same-second copy bots) and shows where it wins and loses by token age, size and market cap. A wallet never decoded answers "call again in 30–60 seconds" the first time and is not charged: wait, then call it again. Don't switch tools.
2. `stalkchain_wallet_pnl` with `wallet` (250): realised and unrealised profit, win rate, total invested, average buy and open positions.
3. `stalkchain_wallet_trades` with `wallet` (250 per page of up to 1,000 fills): every buy and sell in USD with price and time, grouped by token. One page is usually enough; ask before reading more.
4. For the two or three trades that explain the playbook best, `stalkchain_wallet_trades` with `wallet` and `token` (250 each): the full history on that coin, the holding before and after each fill, and whether a buy added to a position.
5. Only if the rule hinges on launch timing: `stalkchain_token_early_buyers` with the mint (250–500) for one example coin, to see where this wallet sat among the first buyers.

## 3. Work it out

From the fills, compute and keep the sample in view ("312 fills on 74 tokens, 3 Oct to 22 Nov"):

- **Sizing:** median buy in USD, the range, and whether size grows after wins or losses.
- **Entry timing:** how soon after a token's first trades they buy, and the market cap at entry *only where the data gives it*.
- **Adding:** how often a position is added to, and whether adds come on the way up or down.
- **Exits:** hold time (median, and the share closed within an hour, a day, a week), selling in parts versus all at once, and how fast losers are cut.
- **Results:** win rate, average win against average loss, expectancy per trade, and how much of the profit the best three trades carry.
- **Consistency:** does it hold across the period, or did one stretch make it all?
- **Archetype:** sniper, momentum, scalper, swing, copy-trader, or a mix, as a *hypothesis* from the pattern. Never call anyone an insider: say what the timing shows ("bought in the first minute on 9 of 12 winners") and stop there.

Use the decode's skill-versus-luck verdict and its confidence as given; don't upgrade it.

## 4. Answer in this shape

**Playbook in one line:** e.g. "Buys Solana launches in the first five minutes at under $100K market cap, sells half on a double, cuts at −40%."

**Verdict:** skilled, lucky or unclear, with the decode's confidence and the sample size.

**The rules:** a short table, rule then evidence, for setup, entry, size, adding, take profit, stop and hold time. Every row cites numbers from the fills.

**Three trades that show it:** token, entry and exit in USD, hold time, result, and which rule it illustrates.

**Linked wallets:** any the decode found, with what links them, as observations.

**What the data can't show:** gaps such as missing market cap at entry, transfers rather than buys, or too few trades.

Then one line: *"Past behaviour doesn't predict future results. This is data, not financial advice."*

## Rules

- Never set up, suggest or place copy trades or alerts to mirror a wallet. If asked, say this plugin is read-only.
- A missing value is `null`, never zero, and a guess is never presented as data. Tokens received rather than bought have no entry price: leave them out of sizing and win rate.
- Archetypes and linked wallets are hypotheses from public data, not accusations.
- Keep raw JSON out of the answer and report credits used at the end.
