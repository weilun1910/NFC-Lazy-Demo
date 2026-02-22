# Quick Setup Reference

## ✅ What I Changed in the Code:

### CompanyCardViewController.swift
- **Changed:** Now displays full-screen `company_page` image from Assets.xcassets
- **Removed:** All the custom UI (cards, buttons, labels, badges)
- **Added:** Error handling and logging if image not found

### MessagesTableViewController 2.swift (CampusFairCheckInViewController)
- **Added:** Debug logging to track navigation flow

---

## 🛠️ What You Need to Do in Xcode:

### 1. Change App Display Name to "Fair Companion"

**Quick Method:**
1. Click project name in Project Navigator
2. Select your target under TARGETS
3. General tab → Display Name field → Enter `Fair Companion`

**OR edit Info.plist:**
- Add/edit `CFBundleDisplayName` key to `Fair Companion`

---

### 2. Set App Icon to "LinkedIn_icon"

1. Open **Assets.xcassets**
2. Click on **AppIcon**
3. Drag `LinkedIn_icon.png` (must be 1024×1024) into the **"App Store iOS 1024pt"** slot
4. Save

**Verify:**
- Project → Target → General → App Icons should show "AppIcon"

---

### 3. Add "company_page" Figma Export

1. Open **Assets.xcassets**
2. If "company_page" doesn't exist:
   - Right-click → New Image Set
   - Rename to `company_page`
3. Drag your Figma export PNG into the "Any" or "1x" slot

---

## 🧪 Build & Test:

```bash
# In Xcode:
Product → Clean Build Folder (Cmd+Shift+K)

# On iPhone:
Delete the old app (long-press → Remove App)

# In Xcode:
Product → Run
```

---

## ✨ Expected Result:

**Home Screen:**
- Icon: LinkedIn logo
- Name: "Fair Companion"

**After NFC Scan:**
- Full-screen display of your `company_page` Figma export
- No custom UI, just the static image

**Console Output:**
```
🎯 showCompanyCard() called - Creating CompanyCardViewController
✅ Navigation controller exists, pushing CompanyCardViewController
✅ Successfully loaded company_page image from Assets
```

---

## 📁 Assets Required:

Make sure these are in **Assets.xcassets**:

1. **AppIcon** (asset type: App Icon)
   - Contains: `LinkedIn_icon.png` at 1024×1024

2. **company_page** (asset type: Image Set)
   - Contains: Your Figma export PNG (any size, recommend @2x or higher)

---

## 🆘 If Something's Wrong:

**Check Console for:**
- ❌ Error messages about missing images
- ✅ Success messages confirming images loaded

**Common Issues:**
- Image not in Assets → Add it
- Wrong image name → Must be exactly "company_page" and "AppIcon"
- App icon cached → Delete app, restart iPhone
- Display name not changing → Edit Info.plist, delete old app

**Need Help?**
Share:
1. Xcode console output
2. What you see on screen after NFC scan
3. Screenshot of Assets.xcassets showing your assets

---

## 📋 Pre-Flight Checklist:

Before recording your demo video:

- [ ] Assets.xcassets has `company_page` with your Figma export
- [ ] Assets.xcassets has `AppIcon` with LinkedIn icon
- [ ] Info.plist has `CFBundleDisplayName = Fair Companion`
- [ ] Old app deleted from iPhone
- [ ] Clean build performed
- [ ] App installed on iPhone
- [ ] Home screen shows "Fair Companion" with LinkedIn icon
- [ ] NFC scan flow works (3 second timer)
- [ ] Company page appears after scan
- [ ] Image looks correct (full-screen, aspect fit)

**You're ready to film! 🎬**
