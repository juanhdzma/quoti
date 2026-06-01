# Feature: Widgets

## Objective
Let users see the Quote of the Day from their home screen or lock screen without opening the app.

## Widget Types

### Home Screen Widget
- Sizes: medium and large
- Content: quote text + author name
- Long quote text truncates gracefully with ellipsis

### Lock Screen Widget
- Size: rectangular accessory
- Content: quote text only (space is limited)
- Truncates to ~80 characters

## Acceptance Criteria
- Both widgets display the same quote as the Today tab
- Widgets refresh at midnight local time (new quote of the day)
- Tapping a widget deep-links into the app and opens Quote Detail for that quote
- If no quote is available (first install, before first launch), show a placeholder

## Update Schedule
- Use `TimelineProvider` with a single entry per day
- Entry expires at midnight — WidgetKit requests a new timeline automatically

## Edge Cases
- App not yet launched: widget shows placeholder until user opens the app
- iCloud KV not synced yet on a new device: widget uses local fallback
