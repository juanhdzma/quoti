# Feature: Tags

## Objective
Let users organize quotes with personal tags, on top of the system tags that come with the catalog.

## Two Tag Types

### System Tags
- Bundled with the app, updated via releases
- Translated EN/ES, display language follows Quotes Language setting
- Read-only — users cannot edit or delete them
- Applied to catalog quotes in the bundle; can also be applied to custom quotes

### User Tags
- Created by the user, single name (no translation)
- Displayed with a distinct color from system tags throughout the app
- Can be applied to any quote: catalog or custom
- User can rename or delete them

## Acceptance Criteria
- User can create a tag from Quote Detail ("Add tag" action)
- User can apply existing tags from the same action
- User can remove a tag from a quote inline in Quote Detail
- User Tag Detail shows all quotes with that tag (catalog + custom)
- Deleting a user tag removes all its AppliedTag links
- Renaming a user tag updates everywhere it appears

## Edge Cases
- Duplicate tag name: allow it (user may want two separate tags with the same name)
- Tag with no quotes: still visible in Library > My Tags
- Deleting a quote that has user tags applied: remove its AppliedTag links, keep the tags themselves
