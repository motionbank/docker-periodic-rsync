docker-periodic-rsync
=====================

***docker-periodic-rsync*** is an simple [*Docker*](http://www.docker.com/) image with *cron*, *ssh* and *rsync* for one-time or periodic remote *rsync* copy jobs.

Open source project:

- <i class="fa fa-fw fa-home"></i> home: <http://gw.tnode.com/docker/periodic-rsync/>
- <i class="fa fa-fw fa-github-square"></i> github: <http://github.com/gw0/docker-periodic-rsync/>
- <i class="fa fa-fw fa-laptop"></i> technology: *Debian*, *cron*, *ssh*, *rsync*
- <i class="fa fa-fw fa-database"></i> docker hub: <https://hub.docker.com/r/gw000/periodic-rsync/>


Usage
=====

Requirements:

- setup passwordless SSH login on remote machines ([setup](http://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/))
- `/root/.ssh`: mount your passwordless SSH public and private keys (`id_rsa`/`id_rsa.pub`, chown to user `root`)
- `/data`: mount preferred target directory
- `/etc/crontab`: mount your crontab file (for periodic usage)

For one-time usage:

```bash
$ docker run -it --rm -v /srv/backup/.ssh:/root/.ssh -v /srv/backup/data:/data gw000/periodic-rsync rsync -zave ssh user@server.remote:dir/ /data
```

For periodic usage (prepare crontab file `/srv/backup/crontab`):

```
# /etc/crontab: system-wide crontab
SHELL=/bin/sh

# m h dom mon dow user  command
*/5 *   *   *   * root  rsync -zave ssh user@server.remote:dir/ /data
```

```bash
$ docker run -d -v /srv/backup/.ssh:/root/.ssh -v /srv/backup/crontab:/etc/crontab -v /srv/backup/data:/data --name periodic-rsync gw000/periodic-rsync cron -f
```


Feedback
========

If you encounter any bugs or have feature requests, please file them in the [issue tracker](http://github.com/gw0/docker-periodic-rsync/issues/) or even develop it yourself and submit a pull request over [GitHub](http://github.com/gw0/docker-periodic-rsync/).


License
=======

Copyright &copy; 2016 *gw0* [<http://gw.tnode.com/>] &lt;<gw.2016@tnode.com>&gt;

This library is licensed under the [GNU Affero General Public License 3.0+](LICENSE_AGPL-3.0.txt) (AGPL-3.0+). Note that it is mandatory to make all modifications and complete source code of this library publicly available to any user.
