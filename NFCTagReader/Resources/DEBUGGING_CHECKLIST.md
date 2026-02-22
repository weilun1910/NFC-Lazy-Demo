# Debugging Checklist - Company Page Not Showing

## What I Just Added:

I've added debug logging to help diagnose the issue. When you run the app and complete the NFC scan, check the **Xcode Console** (bottom panel in Xcode) for these messages:

### Expected Console Output:

```
🎯 showCompanyCard() called - Creating CompanyCardViewController
✅ Navigation controller exists, pushing CompanyCardViewController
✅ Loaded: company_page
```

### Possible Error Messages:

```
❌ ERROR: No navigation controller!
```
→ **Problem:** The view controller isn't embedded in a navigation controller
→ **Fix:** Check your storyboard or initial view controller setup


```
❌ ERROR: Could not load company page image!
❌ Make sure 'company_page.png' is added to Assets.xcassets
```
→ **Problem:** Image file not found in Assets
→ **Fix:** Add company_page.png to Assets.xcassets (see steps below)

---

## Step-by-Step Checklist:

### ✅ Step 1: Clean Build
```
1. Product → Clean Build Folder (Cmd+Shift+K)
2. Wait for it to finish
3. Product → Build (Cmd+B)
4. Run on your physical iPhone
```

### ✅ Step 2: Test the Flow
```
1. App opens to "Ready to Check In" screen
2. Tap "Check In at Booth" button
3. NFC scanning modal appears
4. Wait 3 seconds (or cancel early)
5. NFC modal should dismiss with "Booth check-in successful! ✓"
6. Company Card screen should appear immediately after
```

### ✅ Step 3: Check Xcode Console
```
1. While app is running, look at bottom panel in Xcode
2. If you don't see it: View → Debug Area → Show Debug Area (Cmd+Shift+Y)
3. Look for the emoji messages (🎯 ✅ ❌)
4. Copy the output and share it with me if you see errors
```

### ✅ Step 4: Add company_page.png to Assets

**In Xcode:**

1. Find **Assets.xcassets** in Project Navigator (left sidebar)
2. Click on it to open
3. Look for an asset named **"company_page"**
   - If it exists: Click on it and verify the image is visible
   - If it doesn't exist: Continue to step 4

4. **Create new image asset:**
   - Right-click anywhere in Assets list
   - Choose "New Image Set"
   - Name it exactly: **company_page** (no .png extension!)
   - Drag your `company_page.png` file into the "Any" or "1x" slot

5. **Verify it worked:**
   - Click on "company_page" in the Assets list
   - You should see a thumbnail of your image
   - The name at the top should be exactly "company_page"

6. **Rebuild and test again**

---

### ✅ Step 5: Add LinkedIn_icon.png as App Icon

**In Xcode:**

1. Open **Assets.xcassets**
2. Look for **AppIcon** in the left list
   - If it doesn't exist: Right-click → App Icons & Launch Images → New iOS App Icon

3. Click on **AppIcon**

4. You'll see many empty squares for different icon sizes

5. **Quick method (recommended):**
   - Find the large square labeled "App Store iOS 1024pt"
   - Drag your `LinkedIn_icon.png` file into it
   - Make sure your icon is exactly 1024×1024 pixels

6. **Verify project settings:**
   - Click your project name at the top of Project Navigator
   - Select your app target
   - General tab
   - Under "App Icons and Launch Screen" it should say **AppIcon**

7. **Force icon update on device:**
   ```
   - Delete the app from your iPhone (long-press → Remove App)
   - Clean Build Folder in Xcode (Cmd+Shift+K)
   - Rebuild and reinstall
   - May need to restart your iPhone if icon still doesn't change
   ```

---

## What Should Happen:

### When Working Correctly:

1. **Company Page Screen:**
   - White background
   - Your company_page.png image fills the screen
   - Navigation bar at top says "Booth Visit"
   - Back button (< Campus Fair) in top-left

2. **App Icon:**
   - LinkedIn icon appears on iPhone home screen
   - May take a few seconds to update after install
   - Restart iPhone if it's stubbornly cached

---

## Still Not Working?

Run the app, go through the NFC scan, and tell me:

**Console output:**
- Copy everything from the Xcode console (especially lines with 🎯 ✅ ❌)

**What you see on screen:**
- Does the Company Card screen appear at all?
- Is it blank/white?
- Do you see a red error message?
- Does it show the old UI with buttons/labels?

**Assets status:**
- Can you see "company_page" in Assets.xcassets?
- Does it show a thumbnail preview?
- Can you see "AppIcon" in Assets.xcassets?
- Does it show your LinkedIn icon?

With this info I can help debug further! 🔍
