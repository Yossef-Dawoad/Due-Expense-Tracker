# Detailed Engineer Spec

This version deeply explains:

* Meaning of every field
* Why it exists
* How it is used
* What breaks if removed

Below is the improved document.

---

# Expense Tracker — Detailed Data Architecture Specification

This document describes ALL data models with deep explanations of:

- Field meaning
- Purpose
- Usage
- Design reasoning

Target audience: Junior engineers implementing the system.

---

# 1️⃣ System Philosophy

We are building a **local-first finance application**

### Requirements

- Works offline
- Writes instantly
- Syncs later
- Scales to large data sets
- Supports future bank integrations

Therefore:

- Drift DB = Working Database
- PocketBase = Sync + Auth + Backup Source

---

# 2️⃣ ID Strategy

## Local Records
Use UUID strings

Reason:
- Created offline
- Must not collide
- Sync safe

---

## remote_id
Stores PocketBase record ID

Needed to map local ↔ server records

Without it:
- Sync impossible

---

# 3️⃣ Backend Schema (PocketBase)

Backend schema prioritizes:

- Simplicity
- Security
- Sync friendliness

NOT heavy analytics

---

# USERS
Provided by PocketBase authentication.

Represents a human account.

Used for ownership isolation.

---

# ACCOUNTS COLLECTION

Represents financial containers.

Examples:

- Wallet
- Bank account
- Credit card

---

## Fields

### user (relation)

Owner of account.

Why:
Ensures multi-user isolation and access control.

Without:
Users could see each other's finances.

---

### name (text)

Human readable label.

Examples:

- Cash
- Bank of Cairo
- Visa

Used in UI.

---

### type (select)

Values:

- cash
- bank
- card

Why:
Allows UI behavior differences and analytics grouping.

---

### currency (text)

ISO currency code.

Examples:

- USD
- EGP

Needed for multi-currency support.

---

### balance (number)

Cached current total.

Why exists:

- Avoid summing thousands of transactions
- Instant dashboard load
- Critical for performance

Updated during sync.

---

### is_archived (bool)

Soft hides account.

Why:

- Preserve history
- Avoid deleting data
- Maintain reporting accuracy

---

# CATEGORIES COLLECTION

Groups transactions logically.

Examples:

- Food
- Transport
- Salary

Categories are analytical only.

They DO NOT store money state.

---

## Fields

### user

Ownership

---

### name

Display label

---

### icon

UI icon identifier

Avoids hardcoded icons.

---

### color

Visual grouping

Improves UX scanning

---

### parent (optional)

Allows hierarchy

Example:

```

Food
├── Groceries
└── Restaurants

```

Supports advanced analytics.

---

# TAGS COLLECTION

Free-form labeling.

Examples:

- vacation
- business
- tax-deductible

More flexible than categories.

---

## Fields

### user
Ownership

---

### name
Tag label

---

# TRANSACTIONS COLLECTION

MOST IMPORTANT ENTITY

Represents movement of money.

---

## Fields

### user

Ownership and security filtering

---

### account

Where money moved

Required for balance updates

---

### category

Used for reporting

Optional but recommended

---

### amount

Numeric value

Sign handled by `type`

Never store negative values

---

### type

Values:

- expense
- income
- transfer

Why exists:

- Reporting
- Balance logic
- Analytics

---

### note

User description

Human context memory

---

### date

When transaction occurred

NOT when created

Critical for:

- Timelines
- Reports
- Forecasts

---

### is_pending

Bank-import support

True when not cleared

---

### external_id

ID from bank or aggregator

Prevents duplicate imports

---

# TRANSACTION_TAGS

Many-to-many mapping

Allows unlimited tagging

---

# ATTACHMENTS

Receipt storage

Evidence or documentation

---

# 4️⃣ Local Drift Schema Enhancements

Local DB adds sync metadata.

---

## Sync Fields

### remote_id

Server record mapping

---

### is_dirty

Record modified locally

Needs upload

---

### is_deleted

Soft deletion marker

Required for sync safety

---

### version

Conflict resolution counter

Used when both client and server update

---

### last_synced

Timestamp of last sync

Supports incremental fetching

---

# 5️⃣ Local-Only Fields

### local_created_at

Precise creation moment

Used for ordering before sync

---

### local_updated_at

Tracks modifications

---

### transfer_group_id

Links paired transfers

Prevents double counting

---

# 6️⃣ Sync Queue Table

Stores pending operations.

Guarantees reliability.

---

## Fields

### table_name

Which table changed

---

### row_id

Which record changed

---

### operation

insert/update/delete

---

### payload

Serialized data snapshot

Used for retries

---

### retry_count

Prevents infinite loops

---

# 7️⃣ Why We DO NOT Store Category Balance

Category totals are:

- Time dependent
- Filter dependent
- Frequently changing

Persisting them causes:

- Sync invalidation
- Data corruption
- Massive complexity

Correct solution:

Compute using indexed queries.

---

# 8️⃣ Required Indexes

## PocketBase

transactions:
- user
- account
- category
- date

---

## Drift

transactions:
- date
- account_id
- category_id

These indexes are REQUIRED for performance.

---

# 9️⃣ Engineering Priorities

Always prioritize:

1️⃣ Data correctness  
2️⃣ Offline safety  
3️⃣ Sync reliability  
4️⃣ Performance  
5️⃣ Features  

---

# END DOCUMENT

