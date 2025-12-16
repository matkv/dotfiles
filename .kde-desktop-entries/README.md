# Custom Desktop Entries Backup

This folder contains custom PWA-like desktop entries for KDE/Linux.

## Contents

- `applications/` - Desktop entry files (.desktop)
- `icons/` - SVG icons for the applications

## Applications Included

1. **ChatGPT** - Firefox profile-based desktop entry
2. **TeuxDeux** - Firefox profile-based desktop entry

## Restore Instructions

### Desktop Entries & Icons
```bash
cp applications/*.desktop ~/.local/share/applications/
cp icons/*.svg ~/.local/share/icons/
update-desktop-database ~/.local/share/applications/
```

### Firefox Profiles (Manual Setup)

The desktop entries reference Firefox profiles that need to be created manually:

1. Create profiles:
   ```bash
   firefox -CreateProfile "chatgpt"
   firefox -CreateProfile "teuxdeux"
   ```

2. Update the .desktop files with the actual profile directory names if needed
   (check ~/.mozilla/firefox/profiles.ini for the full profile paths)

3. Launch each app and log in to save your session in the dedicated profile

**Note:** Firefox profiles are NOT included in this backup as they contain session cookies and login data.
