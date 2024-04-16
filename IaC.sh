#!/bin/bash

# Esse código deve ser ativo pelo user Root

cd /

# Variáveis - EDITAR
groups=("GRP_ADM" "GRP_VEN" "GRP_SEC") #Grupos
directors770=("adm" "ven" "sec") #Diretórios - Acesso do Root e Grupos
directors777=("publico") #Diretórios - Acesso total a todos os diretórios
usersAdm=("carlos" "maria" "joao") #Usuários ADM
usersVen=("debora" "sebastiana" "roberto") #Usuários VEN
usersSec=("josefina" "amanda" "rogerio") #Usuários SEC

# Criação de grupos
echo " "
echo "Criando grupos..."

for makeGroup in "${groups[@]}"
do
    groupadd "$makeGroup"
    echo "Grupo '$makeGroup' criado com sucesso!"
done

# Criação de diretorios
echo " "
echo "Criando diretórios..."

for makeDirector in "${directors777[@]}"
do
        mkdir "$makeDirector"
        chmod 777 "$makeDirector"
        chown -R :root /publico
        echo "Diretório '$makeDirector' criado e adicionado ao grupo root!"
done

mkdir adm
chown -R :GRP_ADM /adm
chmod 770 adm
echo "Diretório adm criado e adicionado ao grupo GRP_ADM!"

mkdir ven
chown -R :GRP_VEN /ven
chmod 770 ven
echo "Diretório ven criado e adicionado ao grupo GRP_VEN!"

mkdir sec
chown -R :GRP_SEC /sec
chmod 770 sec
echo "Diretório sec criado e adicionado ao grupo GRP_SEC!"

# Criação dos usuarios
echo " "
echo "Criando usuários ADM..."

for users in "${usersAdm[@]}" #ADM
do
    group="${groups[0]}"

    useradd "$users" -s /bin/bash -G "${group}"
    echo "$users:Senha123" | chpasswd
    echo "Usuário '$users' criado com sucesso e adicionado ao '$group'!"
    passwd "$users" -e
done

for users in "${usersVen[@]}" #VEN
do
    group="${groups[1]}"

    useradd "$users" -s /bin/bash -G "${group}"
    echo "$users:Senha123" | chpasswd
    echo "Usuário '$users' criado com sucesso e adicionado ao '$group'!"
    passwd "$users" -e
done

for users in "${usersSec[@]}" #SEC
do
    group="${groups[2]}"

    useradd "$users" -s /bin/bash -G "${group}"
    echo "$users:Senha123" | chpasswd
    echo "Usuário '$users' criado com sucesso e adicionado ao '$group'!"
    passwd "$users" -e
done