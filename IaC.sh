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

# for makeDirector in "${directors770[@]}"
# do
#     Director="$makeDirector"
#     Grupo="${groups[$makeDirector]}"

#     mkdir "$Director"
#     chmod 770 "$Director"
#     chown -R ":$Grupo" /"$Director"
#     echo "Diretório '$Director' criado e adicionado ao grupo '$Grupo'!"
# done

for makeDirector in "${directors770[@]}"
do
    mkdir "$makeDirector"
    chmod 770 "$makeDirector"
    chown -R ":GRP_$makeDirector" "/$makeDirector"
    echo "Diretório '$makeDirector' criado e adicionado ao grupo 'GRP_$makeDirector'!"
done

# mkdir adm
# chown -R :GRP_ADM /adm
# chmod 770 adm
# echo "Diretório adm criado e adicionado ao grupo GRP_ADM!"

# mkdir ven
# chown -R :GRP_VEN /ven
# chmod 770 ven
# echo "Diretório ven criado e adicionado ao grupo GRP_VEN!"

# mkdir sec
# chown -R :GRP_SEC /sec
# chmod 770 sec
# echo "Diretório sec criado e adicionado ao grupo GRP_SEC!"

# Criação dos usuarios
echo " "
echo "Criando usuários ADM..."

for users in "${usersAdm[@]}" #ADM
do
    group="GRP_${directors770[0]}"

    useradd "$users" -s /bin/bash -G "$group"
    echo "$users:Senha123" | chpasswd
    echo "Usuário '$users' criado com sucesso e adicionado ao '$group'!"
    passwd "$users" -e
done

echo " "
echo "Criando usuários VEN..."
for users in "${usersVen[@]}" #VEN
do
    group="GRP_${directors770[1]}"

    useradd "$users" -s /bin/bash -G "${group}"
    echo "$users:Senha123" | chpasswd
    echo "Usuário '$users' criado com sucesso e adicionado ao '$group'!"
    passwd "$users" -e
done

echo " "
echo "Criando usuários SEC..."
for users in "${usersSec[@]}" #SEC
do
    group="GRP_${directors770[2]}"

    useradd "$users" -s /bin/bash -G "${group}"
    echo "$users:Senha123" | chpasswd
    echo "Usuário '$users' criado com sucesso e adicionado ao '$group'!"
    passwd "$users" -e
done