#!/usr/bin/perl

require "./stats/tag2date.pm";

sub num {
    my ($t)=@_;
    if($t =~ /^curl-(\d)_(\d+)_(\d+)/) {
        return 10000*$1 + 100*$2 + $3;
    }
    elsif($t =~ /^curl-(\d)_(\d+)/) {
        return 10000*$1 + 100*$2;
    }
}


sub sortthem {
    return num($a) <=> num($b);
}

@alltags= `git tag -l`;

foreach my $t (@alltags) {
    chomp $t;
    if($t =~ /^curl-([0-9_]*[0-9])\z/) {
        push @releases, $t;
    }
}

sub manpages {
    my ($tag) = @_;
    my $manpages = 0;

    if(num($tag) >= 80500) {
        open(G, "git show $tag:docs/libcurl/Makefile.inc $tag:docs/libcurl/opts/Makefile.inc | grep '\.3'|");
        my @p = <G>;
        close(G);
        $manpages = scalar(@p) + 3;
    }
    else {
        # limited to docs and lib to avoid 'ares' in the early repos
        open(G, "git ls-tree -r --name-only $tag -- docs lib 2>/dev/null|");
        while(<G>) {
            chomp;
            if($_ =~ /\.[31]\z/) {
                $manpages++;
            }
        }
        close(G);
    }
    return $manpages;
}


