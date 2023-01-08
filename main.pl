#!/usr/bin/perl
## https://wiki.zimbra.com/wiki/Exporting_all_addresses --> estraiamo da Zimbra SOLO GLI ACCOUNTS (NO ALIAS, NON DISTRIBUTION LIST)
# [sudo -u zimbra /opt/zimbra/bin/zmprov -l gaa >/tmp/emails.txt]
# [cat /tmp/emails.txt |wc -l]
## CONTROLLARE IL NUMERO DI ACCOUNTS E CONFRONTARE con la lista su Zimbra
# [cat /tmp/emails.txt|grep spam]
## CONTROLLARE A MANO GLI ACCOUNT CHE INIZIANO PER "spam", ce ne possono essere alcuni validi oltre a quello di default (spam.*)
# [sed -i '/spam.lagxu1cz@hexgroup.net/d' /tmp/emails.txt]
$PWD=`pwd`;
chomp($PWD);
open(my $data, '<', "lista.csv") or die "Could not open '$file' $!\n";
`sed -i '/galsync/d' /tmp/emails.txt`;
`sed -i '/ham/d' /tmp/emails.txt`;
`sed -i '/virus/d' /tmp/emails.txt`;
`rm -f /tmp/*@*`;
$R="mv /tmp/emails.txt ".$PWD."/";
system $(R);
while (my $line = <$data>) {
  chomp $line;

  my @fields = split ";" , $line;

`cp template.sh  exec.sh`;
$A="sed -i s\/ADDR\/\"".$fields[0]."\"/g exec.sh";
#print ("$A\n");
system($A);
$B="bash ".$PWD."\/exec.sh";
system($B);
}
`find /tmp -size 0 -print -delete`
## In the /tmp directory you find the files corresponding to the accounts with saved contacts
