# StalkChain for Claude

Crypto research in plain English. Ask Claude to check a coin before you buy it, vet a trader before you copy them, see what the top traders are buying right now, review a wallet, or alert you when a price is crossed. It works across Solana, Ethereum, Base, BNB Chain, Monad, Hyperliquid and Robinhood Chain, plus the StonkFun launchpad.

The plugin never trades, moves funds or signs anything. The only thing it can change is your own StalkChain alerts, and only after you confirm.

## What's inside

**The StalkChain connector** (`.mcp.json`) connects Claude to StalkChain's live data: tracked traders and their real wallets, profit, positions and trades, smart-money holders, dev and insider positions, buy and sell flow, on-chain safety checks, wallet histories, DeFi yields and hacks, and StonkFun launches.

**Skills** teach Claude how to research, not just which tool to call. Each one checks the cheapest data first and answers in a consistent format. In Claude Code and Cowork you can also run them as commands, for example `/stalkchain:token-check <address>`.

| Skill | Ask something like |
| --- | --- |
| `token-check` | "Is this coin safe? Is the dev selling?" |
| `trader-check` | "Should I copy this trader? Compare these three." |
| `trader-playbook` | "How does this trader actually trade? How long do they hold?" |
| `smart-money-radar` | "What did the top traders buy in the last hour?" |
| `whale-watch` | "Any big buys or sells over $50K today?" |
| `launch-screener` | "Any new launches worth a look today?" |
| `narrative-tracker` | "What are the narratives right now?" |
| `token-compare` | "Compare these three coins side by side." |
| `rug-post-mortem` | "What happened to this coin? Was it a rug?" |
| `holder-tracker` | "Who joined or left this token's holders since yesterday?" |
| `wallet-lookup` | "What does this wallet hold, and how old is it?" |
| `portfolio-review` | "What's risky in my bags?" |
| `price-alerts` | "Email me when BONK goes above $0.00005." |
| `defi-safety` | "Where can I earn on USDC? Has this protocol been hacked?" |
| `stonkfun-research` | "What's trending on StonkFun? Show this token's burns." |
| `stonkfun-launch-guide` | "Help me plan a StonkFun launch paired with an xStock." |

**Agents** handle longer jobs in Cowork and Claude Code:

| Agent | What it does |
| --- | --- |
| `crypto-researcher` | Multi-coin or multi-trader research that ends in a written report. |
| `watchlist-analyst` | Works through `watchlist.md` or `watchlist.json` in your project and writes a dated daily brief to `briefs/`. Pairs well with a scheduled task. |
| `due-diligence-reviewer` | A second opinion: re-checks a research report against fresh data and flags claims the data doesn't support. |

**Interactive cards.** In Claude and ChatGPT, token analysis and safety checks, trader reports and comparisons, multi-trader entries, the leaderboard, wallet portfolios, the live trade feed, DeFi yields and StonkFun token reports appear as interactive cards: switch a chart's timeframe or the leaderboard's window in place, or tap through to the next question. Claude adds the interpretation on top.

## Get started

1. Install the plugin: from your app's plugin directory in Claude, Cowork or ChatGPT, or in Claude Code from a plugin marketplace that lists it. To try a local copy in Claude Code, run `claude --plugin-dir ./stalkchain-plugin`.
2. Connect **StalkChain** (the plugin's **Connectors** tab, or `/mcp` in Claude Code) and sign in with your StalkChain account. You'll need credits, which you can buy at [data.stalkchain.com](https://data.stalkchain.com).
3. Ask a question, for example "What are the top traders buying on Solana right now?"

## Data and privacy

When Claude uses a skill, it calls the StalkChain connector at `https://data.stalkchain.com/mcp/directory`. Each call sends only the name of the tool and its inputs, such as a token address, a trader handle or a wallet address. Your conversation is never sent. Each call spends credits from your StalkChain account.

When you create an alert, StalkChain stores the token, the target and where to send it (your account's email, or a webhook URL you give) until you delete it or it fires.

The plugin itself has no scripts and no hooks. The holder-tracker skill and the watchlist-analyst agent save snapshots and briefs as files in your own project, and nowhere else. Data returned describes public blockchain activity and public posts by traders. See the [privacy policy](https://data.stalkchain.com/privacy) and [terms](https://data.stalkchain.com/terms).

Nothing here is financial advice.

## Support

Questions and issues: [stalkchain.com/mcp](https://stalkchain.com/mcp), or open an issue in this repository.
