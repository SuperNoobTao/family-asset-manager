# Repository Guidelines

## Project Structure & Module Organization
This repository is a flat, static PWA project (no `src/` build pipeline).

- `index.html`: main app entry, including UI markup, styles, and most JavaScript logic.
- `sw.js`: service worker for offline caching.
- `manifest.json`: PWA metadata and install configuration.
- `icon-192.png`, `icon-512.png`: PWA icons.
- `supabase-schema.sql`: database schema used to initialize Supabase.
- `.github/workflows/deploy.yml`: GitHub Pages deployment workflow.

Keep related UI, styling, and behavior changes grouped in the same area of `index.html` for readability.

## Build, Test, and Development Commands
- `python3 -m http.server 8080` — run the app locally.
- Visit `http://localhost:8080` — verify behavior in browser.
- `git push origin main` — triggers GitHub Pages deployment via Actions.

There is no compile/build step; deployment publishes static files directly.

## Coding Style & Naming Conventions
- Use 4-space indentation across HTML/CSS/JS blocks.
- Follow existing naming: `camelCase` for functions/variables (for example, `loadAssets`, `renderSummary`), `UPPER_SNAKE_CASE` for constants (for example, `SUPABASE_URL`).
- Preserve current file-level style conventions (e.g., quote style and semicolon usage) instead of reformatting unrelated code.
- Prefer small, focused functions over large monolithic handlers.

## Testing Guidelines
No automated test framework is configured yet; use manual smoke testing before opening a PR:

1. Authentication flow (sign up / sign in / sign out).
2. Asset CRUD operations and summary/stat updates.
3. CSV import/export behavior.
4. Offline behavior after service worker install.

If you add automated tests, document how to run them in `README.md`.

## Commit & Pull Request Guidelines
- Prefer Conventional Commit style where possible (`feat:`, `fix:`, `chore:`), consistent with existing history.
- Keep commits single-purpose and descriptive.
- PRs should include: change summary, affected files, manual test notes, and screenshots for UI updates.
- Link related issues/tasks, and explicitly call out any Supabase schema or data-impacting changes.

## Security & Configuration Tips
- Never commit privileged Supabase keys (service role); use anon/public keys only.
- When changing schema, update `supabase-schema.sql` and describe migration steps in the PR.
- For cache-related updates, verify `sw.js` cache versioning behavior to avoid stale client assets.
