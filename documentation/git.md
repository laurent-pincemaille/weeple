# Git workflow
Création de branche(depuis master):
```bash
git checkout -b feature/label
# Après ajout de code, on ajoute son travail 
git add .
git commit -m "Create my feature label"
# On push la branche sur le remote (-u la première fois)
git push -u origin feature/label
# Maintenant on veut mettre à jour son travail sur master
git checkout master
git pull origin master

# Gestion des conflits eventuels
git merge feature/label

git push origin master

# Virer la feature en local et sur le remote (2 commandes)
```



