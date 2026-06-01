# Quoti — Product Spec

## What it is

A personal quotes app for iOS. Quoti lets users collect, organize, and discover meaningful quotes. The catalog ships with the app and updates via releases — no backend, full privacy.

## What it is NOT

- Not a social app (no follows, likes, or shared collections)
- Not a server-driven content platform (no API calls for quotes)
- Not a note-taking or journaling app

---

## Core Features

### Browse & Discovery
- Home screen with **Quote of the Day** — one featured quote, rotates daily
- Explore by **system tag** (bundled topics like Stoicism, Leadership, etc.)
- Explore by **author** — author profile shows photo, birthplace, bio, and all their quotes
- **Related quotes** — when viewing a quote, surface others from the same author or tags
- **Random quote** — shuffle button to land on a surprise quote

### Search
- Full-text search across quote text, author name, and tags

### Favorites
- Save any quote to favorites
- Favorites are accessible from a dedicated section in Library

### Tags
Two types, visually differentiated by color:
- **System tags** — bundled with the app, translated EN/ES, applied to catalog quotes (e.g. Stoicism, Creativity)
- **User tags** — created by the user, single name (no translation), applicable to any quote (catalog or custom)
- A quote can have multiple tags of either type
- Both types are browsable

### Custom Quotes
- User can add quotes not in the catalog
- Single text field — no translation
- Author attribution: existing author from catalog / Unknown / Me
- Adding to an existing author attaches the quote to that author's profile

### Sharing
- Copy quote text to clipboard
- Export quote as a branded image (uses brand palette and typography)

---

## Settings

Synced across devices via **iCloud KV Store** (`NSUbiquitousKeyValueStore`).

| Setting | Options |
|---|---|
| UI Language | English / Español |
| Quotes Language | English / Español |
| Theme | Light / Dark / System |
| Daily Notification | On/Off + time picker |

UI Language and Quotes Language are independent — a user can have the app in Spanish and read quotes in English.

---

## Widgets & Notifications

- **Home screen widget** — displays current Quote of the Day
- **Lock screen widget** — compact quote display
- **Daily notification** — optional push notification with a quote

---

## Data & Sync

- Catalog (quotes, authors, system tags) is bundled in the app binary; updated via App Store releases
- User data (favorites, user tags, custom quotes) syncs via **iCloud (SwiftData + CloudKit)**
- App settings sync via **iCloud KV Store**
- No Quoti-owned servers, no analytics, no telemetry

---

## Out of Scope (v1)

- Social features (follows, shared collections, comments)
- Server-side content delivery
- Highlights or annotations within quotes
- Multi-device conflict resolution UI (CloudKit handles it silently)
- Streak / gamification
