# Stats

This repository is collection of scripts for generating project statics and
data.

Stats generated by these scripts have been, are and will be used in curl
related blog posts and presentations and by providing the scripts in a public
repository everyone can reproduce the results and can verify the correctness
of them.

And it allows everyone to help out to improve the script and to provide new
ones that generate even more, better and more interesting project stats.

## How to run the scripts

### Check out the main curl git repository

    git clone https://github.com/curl/curl.git

### Check out this repository as a subdirectory

    cd curl
    git clone https://github.com/curl/stats.git

### Run the stats scripts

The scripts are (primarily) written in perl and are intended to be run from
the curl source code root.

Example:

    perl stats/CI-jobs-over-time.pl

## Output

The scripts are written to output CSV data, usually having data and/or curl
release versions included in each line.

## License

The scripts are provided under [MIT](LICENSE).

# List of scripts

| Name                 | Purpose | Output fields       |
|----------------------|---------|---------------------|
|CI-jobs-over-time.pl  | obvious | version;date;number |
