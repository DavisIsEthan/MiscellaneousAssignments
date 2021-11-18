#!/usr/bin/perl
#AUTHOR Professor Jimmy Raeder (guidance) and Ethan Davis
$file="acesslog";
#...... grab the file via curl, only do once
  system("curl 'http://squirrel.sr.unh.edu/~jraeder/PHYS-795-895-F2017/uploads/httpd_access_log' > $file");

#...... simplest way to read entire file

$_=`cat $file`;
#...... get rid of unwanted characters
s/\"/ /g; s/\?/ /g; s/\,/ /g; s/\*/ /g; s/\'/ /g; s/\)/ /g; s/\+/ /g;
$text=$_;
$text=~s/[^ \d+ \. \d+ \. \d+ \. \d+$ ]/ /g;  #..... convert all non-IP adresses
#...to blanks


#...... loop over lines and count occurences of IP adresses
%W=();
foreach(split('\n',$text)){ @a=split(' ',$_);
    foreach $w (@a){ $ww=lc($w); $W{$ww}++; }  }
#..... find maximum/number and order occurences
$m=0; foreach(keys(%W)){ $x=$W{$_}; if($x>$m){ $m=$x; } }  print "max count:  $m\n";
for($i=$m;$i>2;$i--){
    $line=''; $n=0;
    foreach(keys(%W)){ $x=$W{$_}; if($x == $i){ $line="$line $_"; $n++; } }
    if(length($line)>0){ print " $i occurrences ($n words):  $line\n"; }
}
