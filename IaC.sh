#!/bin/bash

# Esse código deve ser ativo pelo user Root

cd /

# Variáveis - EDITAR
directors770=("ADM" "VEN" "SEC") #Diretórios - Acesso do Root e Grupos
directors777=("publico") #Diretórios - Acesso total a todos os diretórios
usersAdm=("carlos" "maria" "joao") #Usuários ADM
usersVen=("debora" "sebastiana" "roberto") #Usuários VEN
usersSec=("josefina" "amanda" "rogerio") #Usuários SEC

# Criação de grupos
echo " "
echo "Criando grupos..."

for makeGroup in "${directors770[@]}"
do
    groupadd "GRP_$makeGroup"
    echo "Grupo 'GRP_$makeGroup' criado com sucesso!"
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

for makeDirector in "${directors770[@]}"
do
    mkdir "$makeDirector"
    chmod 770 "$makeDirector"
    chown -R ":GRP_$makeDirector" "/$makeDirector"
    echo "Diretório '$makeDirector' criado e adicionado ao grupo 'GRP_$makeDirector'!"
done

# Criação dos usuarios
echo " "
echo "Criando usuários ADM..."

for users in "${usersAdm[@]}"
do
    group="GRP_${directors770[0]}"

    useradd "$users" -s /bin/bash -G "$group"
    echo "$users:Senha123" | chpasswd
    echo "Usuário '$users' criado com sucesso e adicionado ao '$group'!"
    passwd "$users" -e
done

echo " "
echo "Criando usuários VEN..."
for users in "${usersVen[@]}"
do
    group="GRP_${directors770[1]}"

    useradd "$users" -s /bin/bash -G "${group}"
    echo "$users:Senha123" | chpasswd
    echo "Usuário '$users' criado com sucesso e adicionado ao '$group'!"
    passwd "$users" -e
done

echo " "
echo "Criando usuários SEC..."
for users in "${usersSec[@]}"
do
    group="GRP_${directors770[2]}"

    useradd "$users" -s /bin/bash -G "${group}"
    echo "$users:Senha123" | chpasswd
    echo "Usuário '$users' criado com sucesso e adicionado ao '$group'!"
    passwd "$users" -e
done