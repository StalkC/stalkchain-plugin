---
type: fixed
expect:
  kind: [price_above, price_below, smart_money_buy]
  token: string
---

{"id": "alrt_test_1", "status": "active", "kind": "{{input.kind}}", "token": "{{input.token}}", "oneShot": true}
