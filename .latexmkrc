
# https://tex.stackexchange.com/questions/1226/how-to-make-latexmk-use-makeglossaries/44316#44316
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
    my ($base_name, $path) = fileparse( $_[0] );
    pushd $path;

    if ( $silent ) {
        system "makeglossaries -q '$base_name'";
    } else {
        system "makeglossaries '$base_name'";
    };

    popd;
}

push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
$clean_ext .= ' %R.ist %R.xdy';
