#!/usr/bin/perl
## https://wiki.zimbra.com/wiki/Exporting_all_addresses --> estraiamo da Zimbra SOLO GLI ACCOUNTS (NO ALIAS, NON DISTRIBUTION LIST)
# [sudo -u zimbra /opt/zimbra/bin/zmprov -l gaa >/tmp/lista.csv]
# [cat /tmp/lista.csv |wc -l]
## CONTROLLARE IL NUMERO DI ACCOUNTS E CONFRONTARE con la lista su Zimbra
# [cat /tmp/lista.csv|grep spam]
## CONTROLLARE A MANO GLI ACCOUNT CHE INIZIANO PER "spam", ce ne possono essere alcuni validi oltre a quello di default (spam.*)
# [sed -i '/spam.lagxu1cz@hexgroup.net/d' /tmp/lista.csv]
$PWD=`pwd`;
chomp($PWD);
`sed -i '/galsync/d' /tmp/lista.csv`;
`sed -i '/ham/d' /tmp/lista.csv`;
`sed -i '/virus/d' /tmp/lista.csv`;
`rm -f /tmp/*@*`;
$R="mv \/tmp\/lista.csv ".$PWD."\/";
#print $R;
system ($R);
open(my $data, '<', "lista.csv") or die "Could not open '$file' $!\n";

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
