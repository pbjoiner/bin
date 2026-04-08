# Build fixwords RegEx With Dependencies

## Add Regex To Available Libraries
`cargo add regex regex-automata regex-syntax`

## Complie Libraries And Output To `./deps`

`rustc --out-dir ./deps --crate-type lib --emit=metadata,link --crate-name regex_syntax --edition=2021 ~/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/regex-syntax-0.8.10/src/lib.rs`

`rustc --out-dir ./deps --crate-type lib --emit=metadata,link --crate-name regex_automata --edition=2021 ~/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/regex-automata-0.4.14/src/lib.rs --cfg 'feature="alloc"' --cfg 'feature="meta"' --cfg 'feature="nfa-pikevm"' --cfg 'feature="nfa-thompson"' --cfg 'feature="syntax"' -L dependency=./deps --extern regex_syntax=./deps/libregex_syntax.rmeta`

`rustc --out-dir ./deps --crate-type lib --emit=metadata,link --crate-name regex --edition=2021 ~/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/regex-1.12.3/src/lib.rs -L dependency=./deps --extern regex_automata=./deps/libregex_automata.rmeta --extern regex_syntax=./deps/libregex_syntax.rmeta`

## Compile With Explicit Dependency Reference

`rustc --out-dir ./ --crate-type bin --emit=link --crate-name mycrate --edition=2021 fixwords.rs -L dependency=./deps --extern regex=./deps/libregex.rlib`
