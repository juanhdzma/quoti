# Feature: Custom Quotes

## Objective
Let users add quotes that aren't in the catalog, with full control over attribution and tagging.

## Acceptance Criteria
- User can add a quote from the Library tab
- Required field: quote text (non-empty)
- Author attribution options:
  - Search and select an existing catalog author
  - Select "Unknown" (reserved author ID: 1)
  - Select "Me" (reserved author ID: 2)
- Optional: one or more system tags
- Optional: one or more user tags
- Saved quotes appear in Library > My Quotes
- Saved quotes appear in the selected author's profile (if a catalog author was chosen)
- User can edit or delete their custom quotes

## Validation
- Quote text: required, max 1000 characters
- Author: required (defaults to Unknown if user skips)

## Edge Cases
- User selects a catalog author then edits the quote: author attribution is preserved
- User deletes a catalog author's quote: removed from that author's profile
- iCloud sync conflict (same quote edited on two devices): CloudKit last-write-wins
