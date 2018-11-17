#### To build

``` bash
$ docker build -t dvwa .
```

#### To run

``` bash
$ docker run -it -p 80:80 --name dvwa dvwa
```

visit `http://localhost/dvwa/setup.php` and the default username/password is `admin`/`password`
