# LinkedIn Campus Fair - Booth Check-In Demo Setup Instructions

## Overview
This modified version of Apple's NFCTagReader sample creates a two-screen booth check-in flow for a LinkedIn Campus Fair demo video. The app simulates NFC tag scanning with a 3-second timer and displays a company card for "Anthropic".

## Code Changes Complete ✅

The following Swift files have been modified:

1. **MessagesTableViewController.swift** - Transformed from a table view controller to a "Ready to Check In" screen with:
   - Clean UI with building icon, title, subtitle
   - "Check In at Booth" button
   - Real NFC session with simulated 3-second success timer
   - Proper error handling that doesn't show alerts on user cancellation

2. **CompanyCardViewController.swift** - New file that displays:
   - Company logo (blue building icon placeholder)
   - Company name: "Anthropic"
   - Industry tag: "AI Safety & Research"
   - Green "Saved to your visits ✓" badge
   - Info blurb about the company
   - Two action buttons: "★ Star" and "📝 Add Note"

3. **AppDelegate.swift** - Simplified to remove NDEF message handling from NSUserActivity

4. **MessagesTableViewController+DataSource.swift** - Cleared out (no longer needed)

## Manual Steps Required

### 1. Info.plist Configuration
Make sure your `Info.plist` contains:

```xml
<key>NFCReaderUsageDescription</key>
<string>This app needs access to NFC to check you in at recruiter booths during the campus fair.</string>
```

### 2. Entitlements
Ensure your `.entitlements` file includes:

```xml
<key>com.apple.developer.nfc.readersession.formats</key>
<array>
    <string>NDEF</string>
</array>
```

This should already be configured if you enabled "Near Field Communication Tag Reading" in the Capabilities tab of your target.

### 3. Storyboard / Scene Setup

You have two options:

#### Option A: Update Existing Storyboard (Recommended if storyboard exists)
1. Open `Main.storyboard` in Interface Builder
2. Find the `MessagesTableViewController` scene
3. Delete the table view
4. Set the view controller's class to `MessagesTableViewController`
5. Change its base class from `UITableViewController` to `UIViewController`
6. Remove any connected outlets/actions related to the table view
7. Delete any segues to `PayloadsTableViewController`

The UI is built entirely programmatically in code, so the storyboard just needs an empty view controller.

#### Option B: Use Programmatic Setup (If you want to remove storyboard dependency)
1. Delete `Main.storyboard` from the project
2. Remove the "Main storyboard file base name" entry from Info.plist
3. Update `AppDelegate.swift` to manually create the window:

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    let checkInVC = MessagesTableViewController()
    let navController = UINavigationController(rootViewController: checkInVC)
    window?.rootViewController = navController
    window?.makeKeyAndVisible()
    return true
}
```

## How It Works

### Flow:
1. App launches to "Ready to Check In" screen
2. User taps "Check In at Booth" button
3. Real iOS NFC scanning modal appears (via Core NFC)
4. After 3 seconds, the alert message updates to "Booth check-in successful! ✓"
5. Session invalidates (dismissing the NFC sheet)
6. App automatically navigates to Company Card screen showing Anthropic info

### Key Technical Details:

**Timer-Based Success:**
```swift
DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
    self?.didSimulateCheckIn = true
    session.alertMessage = "Booth check-in successful! ✓"
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        session.invalidate()
    }
}
```

**Graceful Invalidation Handling:**
The `didSimulateCheckIn` flag tracks whether the session was invalidated by our timer or by the user/system, preventing unwanted error alerts.

**LinkedIn Blue Branding:**
The app uses LinkedIn's brand color `#0A66C2` throughout for a professional appearance.

## Testing

**Requirements:**
- Must run on a real iPhone (NFC doesn't work in simulator)
- iPhone 7 or later with iOS 11+
- Near Field Communication capability enabled

**Test Steps:**
1. Launch app on device
2. Tap "Check In at Booth"
3. Hold phone steady (you don't need an actual NFC tag)
4. After 3 seconds, you'll see the success message
5. NFC sheet dismisses automatically
6. Company card appears with Anthropic branding

**Expected Behavior:**
- No errors or alerts (unless you tap Cancel)
- Smooth transition from NFC sheet to Company Card
- Professional, polished UI throughout

## Removed Features

The following original sample features have been removed:
- ❌ Reading real NFC tags
- ❌ Writing to NFC tags
- ❌ Message list / table view
- ❌ Payload details view
- ❌ Background tag reading support

## Demo Video Tips

For the best demo video:
1. **Good lighting** - Make sure the screen is clearly visible
2. **Steady hands** - Hold the phone steady during NFC scanning
3. **Wait for full animation** - Let the success message show before the transition
4. **Portrait orientation** - App is designed for portrait
5. **Consider screen recording** - Use iOS's built-in screen recording instead of filming the screen

## Color Scheme

- **Primary:** LinkedIn Blue (#0A66C2)
- **Success:** System Green
- **Backgrounds:** System grouped background (light gray)
- **Cards:** System background (white) with subtle shadows

## Future Enhancements (Optional)

If you want to expand the demo:
- Add more companies with different info
- Add animations to the card appearance
- Include a "My Visits" list screen
- Add more realistic company logos
- Include a search/filter feature

---

**Status:** ✅ Code changes complete. Manual storyboard/Info.plist steps required.
**Last Updated:** February 21, 2026
