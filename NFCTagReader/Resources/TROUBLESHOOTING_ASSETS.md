# Troubleshooting Assets - Company Page Image & App Icon

## Issue: Images not loading after rebuild

### For company_page.png:

**Step 1: Verify the image is in Assets.xcassets**
1. In Xcode Project Navigator, click on **Assets.xcassets**
2. Look for an asset named **"company_page"** (without .png extension)
3. If you don't see it, you need to add it:
   - Right-click in the Assets list → **New Image Set**
   - Name it exactly: **company_page** (no .png)
   - Drag your `company_page.png` file into the "Any" or "1x" slot

**Step 2: Check the image name**
- Asset names in the catalog should NOT include the file extension
- If your asset is called "company_page.png" in Assets, rename it to just "company_page"
- Or if it's named something else, update the code to match

**Step 3: Clean and rebuild**
```
Product → Clean Build Folder (Cmd+Shift+K)
Product → Build (Cmd+B)
Run on device
```

**Step 4: Check the console**
- After running the app and triggering the NFC scan, check Xcode's console output
- Look for messages like:
  - ✅ "Loaded: company_page" = Success!
  - ❌ "ERROR: Could not load company page image" = Image not found

**Step 5: If you see the error message on screen**
- The CompanyCardViewController is loading correctly
- The problem is just the image name/location
- Double-check Assets.xcassets

---

### For LinkedIn_icon.png (App Icon):

**Step 1: Verify icon requirements**
- App icons must be **exactly 1024x1024 pixels** for the main slot
- Must be PNG format
- Should NOT have transparency (alpha channel)
- Should NOT have rounded corners (iOS adds those automatically)

**Step 2: Add to Assets.xcassets**
1. In Xcode, click **Assets.xcassets**
2. Look for **AppIcon** in the list
3. If it doesn't exist, right-click → **App Icons & Launch Images → New iOS App Icon**
4. Click on **AppIcon**
5. You'll see many empty slots for different sizes
6. Drag your `LinkedIn_icon.png` into the **1024x1024** slot (labeled "App Store iOS")
7. Xcode should auto-generate smaller sizes, or you can add them individually

**Step 3: Verify it's selected in project settings**
1. Click your project name at the top of the Project Navigator
2. Select your app target (under TARGETS)
3. Go to **General** tab
4. Under **App Icons and Launch Screen**, make sure it says **"AppIcon"**

**Step 4: Force icon refresh on device**
```bash
# Option 1: Delete app from device first
- Long-press app icon on iPhone
- Tap "Remove App" → "Delete App"
- Then rebuild and install from Xcode

# Option 2: Clean build
Product → Clean Build Folder (Cmd+Shift+K)
Delete app from device
Rebuild and run
```

**Step 5: If icon still doesn't change**
- Restart your iPhone (sometimes iOS caches icons aggressively)
- Make sure you're looking at the right app (not an old copy)
- Try changing the Bundle Identifier slightly to force a "new" app

---

### Quick Diagnostic Test

**Run the app and check:**

1. **Does the Company Card screen appear at all after NFC scan?**
   - YES: Good! The view controller works
   - NO: Check navigation in `MessagesTableViewController 2.swift`

2. **Do you see a red error message on screen?**
   - YES: Image not in Assets or wrong name
   - NO: Either it's working, or the screen isn't loading

3. **Check Xcode console output**
   - Look for the print statements I added
   - They'll tell you exactly what's happening

4. **For app icon, look at:**
   - Home screen on your iPhone
   - Recent apps list
   - Settings → General → iPhone Storage (shows all installed apps with icons)

---

### Alternative: Use file-based image (temporary workaround)

If Assets.xcassets keeps causing issues, you can try adding the image directly to the project:

1. Drag `company_page.png` directly into your Xcode project (not Assets)
2. Make sure "Copy items if needed" is checked
3. Make sure your target is selected

Then the code should already handle this with:
```swift
UIImage(named: "company_page.png")
```

---

### Need More Help?

Run the app, trigger the NFC scan, and tell me:
1. What you see on screen (white screen? error message? nothing?)
2. What the Xcode console says (copy the output)
3. Whether you can see "company_page" in Assets.xcassets
4. Whether you can see "AppIcon" in Assets.xcassets with your LinkedIn icon

This will help me figure out exactly what's wrong! 🔍
