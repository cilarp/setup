ssh-keygen -t rsa -b 4096 -C "cilarp914@gmail.com"
chmod 600 ~/.ssh/id_rsa_github
echo "Host github"                         >> ~/.ssh/config
echo "  HostName github.com"               >> ~/.ssh/config
echo "  User git"                          >> ~/.ssh/config
echo "  IdentityFile ~/.ssh/id_rsa_github" >> ~/.ssh/config