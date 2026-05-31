# Quoti — Motion

## Philosophy

Every interaction should feel like the UI is *alive* — not animated, alive. The goal is zero perceived latency: the interface reacts before the user finishes the gesture. Physics over timers. Spring over duration.

**One rule:** if removing an animation makes the app feel faster, remove it. Motion serves fluidity, not decoration.

---

## Spring system

All animations use springs. No `easeInOut`, no `linear` unless absolutely forced (e.g. looping indicators).

| Token           | Response | Damping | Use                                             |
|-----------------|----------|---------|--------------------------------------------------|
| `spring-micro`  | 0.25s    | 1.0     | Tap feedback, toggles, immediate state changes   |
| `spring-smooth` | 0.35s    | 0.85    | Cards appearing, content transitions             |
| `spring-expressive` | 0.45s | 0.70   | Featured card, modal entry, hero elements        |
| `spring-gentle` | 0.55s    | 0.90   | Page transitions, list reordering                |

```swift
// SwiftUI tokens
extension Animation {
    static let micro       = Animation.spring(response: 0.25, dampingFraction: 1.0)
    static let smooth      = Animation.spring(response: 0.35, dampingFraction: 0.85)
    static let expressive  = Animation.spring(response: 0.45, dampingFraction: 0.70)
    static let gentle      = Animation.spring(response: 0.55, dampingFraction: 0.90)
}
```

---

## Interaction feedback

### Press / tap
Every tappable element scales down on press. No exceptions.

```swift
.scaleEffect(isPressed ? 0.96 : 1.0)
.animation(.micro, value: isPressed)
```

- Cards: scale to `0.97`
- Buttons (small): scale to `0.93`
- Nav items: scale to `0.88`

### Haptics
Pair haptics with animations — they amplify the physical feel.

| Moment                    | Haptic                   |
|---------------------------|--------------------------|
| Add quote                 | `.medium` impact         |
| Save / confirm            | `.light` impact          |
| Delete / destructive      | `.heavy` impact          |
| Toggle favorite           | `.soft` impact           |
| Long press trigger        | `.rigid` impact          |
| Error / shake             | notification `.error`    |

---

## Transitions

### Screen / navigation
Use `.slide` with a spring curve. Never the default `push` — it feels mechanical.

```swift
.transition(.asymmetric(
    insertion: .move(edge: .trailing).combined(with: .opacity),
    removal:   .move(edge: .leading).combined(with: .opacity)
))
.animation(.gentle, value: navigationPath)
```

### Modal / sheet
Entry: slide up + slight scale from `0.96` to `1.0`.
Dismissal: reverse, faster (use `spring-smooth`).

### List items appearing
Stagger: each item delays `0.04s` from the previous one. Max 6 items staggered — after that, no delay.

```swift
.transition(.move(edge: .bottom).combined(with: .opacity))
.animation(.smooth.delay(Double(index) * 0.04), value: isVisible)
```

### Featured card
Entry is the most expressive moment — deserves `spring-expressive` + scale from `0.94`.

---

## Scroll behavior

- **Momentum:** never fight scroll. Don't animate things that interfere with active scroll.
- **Parallax on featured card:** subtle vertical offset at `0.3x` scroll speed.
- **Header compression:** title scales from 30pt → 18pt as user scrolls. Smooth, continuous, not stepped.
- **Overscroll:** no bounce amplification — let the system handle it naturally.

---

## State changes

| Transition              | Animation       | Notes                              |
|-------------------------|-----------------|------------------------------------|
| Empty → content         | `spring-smooth` | Fade + slide up                    |
| Loading → loaded        | `spring-gentle` | Content fades in, skeleton fades out |
| Active → inactive tab   | `spring-micro`  | Icon scale + color crossfade       |
| Tag selected            | `spring-micro`  | Background fill expands from center |
| Quote favorited         | `spring-expressive` | Heart bounces to 1.3x then settles |

---

## What does NOT animate

- Text content changing (avoid jarring reflow)
- Error messages — they appear instantly to not delay feedback
- Skeleton loaders — static, no shimmer. Shimmer is distracting.
- Background color of the screen — never transition the root background
- Anything the user didn't trigger

---

## Performance rules

- Use `withAnimation` at the call site, not inside views.
- Prefer `opacity` and `scale` over `offset` — GPU-composited, no layout recalculation.
- Never animate `frame` or `padding` directly — use `scaleEffect` + `opacity` combinations.
- Test on a real device at all times. Simulator hides jank.
- 60fps minimum. 120fps (ProMotion) is the target on supported devices — springs adapt automatically.
