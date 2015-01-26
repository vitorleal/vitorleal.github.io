![Configurando Flask no servidor](http://vitorleal.com/assets/img/blog/flask-uwsgi-nginx.jpg "Configurando Flask com UWSGI e Nginx")

Neste post vou mostrar como configurar os serviços [UWSGI](https://github.com/unbit/uwsgi-docs) e [Nginx](http://nginx.com) em um servidor Ubuntu
 para rodar aplicações web utilizando o microframework de Python chamdo [Flask](http://flask.pocoo.org).


##O que é [Flask](http://flask.pocoo.org)
O Flask é um microframework para desenvolvimento web criado em Python. Super leve e compacto mas bem robusto e desenvolvido com ferramentas
 bem estáveis como a linguagem de templates para Python [Jinja 2](http://jinja.pocoo.org/docs) e da biblioteca de [WSGI](http://en.wikipedia.org/wiki/Web_Server_Gateway_Interface)
 para Ptyhon chamada [Werkzeug](http://werkzeug.pocoo.org).

****

##Instalando o Nginx e o UWSGI no servidor
Para instalar o Ngin e o UWSGI vamos utilizar o **apt-get**.

```
$ apt-get install uwsgi uwsgi-plugin-python nginx
```

****

##Configurando o UWSGI
Primeiro vamos crair o arquivo de configuração do **uwsgi** do nosso nosso webapp.
```
$ touch /etc/uwsgi/apps-available/nosso-app.ini
```

Criamos um link simbólico do nosso arquvio de configuração na pasta */etc/uwsgi/apps-enabled/**.
```
$ ln -s /etc/uwsgi/apps-available/nosso-app.ini /etc/uwsgi/apps-enabled/nosso-app.ini
```

Criamos o arquivo **.sock**
```
$ touch /tmp/nosso-app.sock
```

Agora vamos inserir os dados de configuração do nosso app.
```
[uwsgi]
vhost      = true
master     = true
socket     = /tmp/nosso-app.sock    #local do socket do nosso app
mod-socket = 666
venv       = /var/www/nosso-app/ENV #caminho do VirtualEnv nosso app
chdir      = /var/www/nosso-app     #caminho dos arquivod do nosso app
module     = run_server             #arquivo que roda nosso app flask
callable   = app
processes  = 4
threads    = 2
http       = 0.0.0.0:5000           #ip e porta que vai rodar o app
plugins    = python                 #plugin python do uwsgi que instalamos
env        = ENV_VARIABLE=variable  #variaveis de ambiente
```

Já podemos reiniciar o nosso serviço **uwsgi**
```
$ sudo service uwsgi restart
```

****

##Configurando o Nginx
Primeiro vamos crair o arquivo de configuração **nginx** do nosso webapp.
```
$ touch /etc/nginx/sites-available/nosso-app
```

Criamos um link simbólico do nosso arquvio de configuração na pasta */etc/nginx/sites-enabled/**.
```
$ ln -s /etc/nginx/sites-available/nosso-app /etc/nginx/sites-enabled/nosso-app
```

Agora vamos inserir as configuração do nginx
```
server {
     listen 80; #roda na porta 80
     client_max_body_size 10m; #maximo upload de 10m

     location / {
         include            uwsgi_params;             #parametros do uwsgi
         uwsgi_pass         unix:/tmp/nosso-app.sock; #nosso arquivo sock
         proxy_redirect     off;
         proxy_set_header   Host $host;
         proxy_set_header   X-Real-IP $remote_addr;
         proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
         proxy_set_header   X-Forwarded-Host $server_name;
     }

     location /static {
         #servir os arquivos estáticos
         alias /var/www/nosso-app/static;

         #habilitar o gzip nos arquivos estáticos
         gzip              on;
         gzip_static       on;
         gzip_comp_level   9;
         gzip_min_length   1400;
         gzip_types        text/plain text/css image/png image/gif
                           image/jpeg application/x-javascript text/xml
                           application/xml application/xml+rss text/javascript;
         gzip_vary         on;
         gzip_http_version 1.1;
         gzip_disable      "MSIE [1-6]\.(?!.*SV1)";
     }
}
```

Agora podemos reiniciar o serviço **nginx**
```
$ sudo service nginx restart
```

##Conclusão
Agora você pode acessar o ip ou dominio do seu servidor para ver o seu webapp rodando.
