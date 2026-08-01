# Deplyoment guide for ultranews@cPanel

## File upload

1. Upload all files to your cPanel's **public_html** directory (entire project contents, not a subfolder)

2. Verify key files exist:
   - `public/index.php` (bootstrap)
   - `public/themes/ultra/` (theme files)
   - `.env`
   - `composer.json`

## Database setup

Your database is already created in cPanel with these credentials:

```
DB_HOST=localhost
DB_PORT=3306
DB_DATABASE=makkalve_news
DB_USERNAME=makkalve_makkalve
DB_PASSWORD=M@kkalVe!2026#App9
```

## Important: Do NOT import database.sql

This project uses the **web installer** for first-time setup, not the included database.sql.

---

## Why NOT to use database.sql

**Problems with database.sql for cPanel:**

1. MySQL character encoding issues (@wreck - https://github.com/wreck/laravel/issues/643)
2. Import/export processing time (Database.sql generates ~45MB dump)
3. Post-processing required after database import
4. Large file size increases deployment time

The professional solution: Use the **Botble Web Installer** for clean database setup.

---

## Web installer setup

1. Set `.env` values:
   - `APP_ENV=production`
   - `APP_DEBUG=false`
   - `APP_URL=https://makkalvelicham.com/`

2. Download and upload `storage/installing` and `storage/installed` to your cPanel **public_html** folder:

   ```bash
   # Download from: https://github.com/botble/cms/releases
   wget https://github.com/botble/cms/releases/download/v2.0.0/storage_installing.zip
   wget https://github.com/botble/cms/releases/download/v2.0.0/storage_installed.zip
   unzip storage_installing.zip public_html/storage/installing
   unzip storage_installed.zip public_html/storage/installed
   ```

3. Open the installer URL in your browser:
   - Open: <https://makkalvelicham.com/install>
   - Follow the 5-step installer process

4. Configure database with your MySQL credentials

5. Complete installation

6. Return to: <https://makkalvelicham.com/> (access your live site)

## Backend access

After installation, access the admin panel at:

- URL: <https://makkalvelicham.com/admin>
- Default credentials: Admin user (check admin panel setup)

## File permissions

Set these permissions for production:

```bash
# Application folder (public_html)
chmod -R 755 .
chmod -R 644 ./*.php
chmod -R 755 storage
chmod -R 755 public/themes
chmod -R 644 public/themes/**/*.css
chmod -R 644 public/themes/**/*.js
chmod -R 644 public/themes/**/*.png
chmod -R 644 public/themes/**/*.jpg
chmod -R 644 public/themes/**/*.jpeg
chmod -R 644 public/themes/**/*.gif
chmod -R 644 public/themes/**/*.svg
chmod -R 644 public/themes/**/*.webp

# Prevent execution in private folders
chmod -R 000 application
chmod -R 000 database
chmod -R 000 platform
chmod -R 000 tests

# Keep .env configuration safe
chmod 644 .env
chmod 000 .env.example
chmod 000 composer.json
chmod 000 composer.lock
chmod 000 phpunit.xml
```

## Hotfix: Missing storage files

If `storage/installing` or `storage/installed` are missing:

```bash
# Create empty marker files
mkdir -p storage

touch storage/installing
touch storage/installed

# Set no-execute permissions
touch storage/installing && chmod 000 storage/installing
touch storage/installed && chmod 000 storage/installed
```

## Environment variables (in .env)

```bash
APP_NAME="MakkalVelicham"
APP_DEBUG=false
APP_ENV=production
APP_URL=https://makkalvelicham.com/

DB_CONNECTION=mysql
DB_HOST=localhost
DB_PORT=3306
DB_DATABASE=makkalve_news
DB_USERNAME=makkalve_makkalve
DB_PASSWORD="M@kkalVe!2026#App9"
```

## Support

For deployment issues, create a ticket at:
https://codecanyon.net/item/ultranews-laravel-newspaper-and-magazine-multilingual-cms/34228954/support

---

For installation problems, check the Botble documentation at:
https://docs.botble.com/en/getting-started/installation/

Documentation: https://docs.botble.com/
