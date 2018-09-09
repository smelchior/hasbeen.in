# Welcome to hasbeen.in, your geek-friendly travel site.

[![Travis Build Status](https://travis-ci.org/findoutwho/hasbeen.in.png?branch=master)](https://travis-ci.org/findoutwho/hasbeen.in)

Find out where your fellow geeks have been, add yourself:

* Fork this repo
* Add your traveller file (*)
* Send a pull request

### Testing locally

Install all required Gems and start up Padrino:

``` bash
$ bundle install
Using rake 10.1.1
[…]
Using puma 3.8.2
Bundle complete! 15 Gemfile dependencies, 46 gems now installed.
Use `bundle show [gemname]` to see where a bundled gem is installed.

[…]
$ puma
[69267] Puma starting in cluster mode...
[69267] * Version 3.8.2 (ruby 2.4.1-p111), codename: Sassy Salamander
[69267] * Min threads: 5, max threads: 5
[69267] * Environment: development
[69267] * Process workers: 2
[69267] * Preloading application
[69267] * Listening on tcp://0.0.0.0:3000
[…]
```

You can reach your local hasbeen.in instance at:
[www.dev.hasbeen.in:3000](http://www.dev.hasbeen.in:3000).

### Testing locally with docker
Requirements: Docker + docker-compose installed

First create the env file and add your google maps api key for the internal geolocation requests:
```bash
mv .env.dist .env
```
The google maps api limits quite fast nowadays.

Edit your local hostfile to include:
```
127.0.0.1 www.dev.hasbeen.in <<traveller>>.dev.hasbeen.in
```

Run:
```
docker-compose up
```

You can reach your local hasbeen.in instance at:
[www.dev.hasbeen.in:3000](http://www.dev.hasbeen.in:3000).

***Note:*** The container only mounts the travellers config directory, so it can only be used to test traveller profile changes. If you want to change application logic, you will need to modify the docker setup.


### Traveller Profiles

(*) You'll find the profiles in `config/travellers`. The
filename will be your subdomain name, so `bascht.yaml` will
be available at [bascht.hasbeen.in](https://bascht.hasbeen.in).
Should a place be ambiguous, add a hash with the display
name as key and a long name as a value for a city.

    name: "Bascht"
    profile:
      web: "http://bascht.com"
      twitter: "bascht"
      gravatar: "8656dc5476c819d4dcbd932a5744122a"
      current_hometown: "München, Deutschland"
    hasbeen:
      cities:
        - "Leipzig"
        - "Hamburg"
        - "Oelsnitz"
        - "Cologne"
        - {"Amerika": "Amerika, Penig, Deutschland"}
    […]

#### Validating your files

If you want to validate your pull request before actually
submitting it as an issue, use the built-in Rake task:

```shell
RACK_ENV=development bundle exec rake validate:travellers
```

--
