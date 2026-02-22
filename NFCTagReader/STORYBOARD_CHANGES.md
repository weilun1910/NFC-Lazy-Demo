# Storyboard Quick Reference

## If Using Storyboard (Main.storyboard exists)

### MessagesTableViewController Scene Changes:

1. **Select the scene** in the storyboard
2. **Identity Inspector** (3rd tab):
   - Class: `MessagesTableViewController`
   - Module: (your module name)
   - Inherits From: Leave blank (UIViewController is default now)

3. **Remove these items:**
   - Delete any Table View
   - Delete any prototype cells
   - Delete "Scan" bar button item
   - Delete any segues to PayloadsTableViewController
   
4. **Keep:**
   - Navigation Item (title can be blank, set in code)
   - The root View (empty)
   - The Navigation Controller relationship

### PayloadsTableViewController Scene:
- **Delete the entire scene** (not needed anymore)

### Navigation Controller:
- **Keep as-is** - It should still point to MessagesTableViewController as the root view controller

---

## If Going Fully Programmatic (No Storyboard)

### In AppDelegate.swift, replace the current content:

```swift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Create the window
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Create the initial view controller
        let checkInVC = MessagesTableViewController()
        let navigationController = UINavigationController(rootViewController: checkInVC)
        
        // Set as root and show
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}
```

### In Info.plist:
- Remove the key: `UIMainStoryboardFile` (or "Main storyboard file base name")
- Remove the key: `UISceneConfigurations` (if present and you're not using scenes)

---

## Verification Checklist

After making storyboard changes:

✅ Project builds without errors
✅ No warnings about missing storyboard references
✅ App launches to "Ready to Check In" screen
✅ Navigation bar shows "Campus Fair" title
✅ Blue building icon is visible
✅ "Check In at Booth" button is visible at bottom

---

## Common Issues & Solutions

**Issue:** "Could not instantiate view controller"
- **Solution:** Make sure MessagesTableViewController is no longer set to inherit from UITableViewController in the storyboard

**Issue:** "Missing Main.storyboard"
- **Solution:** Either restore the storyboard file or follow the "Fully Programmatic" approach above

**Issue:** Black screen on launch
- **Solution:** Check that the storyboard's initial view controller is set (arrow pointing to Navigation Controller), or use programmatic setup

**Issue:** "Scan" button missing
- **Solution:** This is expected! The button is removed. Use the new "Check In at Booth" button instead

---

## Testing Your Changes

1. Clean Build Folder: **Cmd + Shift + K**
2. Build: **Cmd + B**
3. Run on Device: **Cmd + R** (remember: must be a real iPhone, not simulator)

If it builds and runs, you're ready to film your demo! 🎬
