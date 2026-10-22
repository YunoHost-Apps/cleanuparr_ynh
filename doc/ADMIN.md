After installing Cleanuparr, open it from the YunoHost applications menu and complete the initial account setup. Then configure the download clients and *arr instances used by your media stack.

Cleanuparr stores its SQLite databases, internal logs and data-protection keys in the YunoHost application data directory. The YunoHost backup script includes this directory.

Upstream documentation: <https://cleanuparr.github.io/Cleanuparr/docs/>.

If an older installation returns 401 errors even after logging in again, disable YunoHost authentication header injection:

```bash
sudo yunohost tools shell -c "from yunohost.permission import permission_url; permission_url('cleanuparr.main', auth_header=False)"
```

For multiple instances, replace `cleanuparr.main` with the appropriate identifier (for example `cleanuparr__2.main`). Reload the page and log into Cleanuparr again. Package revision `2.10.12~ynh2` applies this setting automatically during upgrade.
