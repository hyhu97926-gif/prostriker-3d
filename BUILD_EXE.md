# Make the Windows EXE (Windows 10/11)
1. Install Node.js LTS from https://nodejs.org (once).
2. Put all files of this folder together (index.html, main.js, package.json, icon.png, build.bat ...).
3. Double-click **build.bat** (needs internet: downloads three.min.js + Electron). Takes a few minutes.
4. Your game: **dist\ProStriker3D.exe** (single portable file, works offline, intro included, F11 = fullscreen).
Quick test without building: double-click **test-run.bat**.
Optional logos: create a folder `logos` and add PNGs named by team code (POR.png, ARG.png ...) before building.
If build fails with a symlink/permission error: run build.bat as Administrator or enable Windows Developer Mode.
NOTE: this EXE was NOT built or tested by Claude (chat has no Windows tools).

## No installs needed: build the EXE in the cloud (free GitHub account)
1. Create a new GitHub repository and upload ALL files of this folder, including the hidden `.github` folder.
2. Open the repository's **Actions** tab -> "Build Windows EXE" -> **Run workflow**.
3. When it turns green (a few minutes), open the run and download **ProStriker3D-exe** -> it contains ProStriker3D.exe.
(Not tested by Claude.)

## Quick app-like window with no EXE (Chrome/Edge)
Open the game link -> browser menu -> Save and share / Cast -> **Create shortcut** -> tick **Open as window**. Press F11 for fullscreen.