print <<CACHE
curl 6.5;2000-03-14;0
curl 6.5.1;2000-03-21;0
curl 6.5.2;2000-03-21;0
curl 7.1.1;2000-08-21;11
curl 7.2;2000-08-30;11
curl 7.3;2000-09-28;11
curl 7.4.1;2000-10-16;12
curl 7.5;2000-12-04;13
curl 7.5.2;2001-01-05;13
curl 7.6;2001-01-27;13
curl 7.6.1;2001-02-13;13
curl 7.7;2001-03-22;15
curl 7.7.1;2001-04-04;15
curl 7.7.2;2001-04-23;19
curl 7.7.3;2001-05-07;19
curl 7.8;2001-06-07;21
curl 7.8.1;2001-08-20;22
curl 7.9;2001-09-25;24
curl 7.9.1;2001-11-04;24
curl 7.9.2;2001-12-05;24
curl 7.9.3;2002-01-23;24
curl 7.9.4;2002-02-05;24
curl 7.9.5;2002-03-07;31
curl 7.9.6;2002-04-15;33
curl 7.9.7;2002-05-13;33
curl 7.9.8;2002-06-13;33
curl 7.10;2002-10-01;35
curl 7.10.1;2002-10-11;35
curl 7.10.2;2002-11-18;35
curl 7.10.3;2003-01-14;35
curl 7.10.4;2003-04-02;35
curl 7.10.5;2003-05-19;35
curl 7.10.6;2003-07-28;35
curl 7.10.7;2003-08-15;40
curl 7.10.8;2003-11-01;40
curl 7.11.0;2004-01-22;40
curl 7.11.1;2004-03-18;40
curl 7.11.2;2004-04-26;40
curl 7.12.0;2004-06-02;43
curl 7.12.1;2004-08-10;45
curl 7.12.2;2004-10-18;45
curl 7.12.3;2004-12-20;45
curl 7.13.0;2005-02-01;45
curl 7.13.1;2005-03-04;45
curl 7.13.2;2005-04-05;45
curl 7.14.0;2005-05-16;45
curl 7.14.1;2005-09-01;45
curl 7.15.0;2005-10-13;45
curl 7.15.1;2005-12-06;45
curl 7.15.2;2006-02-27;49
curl 7.15.3;2006-03-20;49
curl 7.15.4;2006-06-12;51
curl 7.15.5;2006-08-07;53
curl 7.16.0;2006-10-29;53
curl 7.16.1;2007-01-29;53
curl 7.16.2;2007-04-11;53
curl 7.16.3;2007-06-25;53
curl 7.16.4;2007-07-10;53
curl 7.17.0;2007-09-13;53
curl 7.17.1;2007-10-29;53
curl 7.18.0;2008-01-28;54
curl 7.18.1;2008-03-30;54
curl 7.18.2;2008-06-04;56
curl 7.19.0;2008-09-01;56
curl 7.19.1;2008-11-05;56
curl 7.19.2;2008-11-13;56
curl 7.19.3;2009-01-19;56
curl 7.19.4;2009-03-02;56
curl 7.19.5;2009-05-18;57
curl 7.19.6;2009-08-12;57
curl 7.19.7;2009-11-04;57
curl 7.20.0;2010-02-09;57
curl 7.20.1;2010-04-14;57
curl 7.21.0;2010-06-16;57
curl 7.21.1;2010-08-11;57
curl 7.21.2;2010-10-12;57
curl 7.21.3;2010-12-15;57
curl 7.21.4;2011-02-17;57
curl 7.21.5;2011-04-17;57
curl 7.21.6;2011-04-22;57
curl 7.21.7;2011-06-23;57
curl 7.22.0;2011-09-13;57
curl 7.23.0;2011-11-14;57
curl 7.23.1;2011-11-17;57
curl 7.24.0;2012-01-24;57
curl 7.25.0;2012-03-22;57
curl 7.26.0;2012-05-24;58
curl 7.27.0;2012-07-27;58
curl 7.28.0;2012-10-10;59
curl 7.28.1;2012-11-20;59
curl 7.29.0;2013-02-06;59
curl 7.30.0;2013-04-12;59
curl 7.31.0;2013-06-22;59
curl 7.32.0;2013-08-11;59
curl 7.33.0;2013-10-13;59
curl 7.34.0;2013-12-16;59
curl 7.35.0;2014-01-29;59
curl 7.36.0;2014-03-26;59
curl 7.37.0;2014-05-20;59
curl 7.37.1;2014-07-16;270
curl 7.38.0;2014-09-10;270
curl 7.39.0;2014-11-05;284
curl 7.40.0;2015-01-07;285
curl 7.41.0;2015-02-25;286
curl 7.42.0;2015-04-22;288
curl 7.42.1;2015-04-28;288
curl 7.43.0;2015-06-17;291
curl 7.44.0;2015-08-11;294
curl 7.45.0;2015-10-07;339
curl 7.46.0;2015-12-01;342
curl 7.47.0;2016-01-27;342
curl 7.47.1;2016-02-08;342
curl 7.48.0;2016-03-23;344
curl 7.49.0;2016-05-17;346
curl 7.49.1;2016-05-30;346
curl 7.50.0;2016-07-21;347
curl 7.50.1;2016-08-03;347
curl 7.50.2;2016-09-07;347
curl 7.50.3;2016-09-14;347
curl 7.51.0;2016-11-02;348
curl 7.52.0;2016-12-20;369
curl 7.52.1;2016-12-22;369
curl 7.53.0;2017-02-22;369
curl 7.53.1;2017-02-24;369
curl 7.54.0;2017-04-19;370
curl 7.54.1;2017-06-14;370
curl 7.55.0;2017-08-09;378
curl 7.55.1;2017-08-13;378
curl 7.56.0;2017-10-04;393
curl 7.56.1;2017-10-23;393
curl 7.57.0;2017-11-29;393
curl 7.58.0;2018-01-23;394
curl 7.59.0;2018-03-13;400
curl 7.60.0;2018-05-15;402
curl 7.61.0;2018-07-11;412
curl 7.61.1;2018-09-04;412
curl 7.62.0;2018-10-30;422
curl 7.63.0;2018-12-12;423
curl 7.64.0;2019-02-06;426
curl 7.64.1;2019-03-27;428
curl 7.65.0;2019-05-22;429
curl 7.65.1;2019-06-04;429
curl 7.65.2;2019-07-17;429
curl 7.65.3;2019-07-19;429
curl 7.66.0;2019-09-10;432
curl 7.67.0;2019-11-05;433
curl 7.68.0;2020-01-08;434
curl 7.69.0;2020-03-04;435
curl 7.69.1;2020-03-11;435
curl 7.70.0;2020-04-29;435
curl 7.71.0;2020-06-23;442
curl 7.71.1;2020-06-30;442
curl 7.72.0;2020-08-19;443
curl 7.73.0;2020-10-14;448
curl 7.74.0;2020-12-09;454
curl 7.75.0;2021-02-03;455
curl 7.76.0;2021-03-31;459
curl 7.76.1;2021-04-14;459
curl 7.77.0;2021-05-26;461
curl 7.78.0;2021-07-21;461
curl 7.79.0;2021-09-14;461
curl 7.79.1;2021-09-22;461
curl 7.80.0;2021-11-10;466
curl 7.81.0;2022-01-05;472
curl 7.82.0;2022-03-05;472
curl 7.83.0;2022-04-27;474
curl 7.83.1;2022-05-11;474
curl 7.84.0;2022-06-27;478
curl 7.85.0;2022-08-31;480
curl 7.86.0;2022-10-26;484
curl 7.87.0;2022-12-21;486
curl 7.88.0;2023-02-15;486
curl 7.88.1;2023-02-20;486
curl 8.0.0;2023-03-20;486
curl 8.0.1;2023-03-20;486
curl 8.1.0;2023-05-17;486
curl 8.1.1;2023-05-23;486
curl 8.1.2;2023-05-30;486
curl 8.2.0;2023-07-19;492
curl 8.2.1;2023-07-26;492
curl 8.3.0;2023-09-13;493
curl 8.4.0;2023-10-11;495
curl 8.5.0;2023-12-06;496
curl 8.6.0;2024-01-31;498
curl 8.7.0;2024-03-27;499
curl 8.7.1;2024-03-27;499
curl 8.8.0;2024-05-22;501
CACHE
    ;

foreach my $t (sort sortthem @releases) {
    my $d = tag2date($t);
    my $l = manpages($t);

    if(num($t) <= 80800) {
        next;
    }
    # prettyfy
    $t =~ s/_/./g;
    $t =~ s/-/ /g;
    print "$t;$d;$l\n";
}

# repeat the last line with current date
my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) =
    localtime(time);
my $date = sprintf "%04d-%02d-%02d", $year + 1900, $mon + 1, $mday;
my $tag = `git describe --match "curl*"`;
chomp $tag;
printf "now;$date;%d\n", manpages($tag);
