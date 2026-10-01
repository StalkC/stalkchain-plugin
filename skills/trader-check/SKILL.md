---
name: trader-check
description: Research a crypto trader or KOL before following or copy-trading them. Use when the user names a trader, handle or influencer and asks whether they are any good, worth copying, legit, how much they've made, what they hold, what their wallets are, or to compare several traders.
argument-hint: <trader handle, or several handles to compare>
---

# Research a trader before copying them

Answer the question the user actually has: **does this person's real trading record back up their reputation?** Use the StalkChain connector. Every lookup spends the user's credits, so start cheap.

## 1. Find the trader

Call `stalkchain_fomo_search` with `q` set to the name or handle and `type: "traders"`. It returns their wallets, user id and profit cheaply. If several accounts match, list them with follower counts and ask which one. Do not start with `stalkchain_fomo_resolve_trader`: it costs ten times as much and search already has the essentials.

## 2. One trader: the report

1. `stalkchain_fomo_trader_report` with `trader` set to the handle. One call covers identity, wallets, profit by time window, open positions, win rate on closed trades and recent calls.
2. Only if the user wants more:
   - `stalkchain_fomo_trader_spotlight` for their best trades and most-liked calls
   - `stalkchain_fomo_trader_positions` with `status: "closed"` for more closed trades
   - `stalkchain_fomo_theses_by_trader` for their written calls (this costs more per page)
   - `stalkchain_fomo_trader_balances` for everything they hold right now, across chains

## 3. Several traders: compare

Call `stalkchain_fomo_compare_traders` with `traders` as a list of two to four handles, then present a side-by-side table: profit (7d, 30d and all time where available), trades, volume, followers, account age and verified status.

## 4. Answer in this shape

**Who they are:** handle, wallets (shortened, e.g. `7xKX…9fQa`), account age, followers.

**Track record:** profit by window, win rate on closed trades, typical hold time if known.

**What they hold now:** top positions by value.

**Things to weigh:** for example profit concentrated in one lucky trade, a very new account, low win rate behind a high headline profit, calls that didn't match their own trades, or recent heavy losses.

Then one line: *"Past results don't predict future ones. This is data, not financial advice."*

## Rules

- A missing value is `null`, never zero. Say "not available".
- Profit figures come from tracked wallets. Say so if the user assumes they cover every wallet the person owns.
- Don't call anyone a scammer. Describe what the data shows.
- Keep raw JSON out of the answer.
