# FINAL SETUP - 3 STEPS

## Step 1: App Display Name → "Fair Companion"

### In Xcode:
```
1. Click your project name (top of left sidebar)
2. Under TARGETS, select your app
3. General tab
4. Find "Display Name" field
5. Type: Fair Companion
6. Press Enter
```

**Alternative:** Edit Info.plist and add:
```xml
<key>CFBundleDisplayName</key>
<string>Fair Companion</string>
```

---

## Step 2: App Icon → LinkedIn_icon

### In Xcode:
```
1. Click Assets.xcassets (left sidebar)
2. Click AppIcon
3. Drag LinkedIn_icon.png → into the 1024pt box
4. Done!
```

**Requirements:**
- Image must be 1024×1024 pixels
- PNG format
- No transparency
- No rounded corners

---

## Step 3: Company Page Image → company_page

### In Xcode:
```
1. Click Assets.xcassets
2. If you don't see "company_page":
   - Right-click → New Image Set
   - Rename to: company_page
3. Drag your Figma export PNG → into the box
4. Done!
```

---

## Build & Install:

```
1. Product → Clean Build Folder (⌘⇧K)
2. Delete old app from iPhone
3. Product → Run
4. Check home screen: Should show LinkedIn icon + "Fair Companion"
5. Test NFC flow: Should show your company_page image full-screen
```

---

## Verify It Works:

### ✅ Home Screen Check:
- [ ] Icon is LinkedIn logo (not default grid)
- [ ] Name says "Fair Companion" (not NFCTagReader)

### ✅ App Flow Check:
- [ ] Opens to "Ready to Check In" screen
- [ ] Tap button → NFC modal appears
- [ ] After 3 sec → "Booth check-in successful! ✓"
- [ ] Company page image appears full-screen

### ✅ Console Check (in Xcode):
- [ ] See: "🎯 showCompanyCard() called"
- [ ] See: "✅ Successfully loaded company_page image"
- [ ] No ❌ error messages

---

## If Something Doesn't Work:

### App name still says "NFCTagReader":
→ Delete app from iPhone, restart iPhone, reinstall

### Icon still shows default/wrong icon:
→ Verify icon is 1024×1024, delete app, restart iPhone, reinstall

### Company page doesn't show:
→ Check Assets.xcassets has "company_page" asset (exact name)
→ Check console for error messages

---

## Assets.xcassets Should Contain:

```
Assets.xcassets/
├── AppIcon
│   └── 1024pt slot: LinkedIn_icon.png
└── company_page
    └── Any/1x slot: your-figma-export.png
```

---

## That's It! 🎉

Three assets in Assets.xcassets:
1. AppIcon with LinkedIn icon
2. company_page with Figma export

One setting change:
1. Display name to "Fair Companion"

Then clean build, delete old app, reinstall, and test!

Perfect for filming your LinkedIn Campus Fair demo! 🎬
