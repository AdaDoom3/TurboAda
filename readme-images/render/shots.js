// Takes the README pictures from the real editor: code-server serving the
// TurboAda extension at 127.0.0.1:8765, the README rover open as a project
// (mars.gpr, src/*.ad?) that has been built once so obj/mission exists, and
// lldb-dap on the editor's PATH for the debugging frames.
//   node shots.js <workspace> <output directory> <empty folder> [scene ...]
// Scenes: rover diagnostics scenario build debug project (all when none is
// named).  Dark theme, notifications cleared; the frames of a GIF are written
// as <name>-NN.png and joined by gif.py next to this script.
const { chromium } = require('playwright');
const fs = require('fs');
const path = require('path');
const [workspace, output, fresh, ...chosen] = process.argv.slice(2);
const scenes = new Set(chosen.length ? chosen : ['rover', 'diagnostics', 'scenario', 'build', 'debug', 'project']);
const mission = path.join(workspace, 'src', 'mission.adb');
const pristine = fs.readFileSync(mission, 'utf8');

(async () => {
  const browser = await chromium.launch({ executablePath: '/opt/pw-browsers/chromium-1194/chrome-linux/chrome' });
  let page;
  const wait = ms => page.waitForTimeout(ms);
  const cmd = async (c) => { await page.keyboard.press('F1'); await wait(400); await page.keyboard.type(c); await wait(900); await page.keyboard.press('Enter'); await wait(700); };
  const open = async (f) => { await page.keyboard.press('Control+P'); await wait(400); await page.keyboard.type(f); await wait(900); await page.keyboard.press('Enter'); await wait(1500); };
  const goto = async (where) => { await page.keyboard.press('Control+G'); await wait(300); await page.keyboard.type(where); await wait(300); await page.keyboard.press('Enter'); await wait(500); };
  const quiet = async () => { await cmd('Notifications: Clear All Notifications'); await page.keyboard.press('Escape'); await wait(400); };
  const shot = async (name) => { await page.screenshot({ path: path.join(output, name + '.png') }); console.log('wrote', name + '.png'); };
  const sidebarText = async () => page.locator('.sidebar').innerText().catch(() => '');
  const until = async (test, timeout) => { const end = Date.now() + timeout; while (Date.now() < end) { if (await test()) return true; await wait(500); } return false; };
  const enter = async (folder, width, height, scale) => {
    page = await browser.newPage({ deviceScaleFactor: scale, viewport: { width, height } });
    page.on('dialog', d => d.dismiss());
    await page.goto('http://127.0.0.1:8765/?folder=' + folder);
    await page.waitForSelector('.monaco-workbench', { timeout: 60000 }); await wait(6000);
    await cmd('Terminal: Kill All Terminals'); await cmd('View: Close All Editors');
    await cmd('View: Close Primary Side Bar'); await cmd('View: Close Secondary Side Bar');
    await cmd('View: Close Panel'); await quiet();
  };
  const sidebar = async () => {
    const turbo = page.locator('.activitybar .action-item:has([aria-label^="TurboAda"]), .activitybar .action-item[aria-label^="TurboAda"]').first();
    await turbo.click(); await wait(2500);
  };
  let frame = 0;
  const frames = async (name) => { const file = `${name}-${String(frame++).padStart(2, '0')}.png`; await page.screenshot({ path: path.join(output, file) }); console.log('frame', file); };

  // The program the README leads with: the specification, the mission, its run.
  if (scenes.has('rover')) {
    await enter(workspace, 1600, 2250, 1.2);
    await open('mars-rover.ads'); await goto('1');
    await cmd('View: Split Editor Right'); await open('mission.adb'); await goto('16');
    await cmd('Terminal: Create New Terminal'); await wait(2000);
    await cmd('Terminal: Move Terminal into Editor Area'); await wait(1500);
    await cmd('View: Move Editor into Below Group'); await wait(1500);
    await cmd('View: Close Panel');
    await page.keyboard.type('cd src && ta mission.adb -o mission && ./mission\n'); await wait(6000);
    await page.keyboard.press('Control+1'); await goto('54');
    await quiet(); await shot('shot-mars-rover');
    await page.close();
    for (const f of ['mission', 'mission.native.ll', 'mission.native.ali'])
      fs.rmSync(path.join(workspace, 'src', f), { force: true });
  }

  // A misspelling diagnosed, and its quick fix.
  if (scenes.has('diagnostics')) {
    await enter(workspace, 1280, 800, 1.5);
    await cmd('View: Show Explorer'); await wait(1000);
    fs.writeFileSync(mission, pristine.replace('Radio.Send ("FAULT', 'Radio.Sned ("FAULT'));
    await open('mission.adb'); await goto('24:11');
    await page.waitForSelector('.monaco-editor .squiggly-error', { timeout: 60000 }).catch(() => console.log('no squiggle'));
    await cmd('View: Focus Problems'); await wait(1500);
    await quiet(); await shot('shot-diagnostics');
    await cmd('View: Close Panel'); await goto('24:11'); await page.keyboard.press('Control+.');
    await page.waitForSelector('.action-widget', { timeout: 15000 }).catch(() => console.log('no quick fix'));
    await wait(800); await shot('shot-quickfix');
    await page.keyboard.press('Escape'); fs.writeFileSync(mission, pristine); await wait(2500);
    await page.close();
  }

  const status_shows = async (pattern, timeout) => {
    const end = Date.now() + timeout;
    while (Date.now() < end) { if (pattern.test(await page.locator('.statusbar').innerText())) return true; await wait(60); }
    return false;
  };

  // The scenario variable's values, opened from the status bar beside the project view.
  if (scenes.has('scenario')) {
    await enter(workspace, 1280, 800, 1.5);
    await open('mission.adb'); await goto('25');
    await sidebar();
    await page.locator('.statusbar-item:has-text("MODE")').first().click(); await wait(2500);
    await shot('shot-scenario');
    await page.keyboard.press('Escape'); await wait(500);
    await page.close();
  }

  // Run from the editor's button, then a build caught mid-way: the view's progress bar and the status bar.
  if (scenes.has('build')) {
    await enter(workspace, 1280, 800, 1.5);
    await open('mission.adb'); await goto('25');
    await sidebar();
    await page.locator('.editor-actions .action-label.codicon-run').first().click();
    await until(async () => /BLACK BOX/.test((await page.locator('.xterm-rows').allInnerTexts().catch(() => [])).join('\n')), 60000);
    await wait(1000);
    for (const f of fs.readdirSync(path.join(workspace, 'obj'))) fs.rmSync(path.join(workspace, 'obj', f), { force: true });
    await quiet();
    await page.locator('.sidebar .composite.title').first().hover(); await wait(400);
    await page.locator('.sidebar .composite.title .action-label[aria-label="Build"]').first().click({ force: true });
    await status_shows(/Compiling [2-9]/, 60000);
    await shot('shot-build');
    await status_shows(/Built|Up to date|failed/, 60000);
    await page.close();
  }

  // Debugging: a breakpoint, the stop, the variables, a step, the tasks.
  if (scenes.has('debug')) {
    frame = 0;
    await enter(workspace, 1280, 800, 1);
    await open('mission.adb'); await goto('16'); await page.keyboard.press('F9'); await wait(800);
    await cmd('View: Show Run and Debug'); await wait(1500); await quiet();
    await frames('debug-vscode');
    await page.locator('.codelens-decoration a:has-text("Debug")').first().click();
    const stopped = await until(async () => (await page.locator('.debug-top-stack-frame-line').count()) > 0, 120000);
    console.log(stopped ? 'stopped at the breakpoint' : 'never stopped');
    await wait(2500); await quiet(); await frames('debug-vscode');
    await page.keyboard.press('F10'); await wait(2500); await frames('debug-vscode');
    await page.keyboard.press('F10'); await wait(2500); await frames('debug-vscode');
    await page.locator('.sidebar .pane-header:has-text("TASKS")').first().click(); await wait(2500); await frames('debug-vscode');
    await page.keyboard.press('Shift+F5'); await wait(2000);
    await page.close();
  }

  // New Project, from an empty folder.
  if (scenes.has('project') && fresh) {
    frame = 0;
    await enter(fresh, 1280, 800, 1);
    await cmd('View: Show Explorer'); await wait(1000);
    await frames('new-project');
    await page.keyboard.press('F1'); await wait(400); await page.keyboard.type('TurboAda: New Project'); await wait(900);
    await frames('new-project');
    await page.keyboard.press('Enter'); await wait(1500); await frames('new-project');
    await page.keyboard.press('Enter'); await wait(1500);
    await page.keyboard.type('Rover'); await wait(800); await frames('new-project');
    await page.keyboard.press('Enter'); await wait(8000); await quiet();
    await cmd('View: Close Panel'); await wait(500); await frames('new-project');
    await page.close();
  }
  await browser.close();
})().catch(e => { console.error('FATAL', e.message); process.exit(1); });
