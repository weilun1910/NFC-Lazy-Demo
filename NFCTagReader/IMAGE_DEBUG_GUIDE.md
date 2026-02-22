# QUICK FIX: Image Not Showing

## What I Just Added:

I've added **extensive debugging** to help figure out why the image isn't showing:

### Visual Debug Indicators:
- **Yellow background** on the CompanyCardViewController view (so you know it loaded)
- **Blue background** on the image view (so you can see where it is)
- These colors will help us see if the view is loading but the image isn't

### Console Debug Messages:
Look for these in the Xcode console after the NFC scan:

```
🎬 CompanyCardViewController viewDidLoad() called
👀 CompanyCardViewController viewWillAppear()
✅ CompanyCardViewController viewDidAppear() - ON SCREEN NOW
🔍 CompanyCardViewController setupUI() called
✅ Successfully loaded 'company_page' from Assets
   Image size: (width, height)
🔍 ImageView added to view hierarchy
🔍 Constraints activated
```

---

## What You Should See Now:

After running the app and completing the NFC scan:

### Scenario 1: Yellow screen (no image)
**This means:**
- ✅ CompanyCardViewController is loading
- ❌ Image is not loading or not visible

**Check console for:**
- `❌ ERROR: Could not load company_page image`
- This means the image isn't in Assets.xcassets

### Scenario 2: Blue rectangle
**This means:**
- ✅ CompanyCardViewController is loading
- ✅ ImageView is there
- ❌ Image failed to load into the ImageView

**Check console for:**
- Image loading errors

### Scenario 3: Red error message on screen
**This means:**
- ✅ CompanyCardViewController is loading
- ❌ Image definitely not in Assets

**Fix:**
- Open Assets.xcassets
- Make sure "company_page" exists and has an image in it

### Scenario 4: Your image appears!
**This means:**
- ✅ Everything works!
- Remove the debug colors (I'll show you how below)

---

## Checklist: Why Image Might Not Load

### ✅ Is the image in Assets.xcassets?

1. Open **Assets.xcassets** in Xcode
2. Look for **"company_page"** in the left list
3. Click on it
4. Do you see your image thumbnail?

**If NO:**
- Right-click in Assets → New Image Set
- Name it exactly: `company_page` (no .png)
- Drag your image file into the box

### ✅ Is the asset named correctly?

- Must be exactly `company_page` (lowercase, underscore, no extension)
- NOT: `company_page.png`, `CompanyPage`, `company-page`, `Company Page`

### ✅ Is the image file valid?

- PNG or JPG format
- Not corrupted
- Try opening it in Preview/Finder to verify

### ✅ Did you clean build?

```
Product → Clean Build Folder (⌘⇧K)
Product → Build
Run again
```

### ✅ Is the target membership correct?

1. Click on the asset "company_page" in Assets.xcassets
2. Open the File Inspector (⌘⌥1)
3. Check that your app target is checked under "Target Membership"

---

## For Mac Testing (Live Previews):

If you're using **Mac Catalyst** or **iPhone Simulator on Mac**:

### Important: NFC Won't Work in Simulator!
- Core NFC only works on **physical iPhones**
- If you're testing in the simulator, the NFC scan will fail/error

### To Test Without NFC:
You can temporarily add a button to trigger the company card directly.

**Option 1: Add a test button to CampusFairCheckInViewController**

Add this to `viewDidLoad()` in `MessagesTableViewController 2.swift`:

```swift
// TEMPORARY: Test button for simulator
let testButton = UIButton(type: .system)
testButton.setTitle("TEST: Show Company Card", for: .normal)
testButton.translatesAutoresizingMaskIntoConstraints = false
testButton.addTarget(self, action: #selector(testShowCard), for: .touchUpInside)
view.addSubview(testButton)
NSLayoutConstraint.activate([
    testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    testButton.topAnchor.constraint(equalTo: checkInButton.bottomAnchor, constant: 20)
])
```

And add this method:

```swift
@objc func testShowCard() {
    showCompanyCard()
}
```

This gives you a button that directly shows the company card without NFC.

---

## Expected Console Output (When Working):

```
🎯 showCompanyCard() called - Creating CompanyCardViewController
✅ Navigation controller exists, pushing CompanyCardViewController
🎬 CompanyCardViewController viewDidLoad() called
🔍 CompanyCardViewController setupUI() called
🔍 View bounds: (0.0, 0.0, 390.0, 844.0)
✅ Successfully loaded 'company_page' from Assets
   Image size: (1242.0, 2688.0)
🔍 ImageView added to view hierarchy
🔍 Constraints activated
👀 CompanyCardViewController viewWillAppear()
✅ CompanyCardViewController viewDidAppear() - ON SCREEN NOW
   View frame: (0.0, 0.0, 390.0, 844.0)
   ImageView frame: (0.0, 0.0, 390.0, 844.0)
```

---

## Once It Works - Remove Debug Colors:

When the image is loading correctly, change these lines back:

**In CompanyCardViewController.swift:**

Change:
```swift
view.backgroundColor = .systemYellow  // Bright yellow so we know the view loaded
```

Back to:
```swift
view.backgroundColor = .white
```

And change:
```swift
companyImageView.backgroundColor = .systemBlue  // Blue background to see if imageView exists
```

Back to:
```swift
// No background color needed
```

Or just remove that line entirely.

---

## Next Steps:

1. **Clean Build** (⌘⇧K)
2. **Run the app**
3. **Trigger the NFC scan** (or use test button if in simulator)
4. **Look at the screen** - Yellow? Blue? Red error? Your image?
5. **Check the console** - Copy the output
6. **Tell me what you see!**

With the debug colors and console output, we'll figure out exactly what's happening! 🔍
