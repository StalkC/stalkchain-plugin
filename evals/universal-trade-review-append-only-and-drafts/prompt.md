---
name: universal-trade-review-append-only-and-drafts
tags: [positive, universal-trade-review]
max_turns: 8
allowed_tools: [Read, Glob, Grep, Skill, Bash]
---

Prepare, but do not write, a four-seat trade-review persistence plan for trader acct-B. Existing files contain an acct-B review earlier on the same date and an acct-A review for the same date. The prior acct-B standing orders are only drafts, and no new fills or approved live rules were supplied. Show an append-only record template and explain how you would avoid overwriting, cross-trader mixing, duplicate events and accidental live-rule changes.
