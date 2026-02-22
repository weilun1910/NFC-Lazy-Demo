# Setup Guide: App Name & Icon

This guide covers the manual steps needed in Xcode to complete your setup.

## ✅ Task 1: Change App Display Name to "Fair Companion"

The app display name is what appears under the icon on the iPhone home screen.

### Option A: Edit Info.plist directly

1. In Xcode Project Navigator, find **Info.plist**
2. Right-click on Info.plist → **Open As** → **Source Code**
3. Find the `<key>CFBundleDisplayName</key>` line
   - If it exists, change the `<string>` value below it to `Fair Companion`
   - If it doesn't exist, add these lines inside the main `<dict>` tag:

```xml
<key>CFBundleDisplayName</key>
<string>Fair Companion</string>
```

4. Save the file (Cmd+S)

### Option B: Edit Info.plist using property list editor

1. In Xcode Project Navigator, click on **Info.plist**
2. Look for a row with key **"Bundle display name"** or **"CFBundleDisplayName"**
   - If it exists: Click the value field and change it to `Fair Companion`
   - If it doesn't exist:
     - Click the **+** button to add a new row
     - Start typing "Bundle display name" and select it from the dropdown
     - Set the value to `Fair Companion`

3. Save the file (Cmd+S)

### Option C: Edit in Target Settings

1. Click on your **project name** at the top of the Project Navigator
2. Under **TARGETS**, select your app target
3. Go to the **General** tab
4. Find **Display Name** field
5. Change it to `Fair Companion`

---

## ✅ Task 2: Set App Icon to "LinkedIn_icon"

### Step 1: Verify the image is in Assets.xcassets

1. In Xcode Project Navigator, click on **Assets.xcassets**
2. Look through the list on the left for **"LinkedIn_icon"** or **"AppIcon"**

### Step 2: Prepare your icon

**Important requirements:**
- Must be **1024×1024 pixels** (for the main App Store slot)
- Must be **PNG format**
- Should **NOT** have transparency/alpha channel
- Should **NOT** have rounded corners (iOS adds them automatically)

If your LinkedIn_icon doesn't meet these requirements, you may need to adjust it in an image editor first.

### Step 3: Add/Update AppIcon in Assets.xcassets

#### If "AppIcon" already exists:

1. Click on **Assets.xcassets**
2. Click on **AppIcon** in the list
3. You'll see many empty squares for different icon sizes
4. Drag your `LinkedIn_icon.png` file into the **"App Store iOS 1024pt"** slot (the large square)
5. Xcode will show the image in that slot

#### If "AppIcon" doesn't exist:

1. Right-click in the Assets.xcassets list
2. Choose **App Icons & Launch Images** → **New iOS App Icon**
3. This creates an "AppIcon" asset
4. Click on **AppIcon**
5. Drag your `LinkedIn_icon.png` into the **1024pt** slot

#### If you have "LinkedIn_icon" as a separate image set:

**Option 1: Copy the image to AppIcon**
- Just drag from LinkedIn_icon into the AppIcon 1024pt slot

**Option 2: Generate multiple sizes (manual)**
- You can also drag the icon into the smaller size slots (60pt, 76pt, etc.)
- Or use an online tool to generate all required sizes from your 1024×1024 image

### Step 4: Verify it's selected in project settings

1. Click your **project name** at the top of the Project Navigator
2. Under **TARGETS**, select your app target
3. Go to **General** tab
4. Under **App Icons and Launch Screen**, verify it says **"AppIcon"**
5. You should see a preview of your icon

---

## ✅ Task 3: Add "company_page" image to Assets.xcassets

This is your Figma export that will be displayed full-screen after the NFC scan.

### Step 1: Check if it's already there

1. In Xcode Project Navigator, click on **Assets.xcassets**
2. Look for **"company_page"** in the list on the left
3. If you see it, click on it to verify your image is there

### Step 2: If it's not there, add it

1. Right-click anywhere in the Assets.xcassets list
2. Choose **"New Image Set"**
3. A new asset appears, usually named "Image"
4. Click on the name "Image" to rename it
5. Type: `company_page` (exactly this, no .png extension)
6. Press Enter

