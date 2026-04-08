use std::env;
use std::fs::{self, File};
use std::io::{BufRead, BufReader, BufWriter, Write};
extern crate regex;
// use regex::Regex;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let args: Vec<String> = env::args().collect();
    let in_file = args.get(1).expect("FixWord requires the name of a text file to fix.");
    let out_file = args.get(2).map(|s| s.as_str()).unwrap_or("/tmp/FWTemp");

    let trans_map: Vec<(regex::Regex, &str)> = vec![
        (regex::Regex::new(r"'s ").unwrap(),            "&rsquo;s "),
        (regex::Regex::new(r"n't ").unwrap(),           "n&rsquo;t "),
        (regex::Regex::new(r"’").unwrap(),              "&rsquo;"),
        (regex::Regex::new(r"\\'").unwrap(),            "&rsquo;"),
        (regex::Regex::new(r"“").unwrap(),              "&ldquo;"),
        (regex::Regex::new(r"”").unwrap(),              "&rdquo;"),
        (regex::Regex::new(r"—").unwrap(),              "&mdash;"),
        (regex::Regex::new(r" -- ").unwrap(),           " &mdash; "),
        (regex::Regex::new(r" –– ").unwrap(),           " &mdash; "),
        (regex::Regex::new(r" – ").unwrap(),            " &mdash; "),
        // The Perl regex '([^!]{1})--([^>]{1})' replaced with capture groups and replacement
        (regex::Regex::new(r"([^!])--([^>])").unwrap(), "${1}&mdash;${2}"),
        (regex::Regex::new(r" - ").unwrap(),            " &mdash; "),
        (regex::Regex::new(r"  ").unwrap(),             " "),
        (regex::Regex::new(r" & ").unwrap(),            " &amp; "),
        (regex::Regex::new(r"…").unwrap(),              "&hellip;"),
        (regex::Regex::new(r" ").unwrap(),          " "),
        (regex::Regex::new(r"'").unwrap(),              "&rsquo;"),
    ];

    let in_file_handle = File::open(in_file)
        .unwrap_or_else(|_| panic!("FixWord cannot open input file {}!", in_file));
    let out_file_handle = File::create(out_file)
        .unwrap_or_else(|_| panic!("FixWord cannot open output file {}!", out_file));

    let reader = BufReader::new(in_file_handle);
    let mut writer = BufWriter::new(out_file_handle);

    for line_res in reader.lines() {
        let mut line = line_res?;
        for (re, replacement) in &trans_map {
            line = re.replace_all(&line, *replacement).to_string();
        }
        writeln!(writer, "{}", line)?;
    }

    writer.flush()?;

    if out_file == "/tmp/FWTemp" {
        fs::rename(out_file, in_file)?;
    }

    Ok(())
}
