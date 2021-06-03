#!/bin/sh
echo "Bienvenido al configurador del minado de COCOCR\n\nRequisitos:\n1) Dirección de billetera de COCO (puedes obtenerla desde alguna de nuestras billeteras que se encuentran disponibles en https://github.com/costaricadigitalcoin?tab=repositories)\n\nPor favor ingrese la dirección de su billetera para recibir los COCOCR minados"
read wallet
if [ ${#wallet} -gt 34 ]
then
   echo "Direccion incorrecta"
   exit
elif [ ${#wallet} -lt 33 ]
then
   echo "Direccion incorrecta"
   exit
else
   echo "Direccion correcta"
fi
touch mine_pool.sh
echo "#!/bin/sh\n./cpuminer -a X11 -o stratum+tcp://miningpool.costaricadigitalcoin.com:3008 -u $wallet -p anything" > mine_pool.sh
chmod +x mine_pool.sh
curl https://www.costaricadigitalcoin.com/wp-content/uploads/2020/12/cpuminer-osx.zip -o cpuminer-osx.zip
tar -xvzf "cpuminer-osx.zip"
rm "cpuminer-osx.zip"
echo "Billetera configurada correctamente\n\nNota: se ejecutará el archivo mine_pool.sh (ejecutar este archivo para futuros minados)\n\nEl minado empezara en este momento"
./mine_pool.sh
