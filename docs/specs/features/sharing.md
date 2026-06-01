# Feature: Sharing

## Objective
Let users share quotes as plain text or as a branded image.

## Options
1. **Copy text** — copies quote + author name to clipboard
2. **Share image** — generates a branded image and opens the iOS share sheet

## Branded Image Spec
- Background: brand paper color
- Quote text: Lora font, large
- Author name: Inter font, smaller, below quote
- Quoti logo or wordmark in a corner (subtle)
- Aspect ratio: 1:1 (works for IG, WhatsApp)

## Acceptance Criteria
- Copy text: `"[quote text]" — [author name]` lands in clipboard
- Share image: image is generated in-memory and passed to `UIActivityViewController`
- Both actions are accessible from Quote Detail and from the Quote of the Day card
- Image generation is fast enough to feel instant (<300ms on recent devices)

## Edge Cases
- Very long quote: image layout adapts (smaller font or scrollable crop)
- Author is "Unknown": copy text shows `"[quote text]"` with no attribution line; image omits author line
- Author is "Me": shows "Me" as attribution
