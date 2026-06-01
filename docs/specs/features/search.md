# Feature: Search

## Objective
Let users find quotes, authors, and tags quickly across the full catalog and their personal data.

## Acceptance Criteria
- Search is accessible from any tab via nav bar icon
- Results appear live as the user types (debounced ~300ms)
- Scoped tabs: All / Quotes / Authors / Tags
- Tags scope shows both system tags and user tags (with their respective colors)
- Searching "All" returns mixed results ranked: exact matches first, then partial
- Empty query shows suggested system tags
- No results state is shown when nothing matches

## Search Fields
| Scope | Fields searched |
|---|---|
| Quotes | quote text (EN + ES) |
| Authors | name |
| Tags | system tag name (EN + ES), user tag name |

## Edge Cases
- Very short queries (1–2 chars): search only after 2+ characters
- Accented characters: "stoicism" matches "Stoicismo", normalize before comparing
- User has no custom data: Tags scope still shows system tags
