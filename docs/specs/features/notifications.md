# Feature: Daily Notification

## Objective
Optional daily push notification that delivers a quote at a user-chosen time.

## Acceptance Criteria
- User can enable/disable from Settings
- User can pick the delivery time (default: 8:00 AM)
- Notification shows quote text + author name
- Tapping the notification deep-links to Quote Detail for that quote
- Setting syncs across devices via iCloud KV Store

## Notification Content
- Title: author name
- Body: quote text (truncated if needed by iOS)
- Deep link payload: quote ID

## Quote Selection
- Same as Quote of the Day — reuses the daily quote, not a separate random pick

## Edge Cases
- User disables notifications at OS level: Settings toggle reflects the actual permission state
- Time zone change: reschedule notification with new local time
- App update changes the quote of the day ID: reschedule with updated payload
- Notification permission not granted: prompt once, then respect the user's decision
