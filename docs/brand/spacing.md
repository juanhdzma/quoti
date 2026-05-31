# Quoti — Spacing & Grid

## Base unit

**4pt.** Every spacing value is a multiple of 4.

## Spacing scale

| Token      | Value | Use                                        |
|------------|-------|--------------------------------------------|
| `space-1`  | 4pt   | Inline gaps, icon-to-label distance        |
| `space-2`  | 8pt   | Tag padding, tight stacks                  |
| `space-3`  | 12pt  | Between meta elements, small gaps          |
| `space-4`  | 16pt  | Section vertical spacing, input padding    |
| `space-5`  | 20pt  | Card horizontal margin from screen edge    |
| `space-6`  | 24pt  | Screen horizontal padding (main margin)    |
| `space-8`  | 32pt  | Between sections                           |
| `space-12` | 48pt  | Large vertical gaps, top-level spacing     |

## Layout grid

- **Screen width (base):** 375pt
- **Horizontal margin:** 24pt → content width = 327pt
- **Card margin from edge:** 20pt → card width = 335pt
- Single-column layout. No multi-column grids.

## Corner radius

| Token         | Value  | Use                              |
|---------------|--------|----------------------------------|
| `radius-xs`   | 6pt    | Tags, chips, small badges        |
| `radius-sm`   | 12pt   | Inputs, small surfaces           |
| `radius-md`   | 16pt   | Secondary cards                  |
| `radius-lg`   | 24pt   | Featured cards, main containers  |
| `radius-full` | 999pt  | Pills, circular buttons          |

## Component heights

| Component        | Height  |
|------------------|---------|
| Nav bar          | 83pt    |
| Header area      | ~80pt   |
| Quote list item  | ~68pt   |
| FAB / icon btn   | 38pt    |
| Tag / chip       | 22pt    |

## Rules

- Never use odd spacing values (e.g. 13pt, 22pt) in new components — snap to the scale.
- Screen horizontal padding is always `space-6` (24pt). No exceptions.
- Cards are inset by `space-5` (20pt), not flush to the screen.
- Safe area bottom must be respected — add at least 30pt below nav content.
