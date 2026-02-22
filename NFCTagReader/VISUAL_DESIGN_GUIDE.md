# Visual Design Guide

## Screen 1: Ready to Check In

```
┌─────────────────────────────────────┐
│ ← Campus Fair                       │ ← Navigation Bar (Large Title)
├─────────────────────────────────────┤
│                                     │
│              ┌─────┐                │
│              │ 🏢  │                │ ← Building icon (LinkedIn blue)
│              │     │                │   120x120 pt
│              └─────┘                │
│                                     │
│        Ready to Check In            │ ← Bold, 32pt
│                                     │
│   Tap a recruiter's booth tag to    │ ← Secondary text, 17pt
│   save your visit and view company  │
│            info                     │
│                                     │
│                                     │
│                                     │
│                                     │
│                                     │
│  ┌───────────────────────────────┐  │
│  │   Check In at Booth           │  │ ← Blue button (#0A66C2)
│  └───────────────────────────────┘  │   White text, 56pt height
│                                     │   Rounded corners (12pt)
└─────────────────────────────────────┘
```

### Colors:
- Background: System Background (white/light gray)
- Icon: LinkedIn Blue (#0A66C2)
- Title: Label (black/white based on theme)
- Subtitle: Secondary Label (gray)
- Button Background: LinkedIn Blue (#0A66C2)
- Button Text: White

---

## Screen 2: Company Card (After NFC Success)

```
┌─────────────────────────────────────┐
│ ← Booth Visit                       │ ← Navigation Bar
├─────────────────────────────────────┤
│ ╔═════════════════════════════════╗ │
│ ║         ┌──────┐                ║ │
│ ║         │ 🏢   │                ║ │ ← Logo placeholder
│ ║         └──────┘                ║ │   100x100 pt, rounded
│ ║                                 ║ │
│ ║        Anthropic                ║ │ ← Company name, bold 28pt
│ ║                                 ║ │
│ ║   ┌─────────────────────┐       ║ │
│ ║   │ AI Safety & Research │      ║ │ ← Industry tag (blue bg)
│ ║   └─────────────────────┘       ║ │
│ ║                                 ║ │
│ ║   ✓ Saved to your visits        ║ │ ← Green badge
│ ║                                 ║ │
│ ║   Anthropic builds AI systems   ║ │
│ ║   that are safe, beneficial,    ║ │ ← Info blurb
│ ║   and understandable.           ║ │
│ ║                                 ║ │
│ ║  ┌────────────┐ ┌─────────────┐ ║ │
│ ║  │  ★ Star    │ │  📝 Add Note│ ║ │ ← Action buttons
│ ║  └────────────┘ └─────────────┘ ║ │   (Blue border, light blue bg)
│ ╚═════════════════════════════════╝ │
└─────────────────────────────────────┘
```

### Card Details:

**Card Container:**
- Background: White
- Corner Radius: 16pt
- Shadow: Subtle (opacity 0.1, radius 8pt)
- Padding: 20pt from screen edges

**Logo View:**
- Size: 100x100 pt
- Background: LinkedIn Blue with 10% opacity
- Icon: Building.2 SF Symbol (60x60 pt)
- Icon Color: LinkedIn Blue
- Corner Radius: 12pt

**Company Name:**
- Font: System Bold, 28pt
- Color: Primary Label
- Alignment: Center

**Industry Tag:**
- Background: LinkedIn Blue with 10% opacity
- Text Color: LinkedIn Blue
- Font: System Medium, 15pt
- Padding: 8pt vertical, 16pt horizontal
- Corner Radius: 8pt
- Height: 32pt

**Saved Badge:**
- Background: Green with 10% opacity
- Height: 40pt
- Checkmark Icon: 20x20 pt, System Green
- Text: "Saved to your visits"
- Font: System Medium, 15pt
- Color: System Green
- Corner Radius: 8pt

**Info Blurb:**
- Font: System Regular, 16pt
- Color: Secondary Label
- Alignment: Center
- Line Limit: Multiple lines

**Action Buttons:**
- Width: Equal (in horizontal stack)
- Height: 50pt
- Background: LinkedIn Blue with 10% opacity
- Border: 1pt solid LinkedIn Blue
- Text Color: LinkedIn Blue
- Font: System Semibold, 17pt
- Corner Radius: 12pt
- Spacing between buttons: 12pt

---

## NFC Scanning Sheet (Native iOS)

When "Check In at Booth" is tapped, the native NFC scanning sheet appears:

```
┌─────────────────────────────────────┐
│                                     │
│         Ready to Scan               │ ← System UI (can't customize)
│                                     │
│            ◯ ◯ ◯                    │ ← Animated scanning indicator
│                                     │
│   Hold your iPhone near the         │
│   booth tag...                      │ ← Your custom alert message
│                                     │
│   [After 3 seconds, changes to:]    │
│                                     │
│   Booth check-in successful! ✓      │ ← Success message
│                                     │
│                                     │
│           [Cancel]                  │
│                                     │
└─────────────────────────────────────┘
```

The sheet automatically dismisses after showing the success message, then transitions to the Company Card.

---

## Animation Flow

1. **Launch** → Screen 1 (Ready to Check In) fades in
2. **Tap button** → NFC sheet slides up from bottom
3. **3 seconds pass** → Alert message updates to success
4. **0.5 seconds later** → NFC sheet slides down
5. **Immediately** → Company Card pushes in from right (standard nav push)

---

## Responsive Design Notes

- All spacing uses Auto Layout with constraints
- Safe area insets are respected
- Layout adapts to different iPhone sizes
- Works in portrait orientation (optimized)
- Text labels support Dynamic Type

---

## Accessibility

- All images have accessibility labels
- Button has clear label and hint
- Text is readable at default and larger sizes
- Color contrast meets WCAG AA standards
- VoiceOver reads content in logical order

---

## Brand Consistency

**LinkedIn Blue (#0A66C2) is used for:**
- Primary button background
- Icon colors
- Industry tag text and background tint
- Action button borders and background tint

**System Colors are used for:**
- Success indicators (green)
- Text labels (adapts to dark/light mode)
- Backgrounds (adapts to dark/light mode)

This creates a professional appearance that looks like a LinkedIn product while respecting iOS design patterns.

---

## Demo Filming Checklist

✅ Phone in Portrait mode
✅ Brightness at 80-100%
✅ Do Not Disturb enabled (no notifications)
✅ Clean status bar (full battery, good signal)
✅ Hide non-essential UI elements
✅ Practice the timing (tap, wait 3s, transition)
✅ Use iOS screen recording for best quality
✅ Consider adding voiceover explaining the flow

**Recommended narrative:**
"When students arrive at a recruiter booth, they simply tap the 'Check In' button, hold their phone near the booth's NFC tag, and within seconds they're checked in. The app then shows them detailed company information, saves the visit to their profile, and allows them to star favorites or add notes for later."
