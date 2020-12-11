#!/local/bin/perl
open(DATA,"counter") || die "Can't open counter!\n";
$c = int(<DATA>);
close(DATA);
open(DATA2,"> counter");
$c = $c + 1;
print DATA2 "$c";
close (DATA2);
