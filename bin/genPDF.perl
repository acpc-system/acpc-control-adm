#!/usr/bin/perl
use PDF::Create;
use feature qw(say);
my @PasswordDomain=("A".."H","J"."N","P".."Q","1".."9","!","@","%","^");
if ( $#ARGV == -1 ) {
	print "Insufficient patamers \n";
	print "genPDF.perl <No of users> <Header> <File suffix>\n";
	print "The generated PDF will be <Domain>_<File Suffix>_print.pdf";
	print "                          <Domain>_<File Suffix>_pc2";
	print "The generated PDF will be <Domain>_<File Suffix>_unix";
        exit 0;
}

open (my $MYFILE, '/acpc/adm/etc/domain');
$DOMAIN=<$MYFILE>;
chomp $DOMAIN;
close ($MYFILE);

open (my $MYFILE, '/acpc/adm/etc/siteid');
$SITEID=<$MYFILE>;
chomp $SITEID;
close ($MYFILE);

$N=$ARGV[0];
$PRACCOMP=$ARGV[1];
$SUFFIX=$ARGV[2];
$NAME="/acpc/adm/var/$DOMAIN\_$SUFFIX\_print.pdf";
$PC2File="/acpc/adm/var/$DOMAIN\_$SUFFIX\_pc2";
$UNIXFile="/acpc/adm/var/$DOMAIN\_$SUFFIX\_unix";
my $acpcPDF=PDF::Create->new('filename' => $NAME,
			   'Author' => 'ACPC System Administrator',
			   'Title' => $PRACCOMP,
			   'PageMode' => 'UseOutlines',
			   'CreationDate' => [ localtime ], );
my $A4Page=$acpcPDF->new_page('MediaBox' => $acpcPDF->get_page_size('A4'));
$Font=$acpcPDF->font('BaseFont' => 'Helvetica');
open($PC2File,">$PC2File");
print $PC2File "site\taccount\tpassword\tpermdisplay\tpermlogin\t\n";
open($UnixFile,">$UNIXFile");
for (my $i=1; $i<=$N;$i++) {
my $Page=$A4Page->new_page;
$Page->stringc($Font,40,300,650,$PRACCOMP);
$USERNAME="team$i";
$PASSWORD="";
$PASSWORD .=$PasswordDomain[rand @PasswordDomain] for 1..8;
$Page->stringc($Font,40,300,400,$USERNAME);
$Page->stringc($Font,40,300,300,$PASSWORD);
$Page->line(50,50,50,792);
$Page->line(50,50,562,50);
$Page->line(562,50,562,792);
$Page->line(50,792,562,792);
my $ImgName="/acpc/adm/images/univ_logos/$USERNAME.gif";
print $UnixFile "usermod -p `openssl passwd -1 $PASSWORD` $USERNAME\n";
##############################
#### Get the team name of the team number $i
if ( ! -e "/acpc/adm/etc/teamnames" ) {
$TEAMNAME="_$USERNAME";
}
else
{
$TEAMNAME="_$USERNAME";
open(my $TeamFile,"/acpc/adm/etc/teamnames" );
while(<$TeamFile>)
{
 chomp;
 $LINE=$_;
 @INDEX=split(':',$LINE);
 if ( $INDEX[0] == $i )
	{
		$TEAMNAME=$INDEX[1];
	}
}
close($TeamFile);
}
##############################
print $PC2File "$SITEID\t$USERNAME\t$PASSWORD\ttrue\ttrue\n";
######################## 324 * 135
########################## scaled to 65 * 27
if ( -e "/acpc/adm/images/team.gif" ) {
	my $Pic=$acpcPDF->image("/acpc/adm/images/team.gif");
	$Page->image('image'=>$Pic,'xscale' => 0.1, 'yscale' => 0.1, 'xpos' => 90, 'ypos' => 710 );
}


if ( -e "/acpc/adm/images/host.gif" ) {
        my $Pic=$acpcPDF->image("/acpc/adm/images/host.gif");
        $Page->image('image'=>$Pic,'xscale' => 0.2, 'yscale' => 0.2, 'xpos' => 450, 'ypos' => 700 );
}
}
$acpcPDF->close();
print $UnixFile "cd /var/yp;make;cd -";
close($PC2File);
close($UNIXFile);

