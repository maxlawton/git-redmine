git-redmine
===========

Git extras for task management with Redmine


Installation
------------

Place the following files somewhere in your *$PATH*

  * `git-redmine`
  * `git-ticket`

Add these to your hooks template directory. You'll need to re-init any existing repos.

  * `hooks/post-commit`
  * `hooks/prepare-commit-msg`


Configuration
-------------

```ini
# git-redmine sample configuration

[alias]
	tk = "ticket"
    red = "redmine"

[redmine]
	apiKey = "e9d350be1db2c11ed500d6fd1d9d7d1d"
    url = "http://tracking.example.com"
    outputCmd = "redmine-status-output.sh"
    autoMessage = true
    autoUpdate = false
```

Take a look at `contrib/redmine-status-output.sh` for an example outputCmd

