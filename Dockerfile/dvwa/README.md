#### Installation

must grant to 'root'@'localhost' identified by 'bug'

#### To build

``` bash
$ docker build -t bwapp .
```

#### To run

``` bash
$ docker run -it -p 80:80 --name bwapp bwapp
```

visit `http://localhost/bWAPP/login.php` and the default username/password is `bee`/`bug`
