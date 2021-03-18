Heroku buildpack that installs s3cmd. Cloned from https://github.com/benalavi/buildpack-s3cmd,
and updated to include a newer version of s3cmd.

Installation
============

You probably want to compose this with other buildpack(s) using
heroku-buildpack-multi (https://github.com/ddollar/heroku-buildpack-multi):

Set your buildpack:

```
heroku config:set BUILDPACK_URL=https://github.com/ddollar/heroku-buildpack-multi
```

And add this to your `.buildpacks`, i.e.:

```
https://github.com/urbanbound/buildpack-s3cmd
https://github.com/heroku/heroku-buildpack-ruby
```

Dependencies
============
This buildpack requires the `heroku/python` buildpack, and that it be configured to install the `python-dateutil` library.

```
cat python-dateutil==2.8.1 >> requirements.txt
git add requirements.txt; git commit -m "Adding python-dateutil library to the list of python requirements"
heroku buildpacks:add heroku/python
git push heroku master
```

Usage
=====

Once built you will have `s3cmd` available on `PATH`.

Testing
=======

`ruby test/buildpack_test.rb`

There is also a `Vagrantfile` which will set up a VM with the build/test
environment ready to go:

```
vagrant up
vagrant ssh
cd /vagrant
ruby test/buildpack_test.rb
```

s3cmd-2.1.0 package
---------------------

The s3cmd-2.1.0 package this buildpack installs is available at
https://s3.amazonaws.com/ub-buildpack-s3cmd/s3cmd-2.1.0.tar.gz.

It is simply a repackaged version of the one available at
http://sourceforge.net/projects/s3tools/files/s3cmd/2.1.0/ with only `s3cmd`
and required `S3` folder included.
