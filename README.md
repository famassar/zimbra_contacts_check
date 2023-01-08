Script and procedure for check and extract zimbra accounts with saved contact<br>
Copy main.pl and template.sh where you want<br>
In file main.pl:<br>
    Lines starting with ## are comments<br>
    Lines Starting with # [] are commands to run manually<br>
Run manually the commands in lines starting with "# ["<br>
Run perl main.pl
If you need to extract contacts in csv format, you can use this command: /opt/zimbra/bin/zmmailbox -z -m user@domain.com getRestURL "/Contacts?fmt=csv" > /tmp/user-contacts.csv<br>
(I suggest to use this command only with accounts with saved contacts, as extracted in previous steps)
