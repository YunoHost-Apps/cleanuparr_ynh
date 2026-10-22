Après l'installation de Cleanuparr, ouvrez l'application depuis le menu des applications YunoHost et terminez la création du compte initial. Configurez ensuite les clients de téléchargement et les instances *arr utilisées par votre médiathèque.

Cleanuparr stocke ses bases SQLite, ses journaux internes et ses clés de protection des données dans le répertoire de données de l'application YunoHost. Le script de sauvegarde YunoHost inclut ce répertoire.

Documentation amont : <https://cleanuparr.github.io/Cleanuparr/docs/>.

Si une ancienne installation renvoie des erreurs 401 malgré une reconnexion, désactivez l'injection de l'en-tête d'authentification YunoHost :

```bash
sudo yunohost tools shell -c "from yunohost.permission import permission_url; permission_url('cleanuparr.main', auth_header=False)"
```

Pour une installation multi-instance, remplacez `cleanuparr.main` par l'identifiant correspondant (par exemple `cleanuparr__2.main`). Rechargez ensuite la page et reconnectez-vous à Cleanuparr. La révision `2.10.10~ynh2` applique ce réglage automatiquement lors de la mise à jour.
