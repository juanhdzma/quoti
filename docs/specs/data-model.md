# Quoti — Data Model

## Storage layers

| Layer | What lives here | Sync |
|---|---|---|
| **Bundle JSON** | Seed data: authors, system tags, quotes | No — read-only, ships with app |
| **SwiftData (local)** | Catalog loaded from bundle | No — same data on every device |
| **SwiftData + CloudKit** | User-generated data | Yes — syncs across devices |
| **iCloud KV Store** | App settings (`NSUbiquitousKeyValueStore`) | Yes — syncs across devices |

---

## ID types

| Entity | ID type | Max values |
|---|---|---|
| `CatalogAuthor` | `UInt16` | 65,535 |
| `SystemTag` | `UInt16` | 65,535 |
| `CatalogQuote` | `UInt32` | 4,294,967,295 |
| User data (CloudKit) | `UUID` | Required for CloudKit sync |

---

## Bundle JSON (seed files)

Loaded on first launch and on app updates (upsert by `id`). Never modified at runtime.

"Unknown" and "Me" are seeded as regular authors with reserved IDs.

### `authors.json`
```json
[{
  "id": 3,
  "name": "Marcus Aurelius",
  "bioEN": "...",
  "bioES": "...",
  "birthPlace": "Roma (Italia)",
  "photoAsset": "author-marcus-aurelius"
}]
```

Reserved authors (always present in seed):
| Name | Reserved ID |
|---|---|
| Unknown | `1` |
| Me | `2` |

### `tags.json` (system tags)
```json
[{
  "id": 1,
  "nameEN": "Stoicism",
  "nameES": "Estoicismo"
}]
```

### `quotes.json`
```json
[{
  "id": 1,
  "textEN": "...",
  "textES": "...",
  "authorId": 3,
  "tagIds": [1, 2]
}]
```

---

## SwiftData — Local store (no sync)

Mirrors the bundle. Read-only after seeding.

### `CatalogAuthor`
| Field | Type | Notes |
|---|---|---|
| `id` | UInt16 | From bundle |
| `name` | String | |
| `bioEN` | String? | |
| `bioES` | String? | |
| `birthPlace` | String? | e.g. "Unión Soviética (Rusia)" |
| `photoAsset` | String? | Asset name in xcassets |

### `SystemTag`
| Field | Type | Notes |
|---|---|---|
| `id` | UInt16 | From bundle |
| `nameEN` | String | |
| `nameES` | String | |

### `CatalogQuote`
| Field | Type | Notes |
|---|---|---|
| `id` | UInt32 | From bundle |
| `textEN` | String? | |
| `textES` | String? | |
| `authorId` | UInt16 | → CatalogAuthor (resolved at runtime) |
| `tagIds` | [UInt16] | → [SystemTag] (resolved at runtime) |

---

## SwiftData — CloudKit store (synced)

All user-generated data. CloudKit requires properties to be optional or have defaults.

### `UserQuote`
| Field | Type | Notes |
|---|---|---|
| `id` | UUID | |
| `text` | String | Single language, no translation |
| `authorId` | UInt16 | → CatalogAuthor (including reserved Unknown=1, Me=2) |
| `tagIds` | [UInt16] | System tag IDs applied at creation |
| `createdAt` | Date | |

### `UserTag`
| Field | Type | Notes |
|---|---|---|
| `id` | UUID | |
| `name` | String | Single name, no translation |
| `createdAt` | Date | |

Displayed with a distinct color vs system tags in the UI.

### `Favorite`
| Field | Type | Notes |
|---|---|---|
| `id` | UUID | |
| `catalogQuoteId` | UInt32? | Set if favoriting a catalog quote |
| `userQuoteId` | UUID? | Set if favoriting a user quote |
| `createdAt` | Date | |

### `AppliedTag`
Links any tag (system or user) to any quote (catalog or custom).

| Field | Type | Notes |
|---|---|---|
| `id` | UUID | |
| `catalogQuoteId` | UInt32? | Set if tagging a catalog quote |
| `userQuoteId` | UUID? | Set if tagging a user quote |
| `systemTagId` | UInt16? | Set if applying a system tag |
| `userTagId` | UUID? | Set if applying a user tag |

---

## iCloud KV Store (`NSUbiquitousKeyValueStore`)

Syncs across devices automatically.

| Key | Type | Values |
|---|---|---|
| `uiLanguage` | String | `"en"` / `"es"` |
| `quotesLanguage` | String | `"en"` / `"es"` |
| `theme` | String | `"light"` / `"dark"` / `"system"` |
| `notificationsEnabled` | Bool | |
| `notificationTime` | Date | Time of day for daily quote |
| `quoteOfTheDayId` | UInt32 | ID of today's featured quote |
| `quoteOfTheDayDate` | Date | Used to rotate daily |

---

## Relationships summary

```
CatalogQuote ──── authorId (UInt16) ────► CatalogAuthor
CatalogQuote ──── tagIds ([UInt16]) ────► [SystemTag]

UserQuote ─────── authorId (UInt16) ────► CatalogAuthor (incl. Unknown=1, Me=2)
UserQuote ─────── tagIds ([UInt16]) ────► [SystemTag]

Favorite ─────── catalogQuoteId ────► CatalogQuote
         └────── userQuoteId ──────► UserQuote

AppliedTag ────── catalogQuoteId / userQuoteId ────► quote
           └───── systemTagId / userTagId ──────────► tag
```
