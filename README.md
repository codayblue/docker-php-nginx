# The power of Nginx and PHP combined!

This docker file build out uses s6 overlay from just-containers to bring Nginx and PHP-FPM into the same container. In my opinion this is needed because without a webserver a PHP web application is pretty much useless, because we cant just send a request to PHP-FPM even if we are just building an API. The way this image should be observed is a one application docker container. This is my way to try and bring a simpler work flow to PHP. Like what other programming languages have. 

## Usage

1. Clone this repo (Will change once CI pipeline is built out)
2. Copy or volume your code to `/var/www/html/public` with an `index.php` or if your using a framework with a public dir copy it to `/var/www/html` but make sure it has an `index.php` in the public dir. All this can be changed in `/etc/nginx/conf.d/default.conf`, php settings can be changed in the many .ini files.

## Todo

- [ ] Multiarch ready dockerfile
- [ ] CI/CD pipeline (Github Actions)
- [ ] Setup quay.io repos to be public
- [ ] Add better documentation

# Warning

Verify php settings are what you want before sending an image to production. So many people do different things I could not bake in a production ready config. This image is ready for small home apps and local boxes. If you use the config in production I would just like to remind you that the LICENSE file does mention you get no warrenty and you use this software at your own risk.  