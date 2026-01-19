# Family Asset Manager

A PWA for managing family assets with Supabase cloud sync.

## Features

- Asset management (add/edit/delete)
- Multi-device sync via Supabase
- Statistics by person/bank/type
- CSV import/export
- PWA (installable, offline support)

## Deployment to GitHub Pages

### Method 1: Automatic (GitHub Actions)

1. Push this folder to a GitHub repository
2. Go to Repository Settings → Pages
3. Select "GitHub Actions" as source
4. The site will auto-deploy

### Method 2: Manual

1. Push to GitHub
2. Enable Pages in Settings → Pages
3. Select "main" branch as source

## Supabase Setup

Run `supabase-schema.sql` in Supabase SQL Editor, then update `SUPABASE_URL` and `SUPABASE_ANON_KEY` in `index.html`.

## Local Development

```bash
python3 -m http.server 8080
```

Then visit http://localhost:8080
