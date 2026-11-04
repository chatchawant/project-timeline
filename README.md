# Project Timeline

Personal project timeline app: https://chatchawant.github.io/project-timeline/

The app keeps a browser-local copy and supports JSON backup/import. Optional cloud sync uses Supabase email sign-in and a private per-user database row. To set up a fresh Supabase project, run [`supabase-setup.sql`](supabase-setup.sql) in its SQL Editor, add the app URL to Authentication redirect URLs, and use a publishable key. Never put a secret or service-role key in the public app.

Before the first cloud upload, download a backup of your existing project. If your project was created in a local HTML file, import its JSON backup into the hosted app first. Sign in with the same email on each device.
