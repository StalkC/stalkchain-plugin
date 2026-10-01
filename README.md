# StalkChain for Claude

Crypto research in plain English. Ask Claude to check a coin before you buy it, vet a trader before you copy them, see what the top traders are buying right now, or look up any wallet. It works across Solana, Ethereum, Base, BNB Chain, Monad, Hyperliquid and Robinhood Chain, plus the StonkFun launchpad.

This plugin is read-only. It never trades, moves funds or signs anything.

## What's inside

**The StalkChain connector** (`.mcp.json`) connects Claude to StalkChain's live data: tracked traders and their real wallets, profit, positions and trades, smart-money holders, dev and insider positions, buy and sell flow, on-chain safety checks, wallet histories, and DeFi yields and hacks.

**Skills** teach Claude how to research, not just which tool to call. Each one checks the cheapest data first and answers in a consistent format:

| Skill | Ask something like |
| --- | --- |
| `token-check` | "Is this coin safe? Is the dev selling?" |
| `trader-check` | "Should I copy this trader? Compare these three." |
| `smart-money-radar` | "What did the top traders buy in the last hour?" |
| `wallet-lookup` | "What does this wallet hold, and how old is it?" |
| `stonkfun-research` | "What's trending on StonkFun? Show this token's burns." |
| `defi-safety` | "Where can I earn on USDC? Has this protocol been hacked?" |

In Claude Code and Cowork you can also run them directly, for example `/stalkchain:token-check <address>`.

**An agent**, `crypto-researcher`, runs longer multi-coin or multi-trader research and writes a report. It works in Cowork and Claude Code.

## Get started

1. Install the plugin.
2. Open the plugin's **Connectors** tab and connect **StalkChain**. Sign in with your StalkChain account. You'll need credits, which you can buy at [data.stalkchain.com](https://data.stalkchain.com).
3. Ask a question, for example "What are the top traders buying on Solana right now?"

## Data and privacy

When Claude uses a skill, it calls the StalkChain connector at `https://data.stalkchain.com/mcp/directory`. Each call sends only the name of the tool and its inputs, such as a token address, a trader handle or a wallet address. Your conversation is never sent. Each call spends credits from your StalkChain account.

The plugin itself has no scripts and no hooks, and it stores nothing. Data returned describes public blockchain activity and public posts by traders. See the [privacy policy](https://data.stalkchain.com/privacy) and [terms](https://data.stalkchain.com/terms).

Nothing here is financial advice.

## Support

Questions and issues: [stalkchain.com/mcp](https://stalkchain.com/mcp), or open an issue in this repository.
