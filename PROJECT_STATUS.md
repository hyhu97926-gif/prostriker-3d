# Pro Striker 3D - PROJECT STATUS (v0.1)
Engine: Three.js r128 (WebGL) + Electron for the Windows EXE.

## Completed
- 5-a-side 3D match: striped pitch + markings, goals/nets/crossbar, 2400-spectator crowd in stands, sun + shadows
- Humanoid players with run/kick/tackle/celebration animation, textured rolling ball with gravity, bounce, friction
- Dribble, pass (auto-targets teammate), charged shot (steerable), tackle, goalkeeper AI saves/distribution, outfield AI
- Auto player-switching (yellow ring), broadcast camera (V = zoom), goals, kickoff reset, out-of-play reset
- Scoreboard, match clock (scaled to 90'), menu, team select (6 fictional teams), match length, graphics Low/Med/High
- Keyboard + gamepad, WebAudio sounds + crowd noise
- Electron wrapper files (package.json, main.js)

## Remaining
Tournament, League, Career, Training, Penalty shootout, substitutions/formation picker, fouls/offsides/throw-ins/corners,
player stats per player, kits/logos loading from JSON, ball spin/curve, better player models (glTF), replays, pause menu, save/load.

## Structure
- index.html - whole game (sections: DATA teams/formations, AUDIO, SCENE, PLAYERS, ACTIONS, INPUT, AI, SIMULATION)
- main.js - Electron window
- package.json - scripts + builder config
- three.min.js - YOU add this for offline use (see below)

## Run
Double-click index.html (needs internet for Three.js CDN) - or after setup below: `npm start`.

## Build EXE (not yet done/tested by Claude - no Windows tools in chat)
1. Install Node.js LTS from nodejs.org
2. Download https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js and save as three.min.js in this folder
3. In this folder open Command Prompt: `npm install` then `npm run build`
4. EXE appears in `dist/` (portable, ProStriker3D x.x.x.exe)

## Add teams
Edit the TEAMS array at top of the script in index.html: {n:'Name',a:'ABC',c:shirtHex,s:shortsHex,r:rating}.

## NEXT TASK
Penalty Shootout mode + pause menu, then a mode-select screen (Quick Match / Penalties / Training).

## v0.2 update (syntax-checked only, NOT run/tested by Claude)
Added: 21 teams (15 real-name UNOFFICIAL placeholders marked *, 6 fictional) with 5-player squads, ratings, shirt numbers;
auto away-kit on colour clash; number badge above every player (N toggles) + team-colour disc under feet + socks/boots/hair/skin variety;
yellow ring + arrow on controlled player; minimap (home white outline, away black); controlled-player name/number/role + stamina bar;
rebindable keys (Settings, saved in localStorage); through ball (L), lob/cross (I), switch (Q), stamina sprint; pause menu with stats;
half-time; difficulty, tactics, day/night, Ultra graphics; ad boards, floodlight poles; ratings affect shot accuracy/speed.
NOT done (honestly): substitutions, formation picker, replays/close-ups, weather, stadium choice, team logos/real kits, skill moves,
Tournament/League/Career/Training/Penalties, glTF player models, real EXE build.
NEXT: playtest bugs -> penalties + substitutions.

## v0.3 update (syntax-checked only, NOT run by Claude)
Match length 2/3/5/8/10/15/20 min (real time for full 90'); half-time pause screen with stats + START 2ND HALF button (sides do NOT swap yet);
graphics: filmic tone mapping, soft shadows, grass speckle texture + anisotropy, shirt back numbers, corner flags, night floodlight glow,
crowd jumps and camera zooms in on goals.
NEXT: side swap at half-time, penalties, substitutions.

## v0.4 update (syntax-checked only, NOT run by Claude)
Added: referee (yellow kit, follows play, shows yellow/red cards); fouls from tackles -> free kicks, penalties (inside box), yellow/red cards
(red = player removed, GK only ever yellow); offside (flagged on passes); throw-ins, corners, goal kicks with set-piece state
(human takes your team's set pieces: aim with keys, Space/L/I/hold J; AI takes theirs after ~1.4s);
goalkeeper control (G toggles; move in box, K = dive, Space/I/J distribute); teammates no longer chase - they spread into passing positions.
NOT done: free-kick wall, advantage, handball, substitutions, penalty SHOOTOUT mode, side swap at half-time, real EXE.
NEXT: playtest + fix bugs, then penalty shootout mode.

## v0.5 update (syntax-checked only, NOT run by Claude)
Third-person chase camera (default, camera-relative controls; V toggles broadcast view); human faces (eyes, brows, nose, mouth, ears, neck,
hands, hair styles, skin tones), skin-visible legs, striped/hooped shirt textures, panelled ball texture, seat-pattern stands;
drawn country flags (menu, scoreboard, banners behind goals - emoji flags don't render on Windows); on-screen keeper button + auto keeper
control on shots; substitutions (3/team, generic bench), formation picker (3 formations), penalty shootout mode, free-kick wall,
goal replays, rain/fog weather, 3 stadium colour themes.
NOT done: advantage rule, handball, side swap at half-time, different stadium architectures, real team kits/logos, real EXE build.

## v0.6 update (syntax-checked only, NOT run by Claude)
Advantage rule (play on 3s after a foul if fouled team keeps ball in attacking half, else free kick back);
handball (loose ball hitting a non-keeper's arm height -> free kick / penalty); teams swap sides at half-time (dr() direction helper,
S.sw flag; keeper control, camera, banners follow); kit patterns (stripes/hoops/halves/sash via KT table) + shirt-chest crest;
crest/logo system: procedural placeholder crests, OR drop PNGs named logos/<ABBR>.png (e.g. logos/POR.png) beside index.html and they are used.
Official club/federation logos and licensed kits are NOT bundled (copyright, no internet in the build environment).
Renamed fictional 'Nordic Stars' abbreviation NOR -> NRS (clashed with Norway).
NOT done: real EXE build (do on your PC, see build steps), licensed kits/logos.

Pakistan now uses real player names (Saqib Hanif, Abdullah Iqbal, Easah Suliman, Alamgir Ghazi, Adeel Younas) taken from PFF squads in news reports; ratings are my estimates. Edit the TEAMS entry (a:'PAK') to match the current squad.

## v0.7 update (syntax-checked only, NOT run by Claude)
Player-switch clarity: yellow toast "▶ #num Name · role" + pulsing ring whenever control changes; auto-switch has more hysteresis;
T toggles auto-switch OFF (then only Q switches); substitution toast. Pakistan full squad: 5 starters + 10-player bench (real PFF names,
estimated ratings); bench shown on team-select and used by the Substitute button (matching role first). Add 'b:' bench to any team in TEAMS
as 'Name:rating:number:ROLE,...'.

## v0.8 update (syntax-checked only, NOT run by Claude)
CONTROLS REMADE (saved under localStorage 'kb2', rebindable): WASD move (camera-relative), Shift sprint, Space short pass, F shoot (hold),
E through ball, R lob/cross, X tackle, C skill move/feint, Q switch player, G keeper, T auto-switch, V camera, N numbers, Esc/P pause.
MOUSE: cursor locked on kick-off (click canvas to re-lock); move = free-look camera, LMB hold = shoot, RMB = pass, wheel = camera distance.
Esc releases the lock and pauses. Gamepad: stick-click = skill move.
GAMEPLAY: shots now curl (spin from your sideways run), shoot along facing if goal is behind you, aim follows camera when no stick input;
skill move dodges tackles; ball leads further when sprinting (close control when slow); AI uses feints.
GRAPHICS: default High; sky dome + matching fog, bump-mapped grass at 2x texture resolution, fill light + shadow bias, taller stands and up to
5000 spectators (Ultra), smoother player/ball geometry.

## v0.8.1: third-person view is now LOCKED behind the controlled player (no broadcast toggle, no mouse-look). V cycles camera distance (close/normal/far); mouse wheel also adjusts.

## v0.9: goal REPLAY removed. Intro splash added (MysteryCraft logo, embedded in index.html as base64; copy also saved as intro.png). Auto-dismiss after ~4s or any key/click.

## v0.9.1: Unity-style 'MADE WITH' intro (dark screen, logo fade in/out ~3.6s, any key skips). Goalkeeper control REMOVED - keepers are always AI (G key/button gone). Day/Night rebuilt: applyTime() sets sky dome, fog, sun/hemi/fill, floodlights and applies immediately when you change Time in the menu.

## v1.0: PLAYER STATS (goals, shots, passes, tackles won, fouls, saves, cards, rating) - table in pause menu and at full time; attribute line
(PAC/SHO/PAS/DEF + goals/shots) for the controlled player in the HUD. SMARTER KEEPERS: stand on the ball-goal line and step out, predict
shots with reaction time that depends on rating, dive (animated), catch or parry, sweep loose balls, distribute with pass/lob.
Intro: 'MADE WITH' + logo + loading bar (Unity style); logo also shown on the main menu.

## v1.1: 11-a-side (4-4-2 / 4-3-3 / 5-3-2). Every team has 18 players: 11 starters + 7 subs (real names for 15 teams marked *, unofficial/approximate;
fictional teams use generic names). Up to 5 substitutions per match (pause menu, brings on a sub of the same position first).
Intro now runs from its own script (cannot get stuck if the game fails), auto-ends in ~4.8s, shows a red error bar if Three.js can't load.
TESTED (headless Chromium, Three.js stubbed - logic only, no real rendering): intro show/removal, full match incl. half-time side swap and
full time, shootout, forced set pieces/fouls/red card/handball/substitution - no script errors. NOT tested: actual 3D rendering/performance.
Perf tip: 22 players is heavy - use Medium/Low graphics if it lags.

## v1.2 EXE packaging (NOT built/tested by Claude - no Windows/Electron here)
index.html now loads three.min.js locally first (CDN fallback). Added build.bat (one click: downloads three.min.js, npm install, builds),
test-run.bat, icon.png (from the intro logo), BUILD_EXE.md. Output: dist\ProStriker3D.exe (portable). Intro is part of index.html so it plays in the EXE.
