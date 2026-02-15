
# Expense Tracker — Data Architecture & Schema Spec
### Stack
- Flutter (Client)
- Drift (Local SQLite)
- PocketBase (Backend API + Auth + DB)

This document defines the database structure, relationships, and implementation rules for building a reliable, scalable, offline-first expense tracking system.

This spec assumes the reader is a junior engineer and explains both WHAT to build and WHY.

---

# 1️⃣ Architecture Overview

## System Philosophy

We are building a **local-first application**:

- App must work fully offline
- All writes go to local DB first
- Sync to backend happens asynchronously
- Backend is the source of truth

```md

User Action
↓
Drift Local DB
↓
Sync Queue
↓
PocketBase Backend

```

This guarantees:

- Fast UI
- No data loss offline
- Reliable retry sync
- Scalable backend

---

# 2️⃣ Naming Conventions

Follow these strictly:

| Item | Convention |
|------|------------|
| Tables | snake_case |
| Columns | snake_case |
| IDs | `id` |
| Relations | `<entity>_id` |
| Dates | ISO datetime |
| Booleans | `is_` prefix |
| Sync fields | standardized names |

Example:

```

account_id
created_at
is_deleted

```

---

# 3️⃣ PocketBase Schema (Backend)

Keep backend schema simple and flat.

## Built-in Collection

### users
Provided by PocketBase auth system.

DO NOT MODIFY STRUCTURE

---

## Collection: accounts

Represents wallets/bank accounts/cards.

### Fields

| Field | Type |
|------|------|
| user | relation(users) |
| name | text |
| type | select: cash,bank,card |
| currency | text |
| balance | number |
| is_archived | bool |

### Notes

- `balance` is cached for performance
- Updated when transactions sync

### Indexes

Create indexes on: `user`

---

## Collection: categories

User-defined or default.

| Field | Type |
|------|------|
| user | relation |
| name | text |
| icon | text |
| color | text |
| parent | relation(categories) optional |

Supports hierarchical categories.

Indexes: `user`, `parent`

---

## Collection: tags

| Field | Type |
|------|------|
| user | relation |
| name | text |

---

## Collection: transactions

Core financial records.

| Field | Type |
|------|------|
| user | relation |
| account | relation(accounts) |
| category | relation(categories) |
| amount | number |
| type | select(expense,income,transfer) |
| note | text |
| date | datetime |
| is_pending | bool |
| external_id | text |

### Critical Indexes

```

user
account
category
date

```

Without these scrolling history becomes slow.

---

## Collection: transaction_tags

Junction table.

| Field | Type |
|------|------|
| transaction | relation |
| tag | relation |

---

## Collection: attachments (optional)

| Field | Type |
|------|------|
| transaction | relation |
| receipt | file |

---

# 4️⃣ Drift Local Schema

Local DB contains everything backend has PLUS sync metadata.

This enables offline reliability.

---

## Common Sync Columns
Add to EVERY table:

```

remote_id TEXT
is_dirty BOOLEAN
is_deleted BOOLEAN
version INTEGER
last_synced INTEGER

```

### Purpose

| Column | Why |
|--------|-----|
| remote_id | Maps to backend record |
| is_dirty | Needs sync |
| is_deleted | Soft delete |
| version | Conflict resolution |
| last_synced | Incremental sync |

DO NOT SKIP THESE

---

## Local Table: accounts

Add fields:

```

local_balance_cache REAL
last_calculated INTEGER

```

Allows instant UI balance display.

---

## Local Table: transactions

Add:

```

local_created_at INTEGER
local_updated_at INTEGER
transfer_group_id TEXT nullable

```

Used to link transfer pairs.

---

## Local Table: categories
Same as backend + sync fields

---

## Local Table: tags
Same as backend + sync fields

---

## Local Table: transaction_tags
Same as backend + sync fields

---

# 5️⃣ Sync Queue Table (CRITICAL)

## Table: sync_queue

Stores pending operations.

### Columns

```

id INTEGER PRIMARY KEY
table_name TEXT
row_id TEXT
operation TEXT (insert/update/delete)
payload TEXT (JSON)
created_at INTEGER
retry_count INTEGER

```

### Why This Exists

- App may crash mid-sync
- Network may fail
- Server may reject

Queue guarantees eventual consistency.

---

# 6️⃣ Relations Overview

## Backend

```

users
├── accounts
├── categories
├── tags
└── transactions
└── transaction_tags

```

---

## Local

```

accounts
categories
transactions
tags
transaction_tags
sync_queue

```

---

# 7️⃣ Transfer Handling

Transfers are NOT special rows.

They are TWO transactions:

```

Account A -> Expense
Account B -> Income

```

Linked by:

```

transfer_group_id

```

Benefits:

- No custom logic
- Easy reporting
- Simple sync

---

# 8️⃣ Sync Flow Rules

## Write Flow

1. User action
2. Write to Drift
3. Mark `is_dirty=true`
4. Insert sync_queue entry
5. UI updates immediately

---

## Push Sync

Worker processes queue:

- Send changes
- On success:
  - clear dirty
  - update remote_id
  - update version

---

## Pull Sync

Periodically:

- Fetch server changes since last_sync
- Merge into local

---

# 9️⃣ Conflict Resolution Strategy

Use **Last Write Wins** initially.

Compare:

```

version
updated_at

```

Later we can upgrade strategy.

Do NOT overengineer now.

---

# 🔟 Security Rules (PocketBase)

Set rules:

### Accounts
```

@request.auth.id = user

```

### Transactions
```

@request.auth.id = user

```

### Categories
```

@request.auth.id = user

```

Prevents cross-user access.

---

# 11️⃣ Performance Guidelines

## NEVER

- Fetch all transactions
- Recalculate balance every render
- Block UI on network

## ALWAYS

- Paginate by date
- Cache balance
- Index date/account/category

---

# 12️⃣ Future Expansion Ready

Schema already supports:

✅ Bank sync  
✅ Recurring payments  
✅ Shared accounts  
✅ Budgets  
✅ Analytics  
✅ Multi-device sync  

No migrations required.

---

# ✅ Final Notes For Engineers

### If unsure — follow this priority:

1. Correctness
2. Offline reliability
3. Sync safety
4. Performance
5. Features

NOT the reverse.

---

# END OF SPEC
