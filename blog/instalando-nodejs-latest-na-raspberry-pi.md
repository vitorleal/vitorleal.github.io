![Instalando Node.js latest na Raspberry Pi](/assets/img/blog/raspberry-nodejs.jpg "Instalando Node.js latest na Raspberry Pi")

Vou mostrar como instalar o [Node.js](http://nodejs.org) latest (no meu caso a **v0.10.29**) na [Raspberry Pi](http://www.raspberrypi.org) de forma bem simples.

##Instalando a versão antiga (0.6)
A versão que está disponibilizada no apt-get por padrão é muito antiga, muito antiga mesmo. É a versão **0.6**

Para instalar esta versão basta executar o comando:
```
apt-get install nodejs
```

##Instalando o Node.js Latest (0.10.*)

#####Primeiro vamos fazer o download do **tar.gz** do Node.js latest:
```
wget http://nodejs.org/dist/node-latest.tar.gz
```

#####Agora vamos descompactar o arquivo:
```
tar -xzf node-latest.tar.gz
```

#####Mudamos para a o direório descompactado:
```
cd node-latest.tar
```

#####Vamos configurar o Node.js
```
./configure
```

#####Agora vamos fazer a instalação
**Dica**: *Vai tomar um café, ou almoçar porque vai demorar bastante, bastante mesmo*
```
make && sudo make install
```

##Testando a versão do Node.js e do NPM
Para verificar a versão do Node.js basta executar o comando:
```
node -v
```
deve responder algo como **v0.10.29**

```
npm -v
```
deve responder algo como **1.5.0-alpha-1**

***

Pronto agora você já tem a última versão do **Node.js** instalado na sua **Raspberry Pi** e você já pode começar a programar!
