# Feature: Quote of the Day

## Objective
Surface one featured quote per day on the Today tab. Gives users a reason to open the app daily.

## Acceptance Criteria
- One quote is selected per calendar day (resets at midnight local time)
- The same quote is shown all day regardless of how many times the app is opened
- Quote persists across app restarts (stored in iCloud KV Store)
- On first launch, a quote is selected immediately
- Widgets and notifications use the same quote as the Today tab

## Selection Logic
- Random selection from the catalog
- Avoid repeating the same quote within the last 30 days (store last 30 IDs in iCloud KV)
- If the catalog has fewer than 30 quotes, allow repeats

## Edge Cases
- App opened for the first time: select a quote, store ID + today's date
- Date changes while app is in foreground: rotate quote without requiring restart
- iCloud KV not available on first launch: fall back to on-device random selection, sync when available
- Catalog update removes the stored quote ID: select a new one silently
