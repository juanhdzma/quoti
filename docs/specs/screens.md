# Quoti — Screens & Navigation

## Navigation Structure

```
TabView
├── Today
├── Explore
├── Library
└── Settings

Search (sheet, accessible via nav bar icon from any tab)
Quote Detail (sheet or push, accessible from any screen)
```

---

## Tabs

### Today
Entry point of the app. One featured quote per day.

**Content:**
- Quote of the Day card (large, prominent)
- Author name + system tags on the card
- Quick actions on the card: favorite, share, copy
- Horizontal scroll row: "More from this author"
- Horizontal scroll row: "More with this tag"

**Navigation:**
- Tap author → Author Profile
- Tap system tag → System Tag Detail
- Tap any quote card → Quote Detail

---

### Explore
Browsable catalog entry point.

**Content:**
- Random quote button (top, prominent)
- System tags grid — each cell shows tag name + quote count
- Authors list — sorted alphabetically, searchable inline

**Navigation:**
- Tap random → Quote Detail (random quote)
- Tap system tag → System Tag Detail
- Tap author → Author Profile

---

### Library
User's personal collection.

**Sections:**
- Favorites — all favorited quotes
- My Tags — list of user-created tags with quote count (distinct color from system tags)
- My Quotes — quotes added by the user

**Navigation:**
- Tap quote → Quote Detail
- Tap user tag → User Tag Detail
- Tap "Add quote" button → Add Custom Quote sheet

---

### Settings
App preferences.

**Content:**
- UI Language: English / Español
- Quotes Language: English / Español
- Theme: Light / Dark / System
- Daily Notification: toggle + time picker
- Widget section: link to iOS widget configuration instructions

---

## Global Screens

### Search
Triggered by search icon in nav bar. Presented as a sheet or full-screen overlay.

**Content:**
- Search bar (auto-focused on open)
- Scoped tabs: All / Quotes / Authors / Tags
- Results list, live as user types — system tags and user tags shown with their respective colors
- Empty state with suggested system tags

**Navigation:**
- Tap result → Quote Detail or Author Profile or System Tag Detail or User Tag Detail

---

### Quote Detail
Presented as a sheet (swipe to dismiss) or pushed depending on context.

**Content:**
- Full quote text
- Author name + tap to go to Author Profile
- System tags applied to this quote
- User tags applied to this quote (editable inline, distinct color)
- Actions: Favorite toggle, Copy text, Share image, Add user tag

**Navigation:**
- Tap author → Author Profile
- Tap system tag → System Tag Detail
- Tap user tag → User Tag Detail

---

### Author Profile
**Content:**
- Author photo (if available)
- Author name + birthplace (if available)
- Short bio (if available)
- Quote count
- Full list of their quotes

**Navigation:**
- Tap quote → Quote Detail

---

### System Tag Detail
**Content:**
- Tag name (EN or ES depending on quotes language setting)
- Full list of quotes with this tag
- Sort options: default, random

**Navigation:**
- Tap quote → Quote Detail

---

### User Tag Detail
**Content:**
- Tag name (editable inline)
- All quotes tagged with it (catalog and custom)
- Option to delete tag

**Navigation:**
- Tap quote → Quote Detail

---

### Add Custom Quote
Presented as a sheet.

**Content:**
- Quote text field (single language)
- Author picker: search existing authors / Unknown / Me
- System tag picker (optional)
- User tag picker (optional)
- Save / Cancel

---

## Empty States

| Screen | Empty State |
|---|---|
| Favorites | "No favorites yet — tap ♥ on any quote" |
| My Quotes | "Add your first quote" + CTA button |
| My Tags | "No tags yet — add one from any quote" |
| Search | "No results" + suggestion to browse system tags |
