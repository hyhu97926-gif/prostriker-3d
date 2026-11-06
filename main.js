const { app, BrowserWindow } = require('electron');
const path = require('path');
app.commandLine.appendSwitch('autoplay-policy', 'no-user-gesture-required');
app.whenReady().then(() => {
  const w = new BrowserWindow({
    width: 1280, height: 720, autoHideMenuBar: true, backgroundColor: '#0d0d0d',
    icon: path.join(__dirname, 'icon.png'),
    webPreferences: { backgroundThrottling: false }
  });
  w.setMenuBarVisibility(false);
  w.loadFile('index.html');
  w.webContents.on('before-input-event', (e, i) => {
    if (i.key === 'F11' && i.type === 'keyDown') w.setFullScreen(!w.isFullScreen());
  });
});
app.on('window-all-closed', () => app.quit());
