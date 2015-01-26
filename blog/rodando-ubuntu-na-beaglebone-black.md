![Rodando Ubuntu na Beaglebone Black](/assets/img/blog/beaglebone-black.jpg "Rodando Ubuntu na Beaglebone Black")

A Beaglebone Black vem com a sersão do Linux chamada [Angstrom](http://beagleboard.org/latest-images) instalada na memória flash
de 2GB. Eu vou mostrar os passos necessários para rodar Ubuntu (no meu caso a versão **13.04**) na sua Beaglebone Black.

É importante utilizar uma versão do Ubuntu que seja compatível com a Beaglebone Black a não ser que você seja fera no Kernel do Linux.

Eu estou utilizando um Mac para realizar este processo, mas também pode ser fetio em Linux ou Windows.

##Faça o download da imagem
  1. Baixe a versão do [Ubuntu para Beaglebone](http://s3.armhf.com/debian/raring/bone/ubuntu-raring-13.04-armhf-3.8.13-bone20.img.xz)
  2. Depois faça o download do aplicativo [The Unarchiver](https://itunes.apple.com/app/the-unarchiver/id425424353)
    ou se estiver utilizando Linux ``` $ sudo apt-get install xz ```
  3. Depois de descompactar o arquivo **.xz** você vai ter um arquivo **.img**

##Formate seu SD Card
Para este passo você vai ter que utilizar um SD card de no mínimo **2GB**

  1. Insira o SD card no leitor de cartões do seu note
  2. Abra o aplicativo Disk Utility, selecione o SD card na lateral esquerda e a tab no topo direito
  3. Clique no botão Apagar e formate o SD card

![Formatando seu SD card no Mac](/assets/img/blog/format-sdcard.png "Formatando seu SD card no Mac")


##Escreva a imagem no SD Card
  1. Pegue o nome do SD Card ```diskutil list```
  2. No meu caso o meu SD Card é **disk1**
  3. Execute o comando de **unmount** para que a gente possa sobrescrever o cartão
     ```diskutil unmountDisk /dev/disk2```
  4. Agora podemos escrever a imagem do Ubuntu no nosso SD Card
     ```sudo dd if=/Caminho/da/sea/imagem/ubuntu-raring-13.04-armhf-3.8.13-bone20.img of=/dev/disk2 bs=1m```
  5. Agora espere até que termine de montar a imagem no seu SD Card. **Dica: vai tomar um café que pode demorar um pouco**


##Rodando o Ubuntu no SD Card
Agora vamos inserir o SD Card na nossa Beaglebone Black, lembre que ela deve estar desligada para o início do processo.

  1. Insira o SD Card na Beaglebone Black enaquanto ela esta **desligada**
  2. Mantenha o botão **USER/BOOT** pressionado (o botão é o mais perto do slot de SD Card)
  3. Ligue o cabo de envergia 5V (o cabo usb não deve funcionar)
  4. Quando as luzes começarem a piscar pode soltar o botão
  5. Depois de um minuto você vai ver a tela de login
  6. Utiliza o login **ubuntu** e senha **ubuntu**


Pronto agora você já tem uma Breaglebone Black rodando Ubuntu e já pode comaçar a programar!