### Step 3: Add your Figma export image

1. Make sure "company_page" is selected in the Assets list
2. You'll see three empty boxes labeled "1x", "2x", "3x" (or just "Any")
3. Drag your `company_page.png` file into the **"Any"** box or the **"1x"** box
4. You should see a thumbnail preview

**Image recommendations:**
- Use at least **@2x resolution** (e.g., if displaying on a 375pt wide screen, use 750px or higher)
- PNG format recommended for best quality
- Can be any aspect ratio (the code uses `.scaleAspectFit` to preserve proportions)

---

## 🧪 Testing Your Changes

### Test 1: App Display Name

1. Clean and rebuild:
   ```
   Product → Clean Build Folder (Cmd+Shift+K)
   Product → Build
   ```

2. **Delete the old app from your iPhone** (important!)
   - Long-press the app icon
   - Tap "Remove App" → "Delete App"

3. Run the app from Xcode

4. Look at your iPhone home screen
   - The app should now show **"Fair Companion"** under the icon
   - If it still shows "NFCTagReader", try restarting your iPhone

### Test 2: App Icon

1. After installing the app (see steps above)
2. Look at your iPhone home screen
3. The app should show your LinkedIn icon
4. If it shows a white grid icon (default), check:
   - Is the icon in the AppIcon 1024pt slot?
   - Did you delete the old app first?
   - Try restarting your iPhone

### Test 3: Company Page Image

1. Run the app
2. Tap **"Check In at Booth"**
3. Wait for the NFC scanning modal (will dismiss automatically after 3 seconds)
4. After it dismisses, you should see:
   - Your full Figma export `company_page` displayed full-screen
   - White background
   - Image fills the width and height

5. Check the **Xcode Console** for:
   ```
   ✅ Successfully loaded company_page image from Assets
   ```

6. If you see an error message on screen:
   - The image isn't in Assets.xcassets, or
   - It's named something other than "company_page"

---

## 📝 Summary Checklist

Before you build and run:

- [ ] Info.plist has `CFBundleDisplayName` set to `Fair Companion`
- [ ] Assets.xcassets has an **AppIcon** asset with LinkedIn_icon in the 1024pt slot
- [ ] Assets.xcassets has a **company_page** image set with your Figma export
- [ ] Target settings show AppIcon is selected
- [ ] You've deleted the old app from your iPhone
- [ ] You've done a clean build (Cmd+Shift+K)

After building:

- [ ] Home screen shows "Fair Companion" under the icon
- [ ] Home screen shows LinkedIn icon
- [ ] NFC scan flow works and shows company_page image full-screen
- [ ] Xcode console shows "✅ Successfully loaded company_page image from Assets"

---

## 🆘 Troubleshooting

### App name didn't change

- Make sure you **deleted the old app** from your iPhone first
- Try restarting your iPhone
- Make sure Info.plist was saved after editing
- Clean build folder and rebuild

### App icon didn't change

- **Most common issue:** Didn't delete the old app first
- Make sure the icon is exactly 1024×1024 pixels
- Make sure it's in the AppIcon asset (not just as a separate image)
- Make sure target settings point to "AppIcon"
- Try restarting your iPhone
- iOS aggressively caches icons, so this can take a moment

### Company page image doesn't show

- Check Xcode console for error messages
- Make sure the asset is named exactly `company_page` (no .png)
- Make sure the image file is actually in the asset (you should see a thumbnail)
- Try removing the asset and adding it again

### Still having issues?

Share with me:
1. What you see on the iPhone screen after NFC scan
2. What the Xcode console says (copy the messages)
3. Screenshot of your Assets.xcassets showing company_page and AppIcon

---

## ✨ Expected Final Result

When everything is working:

1. **iPhone Home Screen:**
   - Icon shows LinkedIn logo
   - Text below icon says "Fair Companion"

2. **App Launch:**
   - Opens to "Ready to Check In" screen
   - Title at top says "Campus Fair"

3. **After NFC Scan:**
   - NFC modal appears
   - After 3 seconds: "Booth check-in successful! ✓"
   - Modal dismisses
   - Full-screen Figma export appears (your company_page image)

Perfect for your LinkedIn demo video! 🎬
