# Projet en CLOUD COURSES

Au cours de ce projet, nous avons souhaiter mettre en ligne un site pour l'association de ski en html puis nous souhaiterions
le faire en php.

Nous avons utilisé Terraform et Ansible. 

# Terraform 

Les commandes a utilisé pour créer un serveur terraform :

cd cloud-project 
terraform init 
terraform plan 
terraform apply

Terraform va alors vous rendre en outputs une IP. Copier-Coller la dans le dossier hosts à la place de celle deja mise. 

# Ansible 

Lancez la commande :

ansible-playbook -i hosts  playbook.yml

Puis vous pourrez acceder au site html en utilisant ladresse IP fournit precedement. 

# Membres du groupe :

- CHAMPMARTIN Baptiste        
- OMRI Elias 
- LEVET Constantin 
