#!/usr/bin/env bash
#  Armed only when executed: a sourcing scenario or worker picks its own
#  options, and an imposed -e would kill scripts whose greps may miss.
[ "${BASH_SOURCE[0]}" != "$0" ] || set -euo pipefail

SELF=${0##*/}
HERE=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
TA_ROOT=$HERE
TA_LIB=$HERE/$(basename -- "${BASH_SOURCE[0]}")

case $(uname -s 2>/dev/null) in
    Darwin)               TA_HOST=macos ;;
    MINGW*|MSYS*|CYGWIN*) TA_HOST=windows ;;
    *)                    TA_HOST=linux ;;
esac

TA_TIMEOUT_DEFAULTS='acats       30   30   410
extensions  30   30   600
project    120   60   600
bonus      120   60   600
repro      120  300  2400
fuzz        60   20   600
debug       30   30  1800
gameplay   600  300  1500'

TA_CRASH='internal error|^internal:|\.ll:[0-9]+:[0-9]+: error:|LLVM ERROR|PLEASE submit|Segmentation fault|Assertion failed|core dumped'

usage(){ cat <<TEXT
Usage: $SELF [COMMAND] [SELECTOR...] [-j N] [--accept] [--only L] [--skip L]

Test and measure the TurboAda compiler.  Every suite runs through one
engine: each test is an item in one pool of workers, every verdict is a
row of results.tsv, and one table reports them.  With no arguments, runs
every test.

Commands:
  run [SELECTOR...]   run the selected tests and print a report (the default)
  q [SELECTOR...]     a quick run of one ACATS group (default: c32)
  check [SELECTOR...] run, then diff against the baseline; exit 1 on a
                      regression: a test the baseline passed that no longer
                      does, or a test the baseline does not know that fails
  bless [SELECTOR...] run, then record the results in the baseline
  ci                  run the integrator's suites (acats repro extensions),
                      print the first failures' logs, write the step summary
                      when GitHub Actions asks; exit 1 on a failure in any
                      suite but debug, or on an ACATS test that never ran.
                      --only/--skip narrow it further
  list [SELECTOR...]  list the tests the selectors expand to, as SUITE/NAME
  acats [PREFIX]      run the conformance suite, or the tests whose file
                      name starts with PREFIX
  extensions [NAME]   run the extension tests (extensions/)
  project [CASE]      run the project-file cases (project/), such as gpr,
                      gpj/t07-macro or build
  bonus [FEATURE]     run the acats-bonus suite, or one feature's directory
  debug [SESSION]     run the debugging sessions (debug/run.sh --list names
                      them); a failure here reports but never gates ci
  repro [NAME]        run the reproducers, or one; a support file's name
                      runs the program it supports
  fuzz [CELL]         run the fuzz corpus, or one cell's directory
  gameplay [TIER] [NAME]
                      run the gameplay suite (gameplay/): its movement and
                      fuzz tiers, or one TIER -- movement, fuzz, fun,
                      behaviour, bench, audit or survival -- or one map,
                      case or bench of it; all but movement and fuzz run
                      only when named
  bench [MODE]        measure rather than test; see Benchmark modes below
  help                display this help and exit

The suite commands exit 1 when a test in the run fails; run never does.
NAME, CASE, FEATURE, SESSION and CELL are a test's name, a directory of
them, or a shell pattern matching either.

Selectors:
  all                 every test of every suite (default)
  a, b, c, d, e, l    one ACATS class
  PREFIX              ACATS tests whose file name starts with PREFIX (c45)
  SUITE               one suite: acats extensions project bonus debug repro fuzz
                      gameplay
  SUITE/NAME          what the suite command above would take as its argument

Options:
  -j N                run N tests at a time (default: the processor count)
  --accept            rewrite the expected output of the project cases and
                      of the debug programs from this run; read the diff
                      before committing it
  --only L            run only these suites (comma or space separated); a
                      suite outside the list yields no tests even if named
  --skip L            run every suite but these (comma or space separated);
                      TA_ONLY and TA_SKIP set the same from the environment

The suites and what each test must do:
  acats       ACATS 1.11 (tests.zip, unpacked to acats/ and refreshed
              whenever tests.zip changes), judged by class as the ACVC
              defines them: B tests must be rejected near every marked
              line, C tests must print PASSED, L tests must not link.
  extensions  extensions/NAME.ada builds, runs, prints PASSED and no FAILED.
              Headers: -- LINK: unit.ada (compiled first, linked in; the
              unit is support, not a test), -- SYMBOL: s / -- SYMBOL-NOT: s
              (nm must find, or must not find, s in the program),
              -- ARGS: words (the command line, shell-quoted).
  project     project/gpr/gNN-*.gpr, project/gpj/tNN-*.gpj: \`ta -P CASE -n
              [CASE.args]' run in the case's directory; stdout, stderr and
              \`exit N' must equal CASE.expected.  project/build/bNN-*.gp[rj]:
              \`ta -P CASE' in a scratch copy with CC and CXX unset, then the
              program it linked; \`build exit N', the program's output and
              \`exit N' join the comparison.  A CASE.known file marks an
              expected failure, counted as skip with its first line as the
              reason; a .known case that passes fails, so the marker goes.
  bonus       acats-bonus/FEATURE/NAME.ada, ACATS 4.2 tests for the post-83
              features.  A b-test must be rejected with an error on every
              line marked \`-- ERROR:' (a \`{N:' after the marker accepts the
              N lines above it too; NAME.errlines may name, per marked line,
              the lines whose errors stand for it), and with at least as
              many errors as marked lines; any other test must print PASSED
              and no FAILED.  NAME.ir lists \`present TEXT' and \`absent TEXT'
              lines the program's IR must and must not hold.
  debug       debug/run.sh, one session per program: -g, DWARF, gdb, lldb,
              DAP and REPL cases; a feature not merged yet is PENDING (skip).
  repro       repro/NAME.ada, the program each fix was landed with, run in
              its own empty directory, and repro/DIR/run.sh, a scripted
              scenario whose exit code is its verdict.  A file another
              file names in a WITH: header is support, not a test.  A
              program states what it expects in \`-- KEY: value' lines at
              the top of the file, before its first line of Ada; with none
              it must compile, link, run to exit 0, and print no line that
              begins with FAIL or WRONG or ends with WRONG.  Otherwise:
                -- FLAGS: -ada83           extra compiler flags
                -- WITH: a.ada b.ll        files copied beside it and compiled with it
                -- HOSTS: linux macos      hosts the test can judge; elsewhere it skips
                -- EXPECT: error TEXT      compilation must fail, with TEXT in an error line
                -- EXPECT: note TEXT       TEXT must appear in a note line
                -- EXPECT: warning TEXT    TEXT must appear in a warning line
                -- EXPECT: no-warning      compilation must produce no warning at all
                -- EXPECT: raise NAME      the run must end in \`Unhandled exception: NAME'
                -- EXPECT: print TEXT      some line of the output must be exactly TEXT
              EXPECT lines may repeat.  note is checked with error; warning,
              no-warning and print combine with the others; error stops
              before running; raise replaces the exit-0 rule.
  fuzz        fuzz/CELL/NAME.ada, the feature-matrix corpus.  The first
              line says \`-- CLASS: A|B|C' (else the name's first letter):
              A and C must build, run, print PASSED and no FAILED; B is
              judged as a bonus b-test is.  What ships is what passes.
  gameplay    the example game, Turbo Engine, driven headless through its
              \`--simulate BATCH --out DIR' mode (swarm/apis-2026-10/
              SIMULATION.md is the contract) by ./craft test, which
              writes every verdict.  One item is one game process, which
              loads its map once for all its rows.  Tiers:
                movement/MAP   the cases of gameplay/movement/cases.tsv on a
                               test map of gameplay/maps/, each measure
                               within its tolerance of the oracle in craft or
                               of the contract; determinism (byte-identical
                               reruns) and prediction (client against server)
                fuzz/MAP       fuzzing and exploring bots from every spawn of
                               a map under turboada-example-game-assets/maps/:
                               invariant violations, stuck players, pickups
                               no explorer touched, tick-time spikes, speed
                               against real time, determinism across processes
                fun/MAP/MODE   seeded bot matches, each metric of
                               gameplay/fun.tsv against its band (on demand)
                behaviour/MAP  deathmatches and duels at every difficulty:
                               how naturally the bots aim and move and how
                               often a person-like bot beats each difficulty,
                               against gameplay/behaviour.tsv (on demand)
                bench/BENCH    craft bench, one bench an item: recoil against
                               the CoD4 weapon files, sprint, smooth (a client
                               walk: camera jerk, pops, frame time and pacing),
                               rest, anim, speed, look and art (the remix
                               gates), each metric against gameplay/bench.tsv
                               (on demand)
                audit/claims   craft audit, the over-promise audit, a row a
                               claim (on demand)
                survival/nights  gameplay/night-shift.tsv's Night Shift runs:
                               a clean end, the ledger adding up, the grade,
                               the wave reached, the first death, recruit
                               against veteran (on demand)
              Each tier's tables and verdicts land in test_results/RUN/
              gameplay/TIER/ with report.md and report.html: heatmaps,
              distributions, and a reproduction command and replay for every
              failure.  The game is GAME, else bin-<platform>/turboada-
              example-game, built from turboada-example-game.ada when that is
              newer; a game that does not answer --simulate makes every row a
              skip, and one that does not build makes every row a failure.

Every judge fails a compile that crashes (a signal, a timeout, an internal
error, an LLVM error) whatever else it printed.

A scenario script (repro/DIR/run.sh) starts

    set -euo pipefail
    . "\$(dirname -- "\${BASH_SOURCE[0]}")/../../test.sh"
    scenario

and then has HERE (its directory), ADA83 (the compiler, absolute), WORK
(an empty directory removed on exit) and \`timed compile|run|SECONDS CMD',
which caps CMD at the suite's limit or at SECONDS.  A script that does not
source the library still gets ADA83 and TMPDIR from the harness.

Benchmark modes, reached as \`$SELF bench MODE':
  stages              where compile time goes: front end against back end
  parser              front end against input size, to expose non-linear cost
  corpus              throughput over the conformance suite, slowest inputs named
  compare REFERENCE   this compiler against another build of it, with deltas
  profile             the functions in turboada.c that compiling spends time in
  codegen             run time of the generated code, against GNAT where present
  memory              peak memory of the compiler and of what it produces
  all                 every mode but compare and profile (the default)

To compare two builds, keep the old binary and name it:

  cp bin-*/ta /tmp/before && make && ./$SELF bench compare /tmp/before

Environment:
  ADA83              compiler to test (default: bin-<platform>/ta, rebuilt
                     with make when it is missing or older than turboada.c)
  OPT                the flag ACATS tests link with (default: -O2); under
                     bench, the level alone (default: 2)
  JOBS, NPROC        parallel workers (default: the processor count)
  COMPILE_TIMEOUT    per-compile cap in seconds, for every suite
  TEST_TIMEOUT       per-run cap in seconds, for every suite
  LINK_TIMEOUT       ACATS per-test link cap in seconds (default: 20)
  WORKER_TIMEOUT     last-resort cap around one ACATS test
  SCENARIO_TIMEOUT   cap around one scripted test (a scenario, a debug session)
  STARTUP_TIMEOUT    compiler version-query cap in seconds (default: 30)
  BUILD_TIMEOUT      compiler rebuild cap in seconds (default: 300)
  KILL_GRACE         seconds after TERM before a cap sends KILL (default: 5)
  BASELINE           baseline path (default: test.baseline; an older
                     acats.baseline is read when it is absent)
  KEEP_WORK          set to 1 to keep every test's working directory
  TAP                set to 1 to also write a TAP stream
  CI_MAX_FAILURES    failures whose logs ci prints (default: all)
  NO_ANIMATE         set to 1 to draw no progress indicators
  NO_COLOUR          set to 1 to draw no colour

Gameplay environment (craft test documents each):
  GAME               the game's command (default: bin-<platform>/turboada-example-game)
  GAMEPLAY_MAPS      the maps directory (default: turboada-example-game-assets/maps)
  GAMEPLAY_FUZZ_SEEDS, GAMEPLAY_FUZZ_SECONDS, GAMEPLAY_FUZZ_BOTS
                     seeds per map (3), game seconds per run (60), bots per run (8)
  GAMEPLAY_FUN_MATCHES, GAMEPLAY_FUN_SECONDS
                     matches per map and mode (24), seconds each (0: the mode's limit)
  GAMEPLAY_SAMPLE_HZ samples a second (8; the movement tier takes all 64)
  GAMEPLAY_SPIKE_US  a tick slower than this is a spike (15625, one tick of real time)
  GAMEPLAY_MIN_SPEEDUP  median times real time a fuzz run must reach (100)

The caps per suite, in seconds; COMPILE_TIMEOUT, TEST_TIMEOUT and
SCENARIO_TIMEOUT replace a column for every suite:
$(printf '%s\n' "suite compile run item" "$TA_TIMEOUT_DEFAULTS" | awk '{ printf "  %-12s %7s %5s %6s\n", $1, $2, $3, $4 }')
(item caps a scripted test, a repro scenario or a debug session, and an
ACATS test, whose cap is computed from its compile, link and run caps.)

Benchmark environment:
  REPEATS            timed repetitions after warmup (default: 7)
  WARMUP             untimed runs before measuring (default: 1)
  CORPUS             files to take from the conformance suite (default: 300)
  ONLY               run only the named programs, space separated
  NO_GNAT            set to 1 to skip GNAT
  SLOWEST            slowest benchmark inputs to name (default: 12)

codegen mode only, where the two compilers are compared directly:
  CODEGEN_REPEATS    timed repetitions of each pair (default: 25)
  CODEGEN_WARMUP     untimed runs of each binary first (default: 3)
  SUITES             whole passes of the suite, to show the ratios hold (default: 2)
  BENCH_CPU          core to pin both binaries to (default: the last one)
  BENCH_CPUS_TASK    cores for the programs with tasks (default: the last two)
  RT                 set to 1 to run at SCHED_FIFO priority 50 as well
  FLOOR              seconds below which a MAD is treated as timer noise (default: 0.002)
  LOAD_MAX           one-minute load average above which the run refuses (default: 2.0)
  FORCE              set to 1 to measure anyway on a busy machine
  TSV_DIR            directory to write suite<N>.tsv into, one row per program
  NO_PIN             set to 1 to measure without taskset, nice or chrt

Each run writes test_results/ID/, where ID is unique to the run, so
concurrent runs do not overwrite one another: results.tsv (suite, name,
verdict, detail), test_summary.txt, results.tap when TAP=1, logs/ (every
ACATS test's logs, and the logs of every other test that failed) and
acats/ (what the ACATS tests built).
TEXT
}

now_ms(){
    local stamp=${EPOCHREALTIME:-}
    stamp=${stamp/[.,]/}
    if [[ $stamp =~ ^[0-9]{7,}$ ]]; then printf '%s' "${stamp:0:${#stamp}-3}"; return; fi
    stamp=$(date +%s%3N 2>/dev/null)
    [[ $stamp =~ ^[0-9]+$ ]] || stamp=$(( $(date +%s) * 1000 ))
    printf '%s' "$stamp"
}

abspath(){
    case $1 in
        /*|?:[/\\]*) printf '%s\n' "$1" ;;
        *)           printf '%s/%s\n' "$(cd -- "$(dirname -- "$1")" && pwd)" "$(basename -- "$1")" ;;
    esac
}

find_timeout(){
    local candidate found
    for candidate in ${TIMEOUT:+"$TIMEOUT"} timeout gtimeout /usr/bin/timeout; do
        found=$(command -v "$candidate" 2>/dev/null) || continue
        "$found" -k 1 1 true >/dev/null 2>&1 && { printf '%s' "$found"; return 0; }
    done
    return 1
}

case ${TIMEOUT:-} in
    /*) [ -x "$TIMEOUT" ] || TIMEOUT=$(find_timeout) || TIMEOUT='' ;;
    *)  TIMEOUT=$(find_timeout) || TIMEOUT='' ;;
esac
KILL_GRACE=${KILL_GRACE:-5}

timeout_table(){
    printf '%s\n' "$TA_TIMEOUT_DEFAULTS" |
        awk -v c="${COMPILE_TIMEOUT:-}" -v r="${TEST_TIMEOUT:-}" -v w="${WORKER_TIMEOUT:-}" -v s="${SCENARIO_TIMEOUT:-}" '
            { if (c != "") $2 = c; if (r != "") $3 = r
              if ($1 == "acats") { if (w != "") $4 = w } else if (s != "") $4 = s
              print }'
}

timeout_for(){
    local table suite compile run item found='' fallback=''
    if [ -n "${TA_TIMEOUTS:-}" ]; then table=$TA_TIMEOUTS; else table=$(timeout_table); fi
    while read -r suite compile run item; do
        [ "$suite" = "$1" ] && found="$compile $run $item"
        [ "$suite" = repro ] && fallback="$compile $run $item"
    done <<<"$table"
    set -- "$2" ${found:-$fallback}
    case $1 in
        compile) printf '%s\n' "$2" ;;
        run)     printf '%s\n' "$3" ;;
        item)    printf '%s\n' "$4" ;;
        all)     printf '%s %s %s\n' "$2" "$3" "$4" ;;
        *)       return 1 ;;
    esac
}

timed(){
    local secs=$1
    shift
    case $secs in
        compile) secs=${TA_T_COMPILE:-$(timeout_for "${TA_SUITE:-repro}" compile)} ;;
        run)     secs=${TA_T_RUN:-$(timeout_for "${TA_SUITE:-repro}" run)} ;;
        item)    secs=${TA_T_ITEM:-$(timeout_for "${TA_SUITE:-repro}" item)} ;;
    esac
    if [ -n "${TIMEOUT:-}" ]; then "$TIMEOUT" -k "${KILL_GRACE:-5}" "$secs" "$@"; else "$@"; fi
}

timed_out(){ [ "$1" -eq 124 ] || [ "$1" -eq 137 ]; }

find_compiler(){
    local candidate
    if [ -n "${ADA83:-}" ]; then
        candidate=$ADA83
        [ -x "$candidate" ] || [ ! -x "$candidate.exe" ] || candidate=$candidate.exe
        [ -f "$candidate" ] && [ -x "$candidate" ] || return 1
        abspath "$candidate"
        return 0
    fi
    for candidate in "$TA_ROOT/bin-$TA_HOST/ta" "$TA_ROOT/bin-$TA_HOST/ta.exe" \
                     "$TA_ROOT"/bin-*/ta "$TA_ROOT"/bin-*/ta.exe "$TA_ROOT/ta" "$TA_ROOT/ta.exe"; do
        [ -f "$candidate" ] && [ -x "$candidate" ] && { printf '%s\n' "$candidate"; return 0; }
    done
    return 1
}

acats_current(){
    [ -f "$TA_ROOT/acats/report.adb" ] || return 1
    [ -f "$TA_ROOT/tests.zip" ] || return 0
    [ "$(cat "$TA_ROOT/acats/.tests.zip.cksum" 2>/dev/null)" = "$(cksum < "$TA_ROOT/tests.zip")" ]
}

#  Every suite rides in tests.zip.  acats is never kept in the tree -- it is
#  unpacked, checksum-stamped and re-unpacked when the archive changes; the
#  rest are unpacked only when absent, so a working copy that keeps them in
#  place is left untouched while a lean checkout -- the public repo, CI --
#  fills them from the archive.
TESTS_ZIP_SUITES="extensions project acats-bonus debug repro fuzz gameplay"

corpus_complete(){
    acats_current || return 1
    local d
    for d in $TESTS_ZIP_SUITES; do [ -e "$TA_ROOT/$d" ] || return 1; done
    return 0
}

extract_all(){
    if command -v unzip >/dev/null; then unzip -qo "$1"
    elif command -v powershell.exe >/dev/null; then
        powershell.exe -NoProfile -Command \
            "Expand-Archive -LiteralPath '$1' -DestinationPath '.' -Force"
    else return 1
    fi
}

#  Whole-archive extract into a scratch dir, then install what the tree lacks:
#  acats whenever the checksum moved, the tracked suites only when missing.
#  A dir/* member glob is avoided -- some unzip builds do not recurse it.
ensure_corpus(){
    corpus_complete && return 0
    [ -f "$TA_ROOT/tests.zip" ] || { [ -f "$TA_ROOT/acats/report.adb" ] && return 0 || return 1; }
    local fresh rc=0 d
    fresh=$(mktemp -d "$TA_ROOT/.tests-unpack.XXXXXX") || return 1
    ( cd "$fresh" && extract_all "$TA_ROOT/tests.zip" ) || rc=$?
    if [ "$rc" = 0 ]; then
        if ! acats_current && [ -f "$fresh/acats/report.adb" ]; then
            cksum < "$TA_ROOT/tests.zip" > "$fresh/acats/.tests.zip.cksum"
            rm -rf "$TA_ROOT/acats" && mv "$fresh/acats" "$TA_ROOT/acats" || rc=1
        fi
        for d in $TESTS_ZIP_SUITES; do
            [ -e "$TA_ROOT/$d" ] && continue
            [ -d "$fresh/$d" ] && { mv "$fresh/$d" "$TA_ROOT/$d" || rc=1; }
        done
    fi
    rm -rf "$fresh"
    return "$rc"
}

provide_report(){
    local from=${TA_REPORT_DIR:-$TA_ROOT/acats}
    if [ -f "$from/report.adb" ] && [ -f "$from/report.ads" ]; then
        cp "$from/report.ads" "$from/report.adb" "$1/"
    else
        ( cd "$1" && unzip -o -q -j "$TA_ROOT/tests.zip" 'acats/report.*' ) 2>/dev/null
    fi
    [ -f "$1/report.adb" ]
}

crashed(){
    [ "$2" -ge 124 ] && return 0
    grep -v 'warning:' "$1" 2>/dev/null | grep -q -E "$TA_CRASH"
}

first_problem(){ grep -m1 -E 'error|internal|Segmentation|undefined' "$1" 2>/dev/null | cut -c1-160; }

last_line(){ tail -1 "$1" 2>/dev/null | cut -c1-"${2:-120}"; }

row(){
    local detail=${4:-}
    detail=${detail//$'\t'/ }
    detail=${detail//$'\r'/}
    detail=${detail//$'\n'/ }
    if [ -n "${TA_ROWS:-}" ]
    then printf '%s\t%s\t%s\t%s\n' "$1" "$2" "$3" "$detail" >> "$TA_ROWS"
    else printf '%s\t%s\t%s\t%s\n' "$1" "$2" "$3" "$detail"
    fi
}

judged(){ J_VERDICT=$1 J_DETAIL=${2:-}; }

headers(){
    awk -v key="$1" '
        /^--/            { if (sub("^-- " key ": *", "")) print; next }
        /^[[:space:]]*$/ { next }
                         { exit }' "$2"
}

ext_header(){ sed -n "s/^-- $2: //p" "$1" | tail -1; }

work_dir(){
    WORK=$(mktemp -d "${TMPDIR:-/tmp}/${1:-turboada}-XXXXXX") || return 1
    trap '[ "${KEEP_WORK:-0}" = 1 ] || rm -rf "$WORK"' EXIT
}

scenario(){
    HERE=$(cd -- "$(dirname -- "${BASH_SOURCE[1]}")" && pwd)
    TA_SUITE=${TA_SUITE:-repro}
    ADA83=$(find_compiler) || ADA83=${ADA83:-$TA_ROOT/bin-$TA_HOST/ta}
    export ADA83
    work_dir "${HERE##*/}" || exit 2
}

build_program(){
    local dir=$1 exe=$2 rc=0 first
    shift 2
    ( cd "$dir" && timed compile "$ADA83" "$@" -o "$exe" ) >"$dir/compile.log" 2>&1 || rc=$?
    first=$(first_problem "$dir/compile.log")
    if crashed "$dir/compile.log" "$rc"; then
        judged fail "CRASH: ${first:-compile exit $rc}"
        return 1
    fi
    if [ "$rc" -ne 0 ]; then
        judged fail "REJECTED: ${first:-compile exit $rc}"
        return 1
    fi
    PROGRAM=$dir/$exe
    [ ! -f "$PROGRAM.exe" ] || PROGRAM=$PROGRAM.exe
    [ -x "$PROGRAM" ] || { judged fail "NO_PROGRAM: the compile exited 0 and wrote no $exe"; return 1; }
    return 0
}

run_program(){
    local dir=$1
    shift
    RUN_RC=0
    ( cd "$dir" && { ulimit -s 8192 2>/dev/null || :; } && timed run "$@" ) >"$dir/run.log" 2>&1 || RUN_RC=$?
}

judge_output(){
    local log=$1/run.log line
    if timed_out "$RUN_RC"; then
        judged fail "TIMEOUT: the run exceeded ${TA_T_RUN:-its cap}s"
        return
    fi
    line=$(grep -m1 FAILED "$log" | cut -c1-160)
    [ -z "$line" ] || { judged fail "$line"; return; }
    [ "$RUN_RC" -eq 0 ] || { judged fail "RUNTIME: exit $RUN_RC: $(last_line "$log")"; return; }
    grep -q PASSED "$log" && { judged pass PASSED; return; }
    line=$(grep -m1 '^NOT APPLICABLE:' "$log" | cut -c1-80)
    [ -z "$line" ] || { judged skip "N/A: $line"; return; }
    judged fail "NO_REPORT: printed neither PASSED nor FAILED: $(last_line "$log")"
}

judge_build_run(){
    local dir=$1 exe=$2
    shift 2
    build_program "$dir" "$exe" "$@" || return 0
    run_program "$dir" "./${PROGRAM##*/}"
    judge_output "$dir"
}

marker_covered(){
    local alt alts
    awk -v lo=$(($2 - $3)) -v hi="$2" '$1 >= lo && $1 <= hi { found = 1 } END { exit !found }' "$1" && return 0
    [ -n "$4" ] && [ -f "$4" ] || return 1
    alts=$(sed 's/#.*//' "$4" | awk -v m="$2" '$1 == m { for (i = 2; i <= NF; i++) print $i }')
    [ -n "$alts" ] || return 1
    for alt in $alts; do
        awk -v a="$alt" '$1 == a { found = 1 } END { exit !found }' "$1" || return 1
    done
    return 0
}

judge_illegal(){
    local dir=$1 name=$2 alternates=$3 rc=0 first line span want=0 hit=0 got missed=''
    shift 3
    ( cd "$dir" && timed compile "$ADA83" "$@" -o "$name.bin" ) >"$dir/compile.log" 2>&1 || rc=$?
    first=$(first_problem "$dir/compile.log")
    if crashed "$dir/compile.log" "$rc"; then
        judged fail "CRASH: ${first:-compile exit $rc}"
        return
    fi
    [ "$rc" -ne 0 ] || { judged fail "ACCEPTED: compiled; expected rejection"; return; }
    grep -E "^$name\.ada:[0-9]+:[0-9]+: error:" "$dir/compile.log" | cut -d: -f2 | sort -n > "$dir/errlines"
    got=$(wc -l < "$dir/errlines")
    for line in $(grep -n -- '-- *ERROR:' "$dir/$name.ada" | cut -d: -f1); do
        want=$((want + 1))
        span=$(sed -n "${line}p" "$dir/$name.ada" | sed -n 's/.*ERROR:[^{]*{\([0-9][0-9]*\):.*/\1/p')
        if marker_covered "$dir/errlines" "$line" "${span:-0}" "$alternates"
        then hit=$((hit + 1))
        else missed="$missed $line"
        fi
    done
    if [ "$hit" -eq "$want" ] && [ "$got" -ge "$want" ]
    then judged pass "REJECTED: $want marked lines, all diagnosed"
    else judged fail "MISSED: $hit of $want marked lines diagnosed, $got errors; missed:${missed:- none}"
    fi
}

judge_headers(){
    local name=$1 here=$2 dir=$3 src=$2/$1.ada flags with inputs f rc=0 exe expect line
    cp "$src" "$dir/"
    flags=$(headers FLAGS "$src")
    with=$(headers WITH "$src")
    inputs=$name.ada
    for f in $with; do
        [ -f "$here/$f" ] || { judged fail "WITH names a missing file: $f"; return; }
        cp "$here/$f" "$dir/"
        inputs="$inputs $f"
    done
    expect=$(headers EXPECT "$src")
    local hosts
    hosts=$(headers HOSTS "$src")
    if [ -n "$hosts" ]; then
        case " $hosts " in
            *" $TA_HOST "*) ;;
            *) judged skip "N/A: needs one of: $hosts"; return ;;
        esac
    fi

    ( cd "$dir" && timed compile "$ADA83" $flags $inputs -o "$name" ) >"$dir/compile.log" 2>&1 || rc=$?
    if crashed "$dir/compile.log" "$rc"; then
        judged fail "CRASH: compile exit $rc: $(first_problem "$dir/compile.log")"
        return
    fi

    if printf '%s\n' "$expect" | grep -q '^error '; then
        if [ "$rc" -eq 0 ]; then
            judged fail "compiled, but expected: $(printf '%s\n' "$expect" | grep '^error ' | head -1)"
            return
        fi
        while IFS= read -r line; do
            [ -n "$line" ] || continue
            grep -F -- "$line" "$dir/compile.log" | grep -q 'error:' ||
                { judged fail "no error line contains: $line"; return; }
        done < <(printf '%s\n' "$expect" | sed -n 's/^error //p')
        while IFS= read -r line; do
            [ -n "$line" ] || continue
            grep -F -- "$line" "$dir/compile.log" | grep -q 'note:' ||
                { judged fail "no note line contains: $line"; return; }
        done < <(printf '%s\n' "$expect" | sed -n 's/^note //p')
        judged pass ''
        return
    fi

    if [ "$rc" -ne 0 ]; then
        judged fail "compile exit $rc: $(grep -m1 -E 'error|undefined reference' "$dir/compile.log" | cut -c1-160)"
        return
    fi
    while IFS= read -r line; do
        [ -n "$line" ] || continue
        grep -F -- "$line" "$dir/compile.log" | grep -q 'warning:' ||
            { judged fail "no warning line contains: $line"; return; }
    done < <(printf '%s\n' "$expect" | sed -n 's/^warning //p')
    if printf '%s\n' "$expect" | grep -qx 'no-warning'; then
        line=$(grep -m1 'warning:' "$dir/compile.log")
        [ -z "$line" ] || { judged fail "expected no warning, got: $(printf '%s' "$line" | cut -c1-140)"; return; }
    fi

    exe=$dir/$name
    [ -f "$exe.exe" ] && exe=$exe.exe
    run_program "$dir" "$exe"

    line=$(printf '%s\n' "$expect" | sed -n 's/^raise //p' | head -1)
    if [ -n "$line" ]; then
        [ "$RUN_RC" -ne 0 ] || { judged fail "ran to exit 0, but expected to raise $line"; return; }
        grep -q "Unhandled exception: $line" "$dir/run.log" ||
            { judged fail "expected $line, got: $(last_line "$dir/run.log")"; return; }
    else
        [ "$RUN_RC" -eq 0 ] || { judged fail "run exit $RUN_RC: $(last_line "$dir/run.log")"; return; }
        line=$(grep -m1 '^NOT APPLICABLE:' "$dir/run.log" | cut -c1-80)
        [ -z "$line" ] || { judged skip "N/A: $line"; return; }
        line=$(grep -m1 -E '^(FAIL|WRONG)|WRONG$' "$dir/run.log")
        [ -z "$line" ] || { judged fail "$(printf '%s' "$line" | cut -c1-140)"; return; }
    fi
    while IFS= read -r line; do
        [ -n "$line" ] || continue
        grep -qxF -- "$line" "$dir/run.log" || { judged fail "output has no line: $line"; return; }
    done < <(printf '%s\n' "$expect" | sed -n 's/^print //p')
    judged pass ''
}

judge_extension(){
    local name=$1 dir=$ITEM_DIR src=$TA_ROOT/extensions/$1.ada linked symbol symbol_not symbols args nm_tool
    local -a fragments=() argv=()
    linked=$(ext_header "$src" LINK)
    if [ -n "$linked" ]; then
        if ( cd "$dir" && timed compile "$ADA83" --ir "$TA_ROOT/extensions/$linked" -o "$dir/linked.ll" ) \
               >"$dir/support.log" 2>&1; then
            fragments+=("$dir/linked.ll")
        else
            judged fail "support unit $linked: $(tail -2 "$dir/support.log" | tr '\n' ' ')"
            return
        fi
    fi
    build_program "$dir" "$name" "$src" ${fragments[@]+"${fragments[@]}"} || return 0

    symbol=$(ext_header "$src" SYMBOL)
    symbol_not=$(ext_header "$src" SYMBOL-NOT)
    if [ -n "$symbol$symbol_not" ]; then
        nm_tool=$(command -v nm || command -v llvm-nm || true)
        [ -n "$nm_tool" ] || { judged skip "symbol check needs nm, which is not on PATH"; return; }
        symbols=$("$nm_tool" "$PROGRAM" 2>/dev/null) || symbols=""
        grep -qE '[[:alnum:]]' <<<"$symbols" ||
            { judged skip "symbol check needs an unstripped binary; the linker kept no symbol table"; return; }
        if [ -n "$symbol" ] && ! grep -qE "[[:space:]]_?$symbol\$" <<<"$symbols"; then
            judged fail "symbol $symbol missing from the executable"
            return
        fi
        if [ -n "$symbol_not" ] && grep -qE "[[:space:]]_?$symbol_not\$" <<<"$symbols"; then
            judged fail "symbol $symbol_not present in the executable"
            return
        fi
    fi

    args=$(ext_header "$src" ARGS)
    [ -z "$args" ] || eval "argv=($args)"
    run_program "$dir" "$PROGRAM" ${argv[@]+"${argv[@]}"}
    judge_output "$dir"
}

judge_project(){
    local kind=${1%%/*} case=${1#*/} dir=$ITEM_DIR cases project expected cwd status=0 exe run_status=0 tag=exit
    cases=$TA_ROOT/project/$kind
    if [ -f "$cases/$case.gpr" ]; then project=$case.gpr; else project=$case.gpj; fi
    expected=$cases/$case.expected
    if [ ! -f "$expected" ] && [ "${TA_ACCEPT:-0}" != 1 ]; then
        judged fail "no $case.expected; --accept writes one"
        return
    fi
    set -- -P "$project"
    [ "$kind" = build ] || set -- "$@" -n
    if [ -f "$cases/$case.args" ]; then
        set -- "$@" $(cat "$cases/$case.args")
    fi
    cwd=$cases
    if [ "$kind" = build ]; then
        cp -R "$cases/." "$dir/cases" || { judged fail "HARNESS: could not copy $kind/ to a scratch directory"; return; }
        cwd=$dir/cases tag='build exit'
    fi
    ( cd "$cwd" && { [ "$kind" != build ] || unset CC CXX; } && timed compile "$ADA83" "$@" ) \
        >"$dir/out" 2>"$dir/err" || status=$?
    if grep -q "the .gpr reader is not built yet" "$dir/err"; then
        judged skip "PENDING: the .gpr reader is not built yet"
        return
    fi
    { cat "$dir/out" "$dir/err"; echo "$tag $status"; } > "$dir/actual"
    if [ "$kind" = build ] && [ "$status" -eq 0 ]; then
        exe=$(sed -n "s/^Linked '\(.*\)'\$/\1/p" "$dir/err" | head -1)
        if [ -z "$exe" ]; then
            echo "no main linked" >> "$dir/actual"
        else
            case $exe in /*) ;; *) exe=./$exe ;; esac
            ( cd "$cwd" && timed run "$exe" ) >"$dir/run" 2>&1 || run_status=$?
            { cat "$dir/run"; echo "exit $run_status"; } >> "$dir/actual"
        fi
    fi
    if [ "$TA_HOST" = windows ]; then
        sed -i "s/^\(Linked '.*\)\.exe'\$/\1'/" "$dir/actual"
    fi
    if [ "${TA_ACCEPT:-0}" = 1 ]; then
        if [ "$kind" = build ] && [ -f "$cases/$case.known" ]; then
            judged skip "KNOWN: kept (a .known case's expected file is the proposal)"
        else
            cp "$dir/actual" "$expected"
            judged pass "ACCEPTED: wrote $case.expected"
        fi
        return
    fi
    if diff -u "$expected" "$dir/actual" > "$dir/diff.log"; then
        if [ -f "$cases/$case.known" ]
        then judged fail "passes now; delete $case.known and the entry it cites"
        else judged pass ''
        fi
    elif [ -f "$cases/$case.known" ]; then
        judged skip "KNOWN: $(head -1 "$cases/$case.known")"
    else
        judged fail "differs from $case.expected: $(grep -m1 -E '^[-+][^-+]' "$dir/diff.log" | cut -c1-140)"
    fi
}

judge_scenario(){
    local log=$ITEM_DIR/scenario.log rc=0
    mkdir -p "$ITEM_DIR/tmp"
    ( cd "$1" && ADA83=$ADA83 TMPDIR=$ITEM_DIR/tmp timed item bash ./run.sh ) >"$log" 2>&1 || rc=$?
    if [ "$rc" -eq 0 ]; then
        judged pass ''
    elif [ "$rc" -eq 77 ]; then
        judged skip "N/A: $(last_line "$log" 140)"
    elif timed_out "$rc"; then
        judged fail "TIMEOUT: run.sh exceeded ${TA_T_ITEM:-its cap}s: $(last_line "$log" 140)"
    else
        judged fail "run.sh exit $rc: $(last_line "$log" 140)"
    fi
}

ir_assertions(){
    local dir=$1 name=$2 ir=$3 kind text
    shift 3
    [ -f "$ir" ] || return 0
    ( cd "$dir" && timed compile "$ADA83" --ir "$name.ada" "$@" report.adb ) >"$dir/ir.log" 2>&1
    [ -s "$dir/$name.ll" ] || { judged fail "IR: no $name.ll produced"; return; }
    while read -r kind text; do
        case $kind in
            present) grep -qF -- "$text" "$dir/$name.ll" || { judged fail "IR: '$text' missing"; return; } ;;
            absent)  ! grep -qF -- "$text" "$dir/$name.ll" || { judged fail "IR: '$text' present"; return; } ;;
        esac
    done < "$ir"
}

fuzz_class(){
    local class
    class=$(sed -n '1s/^-- *CLASS: *\([ABCabc]\).*/\1/p' "$1" | tr abc ABC)
    [ -n "$class" ] || class=$(basename -- "$1" | cut -c1 | tr abc ABC)
    printf '%s' "$class"
}

item_acats(){
    local out class verdict name detail
    out=$(run_one_timed "acats/$1.ada") || true
    [ -n "$out" ] || return 0
    read -r class verdict name detail <<<"$out"
    row acats "$name" "$verdict" "$detail"
}

item_fuzz(){
    local name=$1 base=${1##*/} dir=$ITEM_DIR
    cp "$TA_ROOT/fuzz/$name.ada" "$dir/" && provide_report "$dir" || { row fuzz "$name" fail "HARNESS: cannot stage the test"; return; }
    if [ "$(fuzz_class "$dir/$base.ada")" = B ]
    then judge_illegal "$dir" "$base" '' "$base.ada"
    else judge_build_run "$dir" "$base.bin" "$base.ada"
    fi
    row fuzz "$name" "$J_VERDICT" "$J_DETAIL"
}

item_bonus(){
    local name=$1 slug=${1%%/*} base=${1##*/} dir=$ITEM_DIR
    local -a extra=()
    cp "$TA_ROOT/acats-bonus/$name.ada" "$dir/" && provide_report "$dir" || { row bonus "$name" fail "HARNESS: cannot stage the test"; return; }
    [ ! -f "$TA_ROOT/acats-bonus/support/impdef.ada" ] || cp "$TA_ROOT/acats-bonus/support/impdef.ada" "$dir/"
    grep -qi '^[[:space:]]*with[[:space:]][[:space:]]*ImpDef' "$dir/$base.ada" && extra=(impdef.ada)
    case $base in
        b*) judge_illegal "$dir" "$base" "$TA_ROOT/acats-bonus/$slug/$base.errlines" \
                "$base.ada" ${extra[@]+"${extra[@]}"} report.adb ;;
        *)  judge_build_run "$dir" "$base.bin" "$base.ada" ${extra[@]+"${extra[@]}"} report.adb
            [ "$J_VERDICT" != pass ] ||
                ir_assertions "$dir" "$base" "$TA_ROOT/acats-bonus/$slug/$base.ir" ${extra[@]+"${extra[@]}"} ;;
    esac
    row bonus "$name" "$J_VERDICT" "$J_DETAIL"
}

item_repro(){
    if [ -f "$TA_ROOT/repro/$1/run.sh" ]
    then judge_scenario "$TA_ROOT/repro/$1"
    else judge_headers "$1" "$TA_ROOT/repro" "$ITEM_DIR"
    fi
    row repro "$1" "$J_VERDICT" "$J_DETAIL"
}

item_extensions(){
    judge_extension "$1"
    row extensions "$1" "$J_VERDICT" "$J_DETAIL"
}

item_project(){
    judge_project "$1"
    row project "$1" "$J_VERDICT" "$J_DETAIL"
}

item_gameplay(){
    local rc=0
    if [ -f "$TA_ROOT/gameplay/$1/run.sh" ]; then
        judge_scenario "$TA_ROOT/gameplay/$1"
        row gameplay "$1" "$J_VERDICT" "$J_DETAIL"
        return
    fi
    [ -f "$TA_ROOT/craft" ] || { row gameplay "$1" skip "craft is not in the tree"; return; }
    command -v python3 >/dev/null 2>&1 || { row gameplay "$1" skip "python3 is not on PATH"; return; }
    ( cd "$TA_ROOT" && timed item ./craft test item "$1" --work "$ITEM_DIR" ) \
        >"$ITEM_DIR/harness.log" 2>&1 || rc=$?
    if timed_out "$rc"; then
        row gameplay "$1" fail "TIMEOUT: the item exceeded ${TA_T_ITEM:-its cap}s"
    elif [ "$rc" -ne 0 ] && [ ! -s "$TA_ROWS" ]; then
        row gameplay "$1" fail "HARNESS: craft test exit $rc: $(last_line "$ITEM_DIR/harness.log" 140)"
    fi
}

item_debug(){
    local rc=0
    local -a accept=()
    [ "${TA_ACCEPT:-0}" != 1 ] || accept=(--accept)
    ( cd "$ITEM_DIR" && TMPDIR=$ITEM_DIR timed item bash "$TA_ROOT/debug/run.sh" ${accept[@]+"${accept[@]}"} "$1" ) || rc=$?
    if timed_out "$rc"; then
        row debug "$1-session" fail "TIMEOUT: the session exceeded ${TA_T_ITEM:-its cap}s"
    elif [ "$rc" -ne 0 ]; then
        row debug "$1-session" fail "debug/run.sh exit $rc"
    fi
}

save_logs(){
    local suite=$1 dir=$2 name target f
    while IFS=$'\t' read -r _ name _ _; do
        target=$TA_LOGS/$suite/$name.log
        mkdir -p "$(dirname -- "$target")"
        for f in "$dir.log" "$dir"/*.log; do
            [ -s "$f" ] || continue
            printf '==> %s <==\n' "${f##*/}"
            tail -n 400 "$f"
        done > "$target"
    done < <(awk -F'\t' '$3 == "fail"' "$dir.rows")
}

run_item(){
    local suite=${1%%:*} name=${1#*:} started rc=0 rows
    started=$(now_ms)
    ITEM_DIR=$TA_WORK/$suite/$name TA_SUITE=$suite TA_ROWS=$TA_WORK/$suite/$name.rows
    export ITEM_DIR TA_SUITE TA_ROWS
    read -r TA_T_COMPILE TA_T_RUN TA_T_ITEM <<<"$(timeout_for "$suite" all)"
    export TA_T_COMPILE TA_T_RUN TA_T_ITEM
    rm -rf "$ITEM_DIR"
    mkdir -p "$ITEM_DIR"
    : > "$TA_ROWS"
    if declare -F "item_$suite" >/dev/null
    then "item_$suite" "$name" >"$ITEM_DIR.log" 2>&1 || rc=$?
    else row "$suite" "$name" fail "HARNESS: no suite named $suite"
    fi
    [ -s "$TA_ROWS" ] || [ "$suite" = acats ] ||
        row "$suite" "$name" fail "HARNESS: no verdict (the item exited $rc)"
    rows=$(<"$TA_ROWS")
    [ -z "$rows" ] || printf '%s\n' "$rows"
    [ "$suite" = acats ] || [ -z "${TA_LOGS:-}" ] || save_logs "$suite" "$ITEM_DIR"
    [ "${KEEP_WORK:-0}" = 1 ] || rm -rf "$ITEM_DIR" "$ITEM_DIR.rows" "$ITEM_DIR.log"
    [ -z "${TA_PROGRESS:-}" ] || printf '%s\t%s/%s\n' "$(( $(now_ms) - started ))" "$suite" "$name" >> "$TA_PROGRESS"
    return 0
}


#  Sourced, not run: the caller wants only the library above, not the harness.
[ "${BASH_SOURCE[0]}" = "$0" ] || return 0

[ -z "${ADA83:-}" ] || ADA83=$(abspath "$ADA83")
[ -z "${BASELINE:-}" ] || BASELINE=$(abspath "$BASELINE")
[ -z "${TSV_DIR:-}" ] || TSV_DIR=$(abspath "$TSV_DIR")
cd "$HERE"

NO_ANIMATE=${NO_ANIMATE:-0} NO_COLOUR=${NO_COLOUR:-0} KEEP_WORK=${KEEP_WORK:-0}
SLOWEST=${SLOWEST:-12}

animated=0; [ -t 2 ] && [ "$NO_ANIMATE" != 1 ] && animated=1
if [ $animated = 1 ] && exec 9>/dev/tty 2>/dev/null; then :; else exec 9>/dev/null; animated=0; fi
if [ -t 1 ] && [ "$NO_COLOUR" != 1 ]
then BOLD=$'\033[1m' DIM=$'\033[2m' GOOD=$'\033[32m' BAD=$'\033[31m' OFF=$'\033[0m'
else BOLD='' DIM='' GOOD='' BAD='' OFF=''
fi

hide_cursor(){ [ $animated = 1 ] && printf '\033[?25l' >&9; return 0; }
show_cursor(){ [ $animated = 1 ] && printf '\033[?25h' >&9; return 0; }

BLOCKS=("" "▏" "▎" "▍" "▌" "▋" "▊" "▉")

bar(){
    local fill=$1 width=$2 out='' whole part i
    whole=${fill%.*}
    part=$(awk -v f="$fill" -v w="$whole" 'BEGIN{printf "%d",(f-w)*8}')
    for ((i = 0; i < whole && i < width; i++)); do out+='█'; done
    [ "$whole" -lt "$width" ] && [ "$part" -gt 0 ] && { out+=${BLOCKS[$part]}; whole=$((whole+1)); }
    for ((i = whole; i < width; i++)); do out+='·'; done
    printf '%s' "$out"
}

scaled(){ awk -v v="$1" -v m="$2" -v w="$3" 'BEGIN{printf "%.3f",(m>0?v/m:0)*w}'; }

progress(){
    [ $animated = 1 ] || return 0
    printf '\r\033[2K  %s%s%s %3d%%  %s%s%s' "$DIM" "$(bar "$(scaled "$1" "$2" 32)" 32)" "$OFF" \
        "$(awk -v d="$1" -v t="$2" 'BEGIN{printf "%d",(t>0?d*100/t:0)}')" "$DIM" "$3" "$OFF" >&9
}

clear_line(){ [ $animated = 1 ] && printf '\r\033[2K' >&9; return 0; }

PULSE=''
PULSE_FRAMES=('◦' '◌' '◍' '◎')
pulse(){
    [ $animated = 1 ] || return 0
    ( i=0; while :; do
        printf '\r\033[2K  %s%s %s%s' "$DIM" "${PULSE_FRAMES[(i/2)%4]}" "$1" "$OFF" >&9
        i=$((i+1)); sleep 0.12
      done ) & PULSE=$!
}
reap(){ kill "$1" 2>/dev/null || true; wait "$1" 2>/dev/null || true; }

pulse_stop(){ [ -n "$PULSE" ] && { reap "$PULSE"; PULSE=''; clear_line; }; return 0; }

heading(){
    printf '\n  %s%s%s\n' "$BOLD" "$1" "$OFF"
    [ $# -gt 1 ] && printf '  %s%s%s\n' "$DIM" "$2" "$OFF"
    printf '\n'
}
rule(){
    local line='' i
    for ((i = 0; i < ${1:-64}; i++)); do line+='─'; done
    printf '  %s%s%s\n' "$DIM" "$line" "$OFF"
}
die(){ pulse_stop; show_cursor; echo "$SELF: $*" >&2; exit 1; }

pct(){ ((${2:-0}>0)) && printf %d "$((100*$1/$2))" || printf 0; }

pm(){ case $1 in x) printf '%14s' 'x' ;; *) printf '%8s ±%-5s' "$1" "$2" ;; esac; }
spread(){ case $1 in x|'') printf '%6s' '' ;; *) awk -v r="$1" 'BEGIN{printf (r>=5)?"  !%3.0f%%":"  ±%3.0f%%", r}' ;; esac; }
ratio(){ case "$1$2" in *x*) printf '%7s' '-' ;; *) awk -v a="$1" -v b="$2" 'BEGIN{if(b+0==0)printf "%7s","-";else printf "%7.2f",a/b}' ;; esac; }
change(){ case "$1$2" in *x*) printf '%9s' '-' ;; *) awk -v n="$1" -v o="$2" 'BEGIN{if(o+0==0)printf "%9s","-";else printf "%+8.1f%%",(n-o)*100/o}' ;; esac; }

verdict(){
    case "$1$2" in *x*) return ;; esac
    local w; w=$(awk -v n="$1" -v o="$2" -v a="$3" -v b="$4" 'BEGIN{
        c=(n-o)*100/o; e=(a>b?a:b); print (c<-e)?"faster":((c>e)?"slower":"level") }')
    case $w in faster) printf '%sfaster%s' "$GOOD" "$OFF" ;;
               slower) printf '%sslower%s' "$BAD" "$OFF" ;;
               *)      printf '%slevel%s'  "$DIM" "$OFF" ;; esac
}

speedup(){ awk -v a="$1" -v g="$2" 'BEGIN{
    if (a+0<=0||g+0<=0) exit
    if (g>a) printf "%.1fx faster", g/a; else if (a>g) printf "%.1fx slower", a/g; else printf "level" }'; }

stats(){
    awk '{ v[++n] = $1 + 0 }
         END{ if (n == 0) { printf "x x 0"; exit }
              for (i = 1; i <= n; i++)
                  for (j = i + 1; j <= n; j++)
                      if (v[j] < v[i]) { h = v[i]; v[i] = v[j]; v[j] = h }
              med = (n % 2) ? v[(n + 1) / 2] : (v[n / 2] + v[n / 2 + 1]) / 2
              for (i = 1; i <= n; i++) { d[i] = v[i] - med; if (d[i] < 0) d[i] = -d[i] }
              for (i = 1; i <= n; i++)
                  for (j = i + 1; j <= n; j++)
                      if (d[j] < d[i]) { h = d[i]; d[i] = d[j]; d[j] = h }
              mad = (n % 2) ? d[(n + 1) / 2] : (d[n / 2] + d[n / 2 + 1]) / 2
              printf "%.3f %.3f %d", med, mad, n }' "$1"
}

result_row(){
    local label=$1 passed=$2 failed=$3 skipped=$4 total=$5 weight=${6:-} rate colour
    rate=$(pct "$passed" "$total")
    if ((passed == total)); then colour=$GOOD; else colour=$BAD; fi
    printf '  %s%-22s %6d %6d %6d %6d%s  %s%s%s %3s%%\n' "$weight" "$label" \
        "$passed" "$failed" "$skipped" "$total" "$OFF" \
        "$colour" "$(bar "$(scaled "$rate" 100 20)" 20)" "$OFF" "$rate"
}

loadavg(){
    if [ -r /proc/loadavg ]
    then cut -d' ' -f1 </proc/loadavg
    else uptime 2>/dev/null | sed 's/.*average[s]*: *//;s/[, ].*//'; fi
}

LOAD_PEAK=0 LOAD_LAST=0 LOAD_WATCHED=0 LOAD_SAMPLES=''
load_watch_start(){
    [ -n "$LOAD_SAMPLES" ] || return 0
    ( while :; do loadavg; sleep 2; done > "$LOAD_SAMPLES" 2>/dev/null ) &
    LOAD_WATCH=$!
}
load_watch_stop(){
    local pk
    LOAD_LAST=0
    [ -n "${LOAD_WATCH:-}" ] || return 0
    reap "$LOAD_WATCH"; LOAD_WATCH=''
    pk=$(sort -g "$LOAD_SAMPLES" 2>/dev/null | tail -1); [ -n "$pk" ] || pk=0
    LOAD_LAST=$pk LOAD_WATCHED=1
    awk -v p="$pk" -v m="$LOAD_PEAK" 'BEGIN{exit !(p+0 > m+0)}' && LOAD_PEAK=$pk
    return 0
}

cleanup(){
    pulse_stop
    show_cursor
    if [ -n "${TA_WORK:-}" ]; then
        if [ "$KEEP_WORK" = 1 ]
        then printf '  %swork kept in %s%s\n' "$DIM" "$TA_WORK" "$OFF" >&2
        else rm -rf "$TA_WORK"
        fi
    fi
    [ -n "${ITEMS:-}" ] && rm -f "$ITEMS"
    [ -n "${BENCH_WORK:-}" ] && [ "$KEEP_WORK" != 1 ] && rm -rf "$BENCH_WORK"
    return 0
}
trap cleanup EXIT
trap 'show_cursor; exit 130' INT

elapsed(){
    local ms=$(( $(now_ms) - START_MS ))
    printf '%d.%03d' $((ms / 1000)) $((ms % 1000))
}

build_compiler(){
    if [[ $TA_HOST == windows ]] && [[ -f make.bat ]] && command -v cmd.exe >/dev/null; then
        timed "$BUILD_TIMEOUT" cmd.exe //c .\\make.bat
    elif command -v make >/dev/null; then
        timed "$BUILD_TIMEOUT" make -s ta
    else
        echo "$SELF: no 'make' to build the compiler with" >&2
        echo "         Windows: run make.bat, then start this script again" >&2
        return 1
    fi
}

gather_files(){
    local f=$1 n=$2
    COMPILE_FILES=("$f")
    if [[ $n =~ ^(.*[a-z])([0-9])m$ ]]; then
        local base=${BASH_REMATCH[1]} g
        local -a family=()
        for g in "acats/$base"[0-9].ada "acats/$base"[0-9]m.ada "acats/$base"[a-z].ada; do
            [[ -f $g ]] && family+=("$g")
        done
        if ((${#family[@]} > 1)); then
            mapfile -t family < <(printf '%s\n' "${family[@]}" | sort)
            COMPILE_FILES=("${family[@]}")
        fi
    fi
}

compile_set(){
    local n=$1 part pn
    local lib=$RESULTS_DIR/$n.lib
    mkdir -p "$lib"
    MAIN_LL=""
    LINK_FRAGMENTS=()
    COMPILE_FAILED=""
    for part in "${COMPILE_FILES[@]}"; do
        pn=$(basename "$part" .ada)
        if ! timed "$COMPILE_TIMEOUT" "$ADA83" -ada83 --ir "$part" -o "$lib/$pn.ll" >/dev/null 2>"$LOGS_DIR/$n.err"; then
            if [[ $pn == "$n" ]]; then
                COMPILE_FAILED=$pn
                return 1
            fi
            continue
        fi
        if [[ $pn == "$n" ]]; then
            MAIN_LL=$lib/$pn.ll
        else
            LINK_FRAGMENTS+=("$lib/$pn.ll")
        fi
    done
    [[ -n $MAIN_LL ]] || MAIN_LL=$lib/$(basename "${COMPILE_FILES[-1]}" .ada).ll

    if ((${#LINK_FRAGMENTS[@]})); then
        local kept=() frag unit i p anc u_current
        local -a frag_units=() units=()
        local -A last_provider=()
        for ((i = 0; i < ${#LINK_FRAGMENTS[@]}; i++)); do
            frag=${LINK_FRAGMENTS[i]}
            frag_units[i]=$(grep '^U ' "${frag%.ll}.ali" 2>/dev/null \
                            | awk '{print $2}' | sed 's/%.*//' | tr '[:upper:]' '[:lower:]')
            mapfile -t units <<<"${frag_units[i]}"
            for unit in "${units[@]}"; do [[ -n $unit ]] && last_provider[$unit]=$i; done
        done
        for ((i = 0; i < ${#LINK_FRAGMENTS[@]}; i++)); do
            frag=${LINK_FRAGMENTS[i]}
            local in_main=0 current=0
            [[ -n ${frag_units[i]//[$' \n']} ]] || current=1
            mapfile -t units <<<"${frag_units[i]}"
            for unit in "${units[@]}"; do
                [[ -n $unit ]] || continue
                u_current=1
                anc=$unit
                while :; do
                    p=${last_provider[$anc]:-$i}
                    ((p > i)) && u_current=0
                    [[ $anc == *.* ]] || break
                    anc=${anc%.*}
                done
                ((u_current)) && current=1
                grep -Eq "^define.*@(_ada_)?${unit//./__}(\(|__)" "$MAIN_LL" && in_main=1
            done
            ((in_main)) && continue
            ((current)) || continue
            kept+=("$frag")
        done
        LINK_FRAGMENTS=(${kept[@]+"${kept[@]}"})
    fi

    BIND_FAILED=""
    if ! timed "$COMPILE_TIMEOUT" "$ADA83" --bind "$lib" "$n" 2>"$LOGS_DIR/$n.bind"; then
        BIND_FAILED=$n
    fi
}

run_in_lib(){
    local secs=$1 n=$2; shift 2
    ( cd "$RESULTS_DIR/$n.lib" 2>/dev/null || exit 127
      timed "$secs" "$ROOT/$PROGRAM" "$@" )
}

link_program(){
    local n=$1 rc=0
    PROGRAM=$RESULTS_DIR/$n.bin
    timed "$LINK_TIMEOUT" "$ADA83" "$OPT" "$MAIN_LL" \
        ${LINK_FRAGMENTS[@]+"${LINK_FRAGMENTS[@]}"} "$REPORT_LL" \
        -o "$PROGRAM" >/dev/null 2>"$LOGS_DIR/$n.link" || rc=$?
    [[ ! -x $PROGRAM.exe ]] || PROGRAM=$PROGRAM.exe
    case $rc in
        0)       LINK_STATUS=ok ;;
        124|137) LINK_STATUS=timeout ;;
        *)       LINK_STATUS=unresolved ;;
    esac
    return $rc
}

report_link_failure(){
    local q=$1 n=$2
    [[ $LINK_STATUS == timeout ]] \
        && echo "$q fail $n TIMEOUT:link_exceeded_${LINK_TIMEOUT}s" \
        || echo "$q skip $n BIND:unresolved_symbols"
}

run_continuity_creators(){
    local reader=$1 lib=$2 self=${1,,} c
    for c in $(grep -oiE 'legal_file_name[ ]*\([^)]*"ce[0-9a-z]+"' "acats/$reader.ada" 2>/dev/null \
               | grep -oiE '"ce[0-9a-z]+"' | tr -d '"' | tr '[:upper:]' '[:lower:]' | sort -u); do
        [[ $c == "$self" || ! -f acats/$c.ada ]] && continue
        timed "$COMPILE_TIMEOUT" "$ADA83" -ada83 --ir "acats/$c.ada" -o "$lib/$c.ll" \
            >/dev/null 2>&1 || continue
        timed "$LINK_TIMEOUT" "$ADA83" "$OPT" "$lib/$c.ll" "$REPORT_LL" \
            -o "$lib/$c.bin" >/dev/null 2>&1 || continue
        ( cd "$lib" && timed "$TEST_TIMEOUT" "./$c.bin" ) >/dev/null 2>&1 || true
    done
}

run_one(){
    local f=$1 n q=${1##*/}
    n=$(basename "$1" .ada); q=${q:0:1}
    [[ $n =~ [0-9]$ && ! $n =~ m$ ]] && return
    if [[ $n =~ ^(.*[a-z])[a-z]$ ]]; then
        compgen -G "acats/${BASH_REMATCH[1]}[0-9]m.ada" >/dev/null && return
    fi
    [[ $n == *_* ]] && return
    local COMPILE_FILES MAIN_LL LINK_FRAGMENTS COMPILE_FAILED BIND_FAILED PROGRAM
    gather_files "$f" "$n"

    case ${q,,} in
    c)
        if ! compile_set "$n"; then
            echo "c skip $n COMPILE[$COMPILE_FAILED]:$(head -1 "$LOGS_DIR/$n.err" 2>/dev/null|cut -c1-50)"
            return
        fi
        if [[ -n $BIND_FAILED ]]; then
            echo "c fail $n OBSOLETE:$(head -1 "$LOGS_DIR/$n.bind" 2>/dev/null|cut -c1-50)"
            return
        fi
        if ! link_program "$n"; then
            report_link_failure c "$n"
            return
        fi
        run_continuity_creators "$n" "$RESULTS_DIR/$n.lib"
        local rc=0
        run_in_lib "$TEST_TIMEOUT" "$n" > "$LOGS_DIR/$n.out" 2>&1 || rc=$?
        if ((rc==124 || rc==137)); then
            echo "c fail $n TIMEOUT:exceeded_${TEST_TIMEOUT}s"
            return
        fi
        if ((rc==0)); then
            if grep -q PASSED "$LOGS_DIR/$n.out" 2>/dev/null; then
                echo "c pass $n PASSED"
            elif grep -q '^NOT APPLICABLE:' "$LOGS_DIR/$n.out" 2>/dev/null; then
                echo "c skip $n N/A:$(grep -o '^NOT APPLICABLE:.*' "$LOGS_DIR/$n.out"|head -1|cut -c1-40)"
            elif grep -q FAILED "$LOGS_DIR/$n.out" 2>/dev/null; then
                echo "c fail $n FAILED:$(grep FAILED "$LOGS_DIR/$n.out"|head -1|cut -c1-50)"
            else
                echo "c fail $n NO_REPORT:no_PASSED/FAILED_in_output"
            fi
        else
            echo "c fail $n RUNTIME:exit_${rc}"
        fi
        ;;
    a)
        if ! compile_set "$n"; then
            echo "a skip $n COMPILE[$COMPILE_FAILED]:$(head -1 "$LOGS_DIR/$n.err" 2>/dev/null|cut -c1-50)"; return; fi
        if [[ -n $BIND_FAILED ]]; then
            echo "a fail $n OBSOLETE:$(head -1 "$LOGS_DIR/$n.bind" 2>/dev/null|cut -c1-50)"; return; fi
        if ! link_program "$n"; then
            report_link_failure a "$n"
            return; fi
        local rc=0
        run_in_lib "$TEST_TIMEOUT" "$n" > "$LOGS_DIR/$n.out" 2>&1 || rc=$?
        if ((rc==124 || rc==137)); then
            echo "a fail $n TIMEOUT:exceeded_${TEST_TIMEOUT}s"
        elif ((rc==0)); then
            echo "a pass $n PASSED"
        else
            echo "a fail $n FAILED:exit_$rc"
        fi
        ;;
    b)
        local -a expected=() actual=()
        local part pn i hits=0 rejected="" e v l m _
        local lib=$RESULTS_DIR/$n.lib
        mkdir -p "$lib"
        for part in "${COMPILE_FILES[@]}"; do
            pn=$(basename "$part")
            i=0
            while IFS= read -r l; do
                ((++i))
                if [[ $l =~ --[[:space:]]+ERROR[[:space:]]*[:\;.] ]]; then
                    if [[ $l =~ ^[[:space:]]*-- ]]; then
                        expected+=("$pn:$i:3")
                    else
                        expected+=("$pn:$i:1")
                    fi
                fi
            done < "$part"
            if timed "$COMPILE_TIMEOUT" "$ADA83" -ada83 --ir "$part" -o "$lib/${pn%.ada}.ll" \
                 >/dev/null 2>"$LOGS_DIR/$n.$pn.err"; then :; else
                rejected=yes
            fi
            while IFS=: read -r file m _; do
                actual+=("$(basename "$file"):$m")
            done < <(grep "^[^:]*:[0-9]*:[0-9]*: " "$LOGS_DIR/$n.$pn.err")
        done
        if [[ -z $rejected ]]; then
            echo "b fail $n WRONG_ACCEPT:compiled_when_should_reject"
        else
            local ef el ew vf vl xe p
            for e in ${expected[@]+"${expected[@]}"}; do
                ew=${e##*:}; ef=${e%%:*}
                el=${e#*:}; el=${el%%:*}
                for v in ${actual[@]+"${actual[@]}"}; do
                    vf=${v%:*}; vl=${v##*:}
                    [[ $vf == "$ef" ]] && ((vl>=el-ew&&vl<=el+ew)) && { ((++hits)); break; }
                done
            done
            xe=${#expected[@]}
            p=$(pct $hits "$xe")
            ((p>=90)) && echo "b pass $n REJECTED:${hits}/${xe}_errors_(${p}%)" \
                      || echo "b fail $n LOW_COVERAGE:${hits}/${xe}_errors_(${p}%)"
        fi
        ;;
    d)
        if ! compile_set "$n"; then
            echo "d skip $n COMPILE[$COMPILE_FAILED]:$(head -1 "$LOGS_DIR/$n.err" 2>/dev/null|cut -c1-50)"; return; fi
        if [[ -n $BIND_FAILED ]]; then
            echo "d fail $n OBSOLETE:$(head -1 "$LOGS_DIR/$n.bind" 2>/dev/null|cut -c1-50)"; return; fi
        if ! link_program "$n"; then
            report_link_failure d "$n"
            return; fi
        if run_in_lib "$TEST_TIMEOUT" "$n" > "$LOGS_DIR/$n.out" 2>&1 && grep -q PASSED "$LOGS_DIR/$n.out"; then
            echo "d pass $n PASSED"
        else
            echo "d fail $n FAILED:exact_arithmetic_check"
        fi
        ;;
    e)
        e_reject(){
            local n=$1 stage=$2 detail=$3
            if grep -q "PASSED => ERROR\|IN THIS CASE RECOMPILATION IS\|SHOULD NOT BE LINKABLE" "$f"; then
                echo "e pass $n ${stage}_REJECT_DOCUMENTED_PASS"
            elif grep -q "N/A => ERROR\|NON-APPLICABLE IF THE INSTANTIATION" "$f"; then
                echo "e skip $n N/A:${stage}_rejection_sanctioned"
            else
                echo "e skip $n ${stage}:$detail"
            fi
        }
        if ! compile_set "$n"; then
            e_reject "$n" COMPILE "$(head -1 "$LOGS_DIR/$n.err" 2>/dev/null|cut -c1-50)"; return; fi
        if [[ -n $BIND_FAILED ]]; then
            e_reject "$n" BIND "$(head -1 "$LOGS_DIR/$n.bind" 2>/dev/null|cut -c1-50)"; return; fi
        if ! link_program "$n"; then
            report_link_failure e "$n"
            return; fi
        run_in_lib "$TEST_TIMEOUT" "$n" > "$LOGS_DIR/$n.out" 2>&1 || true
        if grep -q "TENTATIVELY PASSED" "$LOGS_DIR/$n.out" 2>/dev/null; then
            echo "e pass $n INSPECT:requires_manual_verification"
        elif grep -q PASSED "$LOGS_DIR/$n.out" 2>/dev/null; then
            echo "e pass $n PASSED"
        else
            echo "e fail $n FAILED"
        fi
        ;;
    l)
        if compile_set "$n"; then
            if [[ -n $BIND_FAILED ]]; then
                echo "l pass $n BIND_REJECT:$(head -1 "$LOGS_DIR/$n.bind" 2>/dev/null|cut -c1-40)"
                return
            fi
            if link_program "$n"; then
                if run_in_lib 1 "$n" > "$LOGS_DIR/$n.out" 2>&1; then
                    echo "l fail $n WRONG_EXEC:should_not_execute"
                else
                    echo "l pass $n BIND_REJECT:execution_blocked"
                fi
            elif [[ $LINK_STATUS == timeout ]]; then
                echo "l fail $n TIMEOUT:link_exceeded_${LINK_TIMEOUT}s"
            else
                echo "l pass $n LINK_REJECT:binding_failed_as_expected"
            fi
        else
            echo "l pass $n COMPILE_REJECT:$(head -1 "$LOGS_DIR/$n.err" 2>/dev/null|cut -c1-40)"
        fi
        ;;
    f) ;;
    *) echo "? skip $n UNKNOWN:unrecognized_class" ;;
    esac
}

run_one_timed(){
    local f=$1 n q started
    n=$(basename "$1" .ada)
    q=${f##*/}; q=${q:0:1}; q=${q,,}
    local out rc=0 graded=1
    started=$(now_ms)
    out=$(timed "$WORKER_TIMEOUT" bash -c "run_one \"\$1\"" _ "$f" 2>/dev/null) || rc=$?
    if ((rc==124 || rc==137)); then
        echo "$q fail $n TIMEOUT:worker_exceeded_${WORKER_TIMEOUT}s"
    elif ((rc != 0)); then
        echo "$q fail $n HARNESS:worker_exit_${rc}"
    elif [[ -n $out ]]; then
        echo "$out"
    else
        graded=0
    fi
    if [[ -n ${PROGRESS_FILE:-} ]]; then
        printf '%s\t%s\t%s\n' "$(( $(now_ms) - started ))" "$graded" "$n" >> "$PROGRESS_FILE"
    fi
    return 0
}

SUITES='acats extensions project bonus debug repro fuzz'
DORMANT_SUITES='gameplay'

#  The suites the .github integrator runs; everything else stays out of its
#  path.  `ci' selects exactly these.
CI_SUITES='acats repro extensions'

#  --only and --skip (or the TA_ONLY / TA_SKIP environment, comma or space
#  separated) narrow what runs; a disabled suite yields no tests whether it
#  was reached through `all' or named outright.
ONLY_SUITES=${TA_ONLY:-}
SKIP_SUITES=${TA_SKIP:-}

suite_enabled(){
    local s=$1 list
    if [ -n "$ONLY_SUITES" ]; then
        list=${ONLY_SUITES//,/ }
        case " $list " in *" $s "*) ;; *) return 1 ;; esac
    fi
    if [ -n "$SKIP_SUITES" ]; then
        list=${SKIP_SUITES//,/ }
        case " $list " in *" $s "*) return 1 ;; esac
    fi
    return 0
}

CLASS_ROWS=(a "A  Acceptance"  b "B  Illegality"  c "C  Executable"
            d "D  Numerics"    e "E  Inspection"  l "L  Post-compilation")

suite_label(){ case $1 in
    extensions) echo "Extensions" ;;
    project)    echo "Project files" ;;
    bonus)      echo "Bonus (post-83)" ;;
    debug)      echo "Debugging" ;;
    repro)      echo "Reproducers" ;;
    fuzz)       echo "Fuzz" ;;
    gameplay)   echo "Gameplay" ;;
    *)          echo "$1" ;;
esac; }

is_suite(){ case " $SUITES $DORMANT_SUITES " in *" $1 "*) return 0 ;; *) return 1 ;; esac; }

engine_setup(){
    local user_worker=${WORKER_TIMEOUT:-}
    JOBS=${JOBS_OPTION:-${JOBS:-${NPROC:-$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)}}}
    STARTUP_TIMEOUT=${STARTUP_TIMEOUT:-30}
    BUILD_TIMEOUT=${BUILD_TIMEOUT:-300}
    LINK_TIMEOUT=${LINK_TIMEOUT:-20}
    BASELINE=${BASELINE:-test.baseline}
    OPT=${OPT:--O2}

    [ -n "$TIMEOUT" ] || {
        echo "$SELF: no usable 'timeout' command found" >&2
        echo "         macOS:   brew install coreutils" >&2
        echo "         Windows: run this under the bash that comes with Git for" >&2
        echo "                  Windows, whose /usr/bin/timeout comes first on PATH" >&2
        exit 1
    }
    TA_TIMEOUTS=$(timeout_table)
    read -r COMPILE_TIMEOUT TEST_TIMEOUT WORKER_TIMEOUT <<<"$(timeout_for acats all)"
    [ -n "$user_worker" ] ||
        WORKER_TIMEOUT=$((8 * COMPILE_TIMEOUT + 4 * LINK_TIMEOUT + 2 * TEST_TIMEOUT + 30))
    TA_TIMEOUTS=$(printf '%s\n' "$TA_TIMEOUTS" | awk -v w="$WORKER_TIMEOUT" '$1 == "acats" { $4 = w } { print }')
    START_MS=$(now_ms)

    if ! corpus_complete; then
        pulse "unpacking the test corpus from tests.zip"
        ensure_corpus || { pulse_stop; die "the test corpus is missing and tests.zip cannot be unpacked; restore tests.zip (git checkout -- tests.zip)"; }
        pulse_stop
    fi

    if [ -n "${ADA83:-}" ]; then
        local named=$ADA83
        ADA83=$(find_compiler) || die "ADA83 names no executable compiler: $named"
    else
        ADA83=$(find_compiler) || ADA83=""
        if [[ -z $ADA83 ]] || [[ turboada.c -nt $ADA83 ]]; then
            printf '  %srebuilding ta%s\n' "$DIM" "$OFF"
            build_compiler || die "compiler build failed"
            ADA83=$(find_compiler) || die "no ta executable after building"
        fi
    fi

    TA_WORK=$(mktemp -d "${TMPDIR:-/tmp}/turboada-run-XXXXXX") || die "cannot make a work directory"
    TA_REPORT_DIR=$TA_WORK/report
    mkdir -p "$TA_REPORT_DIR"
    cp acats/report.ads acats/report.adb "$TA_REPORT_DIR/" || die "acats/ carries no report package"
    ROOT=$PWD

    export ADA83 TIMEOUT KILL_GRACE TA_TIMEOUTS TA_WORK TA_REPORT_DIR ROOT START_MS OPT \
           COMPILE_TIMEOUT TEST_TIMEOUT LINK_TIMEOUT WORKER_TIMEOUT
    export TA_ACCEPT=${ACCEPT_OPTION:-0}
    export -f run_one run_one_timed gather_files compile_set run_in_lib link_program \
              report_link_failure run_continuity_creators pct now_ms timed
}

discover_suite(){
    local suite=$1 filter=${2:-} f name d owner
    local -A linked=() owner_of=()
    case $suite in
        acats)
            for f in acats/"${filter,,}"*.ada; do
                [[ -f $f ]] && printf '2\tacats:%s\n' "$(basename "$f" .ada)"
            done ;;
        fuzz)
            for f in fuzz/*/*.ada; do
                [[ -f $f ]] || continue
                name=${f#fuzz/}; name=${name%.ada}
                matches "$name" "$filter" && printf '3\tfuzz:%s\n' "$name"
            done ;;
        bonus)
            for f in acats-bonus/*/*.ada; do
                [[ -f $f ]] || continue
                name=${f#acats-bonus/}; name=${name%.ada}
                [[ $name == support/* ]] && continue
                matches "$name" "$filter" && printf '3\tbonus:%s\n' "$name"
            done ;;
        extensions)
            while read -r f; do [[ -n $f ]] && linked[$f]=1; done < <(sed -n 's/^-- LINK: //p' extensions/*.ada 2>/dev/null)
            for f in extensions/*.ada; do
                [[ -f $f ]] || continue
                name=$(basename "$f" .ada)
                [[ -n ${linked[$name.ada]:-} ]] && continue
                matches "$name" "$filter" && printf '3\textensions:%s\n' "$name"
            done ;;
        project)
            for f in project/gpr/g*.gpr project/gpj/t*.gpj project/build/b*.gpr project/build/b*.gpj; do
                [[ -f $f ]] || continue
                name=${f#project/}; name=${name%.*}
                matches "$name" "$filter" && printf '3\tproject:%s\n' "$name"
            done ;;
        debug)
            for name in $(bash debug/run.sh --list $([[ ${ACCEPT_OPTION:-0} == 1 ]] && echo --accept)); do
                matches "$name" "$filter" && printf '0\tdebug:%s\n' "$name"
            done ;;
        repro)
            while IFS=$'\t' read -r owner f; do owner_of[$f]=$owner; done < <(repro_support)
            owner=${owner_of[$filter.ada]:-}
            if [[ -n $filter && -n $owner ]]; then
                printf '  %s%s.ada is support for %s, not a test on its own; running %s%s\n' \
                    "$DIM" "$filter" "$owner" "$owner" "$OFF" >&2
                filter=$owner
            fi
            for d in repro/*/; do
                d=${d%/}
                [[ -f $d/run.sh ]] || continue
                name=${d#repro/}
                matches "$name" "$filter" && printf '1\trepro:%s\n' "$name"
            done
            for f in repro/*.ada; do
                [[ -f $f ]] || continue
                name=$(basename "$f" .ada)
                [[ -n ${owner_of[$name.ada]:-} ]] && continue
                matches "$name" "$filter" && printf '3\trepro:%s\n' "$name"
            done ;;
        gameplay)
            for d in gameplay/scenarios/*/; do
                d=${d%/}
                [[ -f $d/run.sh ]] || continue
                name=${d#gameplay/}
                matches "$name" "$filter" && printf '1\tgameplay:%s\n' "$name"
            done
            if [[ -f craft ]] && command -v python3 >/dev/null 2>&1; then
                ./craft test list "$filter"
            fi ;;
    esac
    return 0
}

repro_support(){
    awk 'FNR == 1 { done = 0 }
         done { next }
         /^--/ { if (sub(/^-- WITH: */, "")) { n = split($0, w, /[ \t]+/)
                     for (i = 1; i <= n; i++) if (w[i] != "") { f = FILENAME; sub(/.*\//, "", f); sub(/\.ada$/, "", f); print f "\t" w[i] } }
                 next }
         /^[[:space:]]*$/ { next }
         { done = 1 }' repro/*.ada
}

matches(){
    [[ -z $2 ]] && return 0
    [[ $1 == $2 || $1 == $2/* ]]
}

discover(){
    local sel suite
    for sel; do
        case $sel in
            all)  for suite in $SUITES; do suite_enabled "$suite" && discover_suite "$suite"; done ;;
            */*)  suite=${sel%%/*}
                  is_suite "$suite" || die "no suite named '$suite' (the suites: $SUITES)"
                  suite_enabled "$suite" && discover_suite "$suite" "${sel#*/}" ;;
            a|b|c|d|e|l|A|B|C|D|E|L) suite_enabled acats && discover_suite acats "$sel" ;;
            *)    if is_suite "$sel"; then suite_enabled "$sel" && discover_suite "$sel"
                  else suite_enabled acats && discover_suite acats "$sel"; fi ;;
        esac
    done | awk -F'\t' '!seen[$2]++' | sort -s -t$'\t' -k1,1n | cut -f2-
}

run_label(){
    local label=${1:-all}
    (($# < 2)) || label+="+$(($# - 1))"
    label=${label//\//_}
    label=${label//[^A-Za-z0-9_.+-]/_}
    printf '%s' "${label:0:64}"
}

run_pool(){
    local items=$1 title=$2 total
    total=$(wc -l < "$items")
    ((total > 0)) || die "the selection matched no tests"

    RUN_ID="$(run_label "${SELECTION[@]}")-$(date +%Y%m%d-%H%M%S)-$$"
    RUN_DIR=test_results/$RUN_ID
    RESULTS_TSV=$RUN_DIR/results.tsv
    export RESULTS_DIR=$RUN_DIR/acats LOGS_DIR=$RUN_DIR/logs/acats
    export TA_LOGS=$PWD/$RUN_DIR/logs
    mkdir -p "$RUN_DIR" "$RESULTS_DIR" "$LOGS_DIR"

    if grep -q '^acats:' "$items"; then
        export REPORT_LL="$TA_WORK/report.ll"
        timed "$COMPILE_TIMEOUT" "$ADA83" -ada83 --ir acats/report.adb -o "$REPORT_LL" >/dev/null 2>&1 ||
            die "cannot compile acats/report.adb"
    fi

    export TA_RUN_DIR=$PWD/$RUN_DIR
    grep -q '^gameplay:' "$items" && gameplay_setup

    local version
    version=$(timed "$STARTUP_TIMEOUT" "$ADA83" --version 2>&1) || version="version query failed or timed out"
    version=${version%%$'\n'*}

    local counts
    counts=$(cut -d: -f1 "$items" | sort | uniq -c | awk '{ printf "%s%s %s", (NR > 1 ? ", " : ""), $2, $1 }')
    heading "$title"
    printf '  %sta%s       %s\n' "$BOLD" "$OFF" "$version"
    printf '  %stests%s    %s over %s workers: %s\n' "$BOLD" "$OFF" "$total" "$JOBS" "$counts"
    printf '  %sresults%s  %s\n' "$BOLD" "$OFF" "$RUN_DIR"

    export TA_PROGRESS; TA_PROGRESS=$(mktemp)
    LOAD_SAMPLES=$(mktemp); LOAD_PEAK=0
    hide_cursor
    load_watch_start
    local rows; rows=$(mktemp)
    local worker_errors=$RUN_DIR/logs/harness.err
    local runner_status; runner_status=$(mktemp)
    : > "$worker_errors"
    (
        set +e
        tr '\n' '\0' < "$items" |
            xargs -0 -P "$JOBS" -I{} bash -c '. "$1" && run_item "$2"' _ "$TA_LIB" {} \
            >> "$rows" 2>"$worker_errors"
        rc=$?
        printf '%d\n' "$rc" > "$runner_status"
        exit "$rc"
    ) &
    local runner=$!
    if [ $animated = 1 ]; then
        local done_n last
        while [[ ! -s $runner_status ]] && kill -0 "$runner" 2>/dev/null; do
            done_n=$(wc -l < "$TA_PROGRESS" 2>/dev/null) || done_n=0
            last=$(tail -1 "$TA_PROGRESS" 2>/dev/null | cut -f2) || last=''
            progress "${done_n:-0}" "$total" "${last:-running the suite}"
            sleep 0.15
        done
    fi
    local runner_rc=0
    wait "$runner" || runner_rc=$?
    load_watch_stop
    clear_line; show_cursor
    if ((runner_rc != 0)); then
        printf '  %swarning:%s worker launcher exited with status %d; see %s\n' \
            "$BAD" "$OFF" "$runner_rc" "$worker_errors" >&2
    fi
    cut -f2 "$TA_PROGRESS" | sort > "$TA_PROGRESS.done"
    tr ':' '/' < "$items" | sort | comm -23 - "$TA_PROGRESS.done" | while IFS= read -r lost; do
        printf '%s\t%s\tfail\tHARNESS: the worker never finished this test\n' "${lost%%/*}" "${lost#*/}"
    done >> "$rows"
    tally "$rows"
    gameplay_reports
    rm -f "$rows" "$TA_PROGRESS" "$TA_PROGRESS.done" "$runner_status" "$LOAD_SAMPLES"
    LOAD_SAMPLES=''
}

gameplay_setup(){
    local src=turboada-example-game.ada bin=bin-$TA_HOST/turboada-example-game
    TA_GAME='' TA_GAME_WHY=''
    #  Scripted scenarios build the game themselves; the craft-driven tiers
    #  need a probed binary, and no craft means none of those will run.
    if [[ ! -f craft ]]; then
        TA_GAME_WHY='craft is not in the tree'
        export TA_GAME TA_GAME_WHY
        return 0
    fi
    if ! command -v python3 >/dev/null 2>&1; then
        TA_GAME_WHY='python3 is not on PATH'
    elif [[ -n ${GAME:-} ]]; then
        TA_GAME=$GAME
    elif [[ -f $src ]]; then
        if [[ ! -x $bin || $src -nt $bin || $ADA83 -nt $bin ]]; then
            pulse "building the game"
            mkdir -p "${bin%/*}"
            timed "$BUILD_TIMEOUT" "$ADA83" "$OPT" "$src" -o "$bin" >"$TA_WORK/game-build.log" 2>&1 ||
                TA_GAME_WHY="BUILD: the game does not build: $(first_problem "$TA_WORK/game-build.log")"
            pulse_stop
        fi
        [[ -n $TA_GAME_WHY ]] || TA_GAME=$PWD/$bin
    fi
    if [[ -n $TA_GAME ]] && ! TA_GAME=$TA_GAME ./craft test probe >/dev/null 2>&1; then
        TA_GAME=''
    fi
    [[ -n $TA_GAME || -n $TA_GAME_WHY ]] || TA_GAME_WHY='the game has no --simulate yet'
    export TA_GAME TA_GAME_WHY
}

gameplay_reports(){
    local d
    [[ -f craft ]] || return 0
    for d in "$RUN_DIR"/gameplay/*/; do
        [[ -s $d/runs.tsv ]] || continue
        ./craft test report "$d" 2>&1 | sed 's/^/  /'
    done
    return 0
}

tally(){
    awk -F'\t' -v order="$SUITES $DORMANT_SUITES" '
        BEGIN { n = split(order, o, " "); for (i = 1; i <= n; i++) rank[o[i]] = i }
        NF >= 3 { printf "%02d\t%s\n", (rank[$1] ? rank[$1] : 99), $0 }' "$1" |
        sort -t$'\t' -k1,1 -k3,3 | cut -f2- > "$RESULTS_TSV"

    local counts
    counts=$(awk -F'\t' '
        { s = $1; v = $3; t[s]++; c[s, v]++
          if (s == "acats") { k = tolower(substr($2, 1, 1)); t["acats." k]++; c["acats." k, v]++ } }
        END { for (s in t) printf "%s %d %d %d %d\n", s, c[s, "pass"], c[s, "fail"], c[s, "skip"], t[s] }' "$RESULTS_TSV")
    count(){ awk -v s="$1" -v f="$2" '$1 == s { print $f; found = 1 } END { if (!found) print 0 }' <<<"$counts"; }

    local i k suite p f s t tp=0 tf=0 ts=0 tt=0
    heading "RESULTS"
    printf '  %-22s %6s %6s %6s %6s  %s\n' suite pass fail skip total rate
    rule 77
    for ((i = 0; i < ${#CLASS_ROWS[@]}; i += 2)); do
        k=${CLASS_ROWS[i]}
        t=$(count "acats.$k" 5)
        ((t > 0)) && result_row "${CLASS_ROWS[i+1]}" "$(count "acats.$k" 2)" "$(count "acats.$k" 3)" "$(count "acats.$k" 4)" "$t"
    done
    for suite in $SUITES $DORMANT_SUITES; do
        t=$(count "$suite" 5)
        ((t > 0)) || continue
        p=$(count "$suite" 2) f=$(count "$suite" 3) s=$(count "$suite" 4)
        tp=$((tp + p)) tf=$((tf + f)) ts=$((ts + s)) tt=$((tt + t))
        [[ $suite == acats ]] || result_row "$(suite_label "$suite")" "$p" "$f" "$s" "$t"
    done
    rule 77
    result_row TOTAL "$tp" "$tf" "$ts" "$tt" "$BOLD"
    printf '\n  %selapsed%s %ss over %d tests with %s workers, %s\n' \
        "$DIM" "$OFF" "$(elapsed)" "$tt" "$JOBS" "$(date '+%Y-%m-%d %H:%M:%S')"
    [ "$LOAD_WATCHED" = 1 ] && printf '  %sload%s    %s now, %s at its worst while running\n' \
        "$DIM" "$OFF" "$(loadavg)" "$LOAD_PEAK"

    {
        if (($(count acats 5) > 0)); then
            printf "A=%d B=%d C=%d D=%d E=%d L=%d F=%d S=%d T=%d/%d (%d%%)\n" \
                "$(count acats.a 2)" "$(count acats.b 2)" "$(count acats.c 2)" "$(count acats.d 2)" \
                "$(count acats.e 2)" "$(count acats.l 2)" "$(count acats 3)" "$(count acats 4)" \
                "$(count acats 2)" "$(count acats 5)" "$(pct "$(count acats 2)" "$(count acats 5)")"
        fi
        (($(count extensions 5) > 0)) && printf ' X=%d/%d XF=%d XS=%d\n' \
            "$(count extensions 2)" "$(count extensions 5)" "$(count extensions 3)" "$(count extensions 4)"
        (($(count project 5) > 0)) && printf ' PJ=%d/%d PJF=%d PJK=%d\n' \
            "$(count project 2)" "$(count project 5)" "$(count project 3)" "$(count project 4)"
        (($(count bonus 5) > 0)) && printf ' BN=%d/%d BNF=%d\n' \
            "$(count bonus 2)" "$(count bonus 5)" "$(count bonus 3)"
        (($(count debug 5) > 0)) && printf ' DBG=%d/%d DBGF=%d DBGP=%d\n' \
            "$(count debug 2)" "$(( $(count debug 2) + $(count debug 3) ))" "$(count debug 3)" "$(count debug 4)"
        (($(count repro 5) > 0)) && printf ' RP=%d/%d RPF=%d\n' \
            "$(count repro 2)" "$(count repro 5)" "$(count repro 3)"
        (($(count fuzz 5) > 0)) && printf ' FZ=%d/%d FZF=%d\n' \
            "$(count fuzz 2)" "$(count fuzz 5)" "$(count fuzz 3)"
        (($(count gameplay 5) > 0)) && printf ' GP=%d/%d GPF=%d GPS=%d\n' \
            "$(count gameplay 2)" "$(count gameplay 5)" "$(count gameplay 3)" "$(count gameplay 4)"
        true
    } > "$RUN_DIR/test_summary.txt"

    local failures
    failures=$(awk -F'\t' '$3 == "fail" || ($3 == "skip" && $1 == "acats")' "$RESULTS_TSV")
    if [[ -n $failures ]]; then
        heading "FAILURES" "every failing test, and every ACATS test that never ran"
        while IFS=$'\t' read -r suite k p f; do
            printf '  %s%-4s%s %s/%s  %s%s%s\n' "$BAD" "$p" "$OFF" "$suite" "$k" "$DIM" "$f" "$OFF"
        done <<<"$failures"
    fi

    if [[ ${TAP:-0} == 1 ]]; then
        { echo "TAP version 13"; local j=0 name result detail
          while IFS=$'\t' read -r suite name result detail; do ((++j))
            case $result in
              pass) echo "ok $j $suite/$name" ;;
              skip) echo "ok $j $suite/$name # SKIP ${detail}" ;;
              *)    echo "not ok $j $suite/$name # ${detail}" ;;
            esac
          done < "$RESULTS_TSV"
          echo "1..$j"; } > "$RUN_DIR/results.tap"
    fi
}

baseline_source(){
    if [[ -f $BASELINE ]]; then printf '%s' "$BASELINE"
    elif [[ $BASELINE == test.baseline && -f acats.baseline ]]; then printf 'acats.baseline'
    fi
}

baseline_rows(){
    local file
    file=$(baseline_source)
    [[ -n $file ]] || return 0
    awk -F'\t' 'NF == 2 { print "acats\t" $1 "\t" $2; next } NF >= 3 { print $1 "\t" $2 "\t" $3 }' "$file"
}

compare_to_baseline(){
    REGRESSIONS=0
    local source
    source=$(baseline_source)
    [[ -n $source ]] ||
        printf '\n  %sno baseline at %s -- run %s to create one; every failure counts as a regression%s\n' \
            "$DIM" "$BASELINE" "\`$SELF bless\`" "$OFF"
    local -A BL RES
    local suite name status _d
    while IFS=$'\t' read -r suite name status; do [[ -n $name ]] && BL[$suite/$name]=$status; done < <(baseline_rows)
    while IFS=$'\t' read -r suite name status _d; do [[ -n $name ]] && RES[$suite/$name]=$status; done < "$RESULTS_TSV"

    local -a regr=() prog=() chg=() new=() miss=()
    local k b r shared=0 was=0 now=0
    for k in "${!RES[@]}"; do
        b=${BL[$k]:-__absent__}; r=${RES[$k]}
        if [[ $b != __absent__ ]]; then
            shared=$((shared + 1))
            [[ $b == pass ]] && was=$((was + 1))
            [[ $r == pass ]] && now=$((now + 1))
        fi
        if   [[ $b == __absent__ && $r == fail ]]; then regr+=("$k new->fail")
        elif [[ $b == __absent__ ]]; then new+=("$k $r")
        elif [[ $b == "$r" ]];      then :
        elif [[ $b == pass ]];      then regr+=("$k $b->$r")
        elif [[ $r == pass ]];      then prog+=("$k $b->$r")
        else                             chg+=("$k $b->$r"); fi
    done
    local -A SELECTED_SUITES=()
    for k in "${!RES[@]}"; do SELECTED_SUITES[${k%%/*}]=1; done
    for k in "${!BL[@]}"; do
        [[ -n ${SELECTED_SUITES[${k%%/*}]:-} && -z ${RES[$k]:-} ]] && miss+=("$k ${BL[$k]}")
    done
    REGRESSIONS=${#regr[@]}

    heading "BASELINE DIFF" "${source:-none}"
    emit_group(){ local tag=$1 colour=$2; shift 2; (($#)) || return 0
                  printf '  %s%s (%d)%s\n' "$colour" "$tag" "$#" "$OFF"
                  printf '    %s\n' "$@" | sort; printf '\n'; }
    emit_group "REGRESSIONS"  "$BAD"  ${regr[@]+"${regr[@]}"}
    emit_group "PROGRESSIONS" "$GOOD" ${prog[@]+"${prog[@]}"}
    emit_group "CHANGED"      "$BOLD" ${chg[@]+"${chg[@]}"}
    emit_group "NEW"          "$BOLD" ${new[@]+"${new[@]}"}
    emit_group "MISSING"      "$BOLD" ${miss[@]+"${miss[@]}"}
    ((shared > 0)) && printf '  %spassing%s  %d of %d shared, was %d, %s\n' \
        "$DIM" "$OFF" "$now" "$shared" "$was" "$(change "$now" "$was")"
    printf '  %s%d regression(s), %d progression(s), %d changed, %d new, %d missing%s\n' \
        "$DIM" ${#regr[@]} ${#prog[@]} ${#chg[@]} ${#new[@]} ${#miss[@]} "$OFF"
    ((REGRESSIONS==0)) && printf '  %sOK -- no regressions vs baseline%s\n' "$GOOD" "$OFF" \
                       || printf '  %sREGRESSED -- %d test(s) that passed in the baseline, or are new, now fail%s\n' \
                              "$BAD" "$REGRESSIONS" "$OFF"
}

write_baseline(){
    local tmp; tmp=$(mktemp)
    baseline_rows > "$tmp"
    local -A NEW
    local suite name status _d
    while IFS=$'\t' read -r suite name status _d; do [[ -n $name ]] && NEW[$suite$'\t'$name]=$status; done < "$RESULTS_TSV"
    { while IFS=$'\t' read -r suite name status; do
          [[ -n $name && -z ${NEW[$suite$'\t'$name]:-} ]] && printf '%s\t%s\t%s\n' "$suite" "$name" "$status"
      done < "$tmp"
      for name in "${!NEW[@]}"; do printf '%s\t%s\n' "$name" "${NEW[$name]}"; done
    } | sort -t$'\t' -k1,1 -k2,2 > "$BASELINE.new"
    mv "$BASELINE.new" "$BASELINE"
    rm -f "$tmp"
    printf '\n  %sbaseline%s written to %s, %d tests recorded\n' \
        "$BOLD" "$OFF" "$BASELINE" "$(wc -l < "$BASELINE")"
}

select_items(){
    ITEMS=$(mktemp)
    discover "$@" > "$ITEMS"
}

ALL_PROGRAMS="sieve matmul lu recurse strings numerics checks exceptions memory tasking taskflood taskselect taskelse indirect monitor finalizer wraparound"

describe(){ case $1 in
    sieve)      echo "integer arrays, index checks" ;;
    matmul)     echo "dense float, nested loops" ;;
    lu)         echo "LU decomposition, float division" ;;
    recurse)    echo "call and return" ;;
    strings)    echo "slices and character work" ;;
    numerics)   echo "fixed point and 12-digit float" ;;
    checks)     echo "range and index checks in a hot loop" ;;
    exceptions) echo "raise, propagate, handle" ;;
    memory)     echo "allocation and deallocation" ;;
    tasking)    echo "rendezvous throughput" ;;
    taskflood)  echo "task creation and termination" ;;
    indirect)   echo "a call through an access-to-subprogram" ;;
    monitor)    echo "protected procedure, function and entry, uncontended" ;;
    finalizer)  echo "Initialize, Adjust and Finalize driven by the compiler" ;;
    wraparound) echo "modular arithmetic, a power of two and a modulus that is not" ;;
    taskselect) echo "selective wait with an else part (UNMEASURABLE — see taskelse)" ;;
    taskelse)   echo "selective wait with an else part, fixed poll count" ;;
esac; }

comparable(){ case $1 in numerics) return 1 ;; *) return 0 ;; esac; }

concurrent(){ case $1 in tasking|taskflood|taskselect|taskelse) return 0 ;; *) return 1 ;; esac; }

extended(){ case $1 in indirect|monitor|finalizer|wraparound) return 0 ;; *) return 1 ;; esac; }

measure(){
    local out='' t i
    for ((i = 0; i < WARMUP; i++)); do "$@" <"$seed" >/dev/null 2>&1; done
    for ((i = 0; i < REPEATS; i++)); do
        TIMEFORMAT=%R; t=$( { time "$@" <"$seed" >/dev/null 2>&1; } 2>&1 )
        case $t in ''|*[!0-9.]*) continue ;; esac
        out+=$t$'\n'
    done
    [ -n "$out" ] || { printf 'x 0'; return; }
    printf '%s' "$out" | awk '{v[NR]=$1; s+=$1}
        END{ n = NR
             if (n == 0) { printf "x 0"; exit }
             mean = s / n
             for (i = 1; i <= n; i++)
                 for (j = i + 1; j <= n; j++)
                     if (v[j] < v[i]) { hold = v[i]; v[i] = v[j]; v[j] = hold }
             mid = (n % 2) ? v[(n + 1) / 2] : (v[n / 2] + v[n / 2 + 1]) / 2
             for (i = 1; i <= n; i++) spread += (v[i] - mean) * (v[i] - mean)
             sd = (n > 1) ? sqrt(spread / (n - 1)) : 0
             printf "%.3f %.1f", mid, ((mean > 0) ? sd * 100 / mean : 0) }'
}

med(){ local -a v=(); read -r -a v <<<"$1"; printf '%s' "${v[0]:-x}"; }
rsd(){ local -a v=(); read -r -a v <<<"$1"; printf '%s' "${v[1]:-0}"; }

allowed_cpus(){
    local list part a b i
    list=$(taskset -pc $$ 2>/dev/null | sed 's/.*: *//')
    if [ -z "$list" ]; then
        for ((i = 0; i < ncpu; i++)); do printf '%s\n' "$i"; done
        return
    fi
    local -a parts=()
    IFS=',' read -r -a parts <<<"$list"
    for part in ${parts[@]+"${parts[@]}"}; do
        case $part in
            *-*) a=${part%%-*}; b=${part##*-}
                 for ((i = a; i <= b; i++)); do printf '%s\n' "$i"; done ;;
            *)   printf '%s\n' "$part" ;;
        esac
    done
}

pinset(){
    if [ "$NO_PIN" != 1 ] && command -v taskset >/dev/null 2>&1 && taskset -c "$1" true 2>/dev/null
    then printf 'taskset\n-c\n%s\n' "$1"; fi
}

bench_pinning(){
    ncpu=$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 1)
    CPUS=(); mapfile -t CPUS < <(allowed_cpus)
    [ ${#CPUS[@]} -gt 0 ] || CPUS=(0)
    BENCH_CPU=${BENCH_CPU:-${CPUS[${#CPUS[@]}-1]}}
    BENCH_CPUS_TASK=${BENCH_CPUS_TASK:-}
    if [ -z "$BENCH_CPUS_TASK" ]; then
        if [ ${#CPUS[@]} -ge 2 ]
        then BENCH_CPUS_TASK="${CPUS[${#CPUS[@]}-2]},${CPUS[${#CPUS[@]}-1]}"
        else BENCH_CPUS_TASK=$BENCH_CPU; fi
    fi

    PRIO=() PRIO_WHY=''
    if [ "$NO_PIN" != 1 ]; then
        if [ "$RT" = 1 ] && command -v chrt >/dev/null 2>&1 && chrt -f 50 true 2>/dev/null; then
            PRIO=(chrt -f 50); PRIO_WHY=', SCHED_FIFO 50'
        elif command -v nice >/dev/null 2>&1 && nice -n -5 true 2>/dev/null; then
            PRIO=(nice -n -5); PRIO_WHY=', nice -5'
        fi
    fi

    PIN_ONE=(); mapfile -t PIN_ONE < <(pinset "$BENCH_CPU")
    PIN_MANY=(); mapfile -t PIN_MANY < <(pinset "$BENCH_CPUS_TASK")
    PIN_ONE+=(${PRIO[@]+"${PRIO[@]}"}); PIN_MANY+=(${PRIO[@]+"${PRIO[@]}"})
    PIN=(${PIN_ONE[@]+"${PIN_ONE[@]}"})

    if [ ${#PIN_ONE[@]} -eq 0 ]; then PIN_WHY='unpinned'
    else PIN_WHY="pinned to cpu $BENCH_CPU, or cpus $BENCH_CPUS_TASK where the program has tasks${PRIO_WHY}"; fi
}

load_gate(){
    local l; l=$(loadavg); [ -n "$l" ] || return 0
    awk -v l="$l" -v m="$LOAD_MAX" 'BEGIN{exit !(l+0 > m+0)}' || return 0
    if [ "$FORCE" = 1 ]
    then printf '  %sload average is %s, above %s: measuring anyway (FORCE=1)%s\n' "$BAD" "$l" "$LOAD_MAX" "$OFF"
    else die "load average is $l, above LOAD_MAX=$LOAD_MAX; wait for the machine to settle or set FORCE=1"; fi
}

timed_run(){
    local t
    TIMEFORMAT=%R
    t=$( { time ${PIN[@]+"${PIN[@]}"} "$@" <"$seed" >/dev/null 2>&1; } 2>&1 )
    case $t in ''|*[!0-9.]*) return 1 ;; esac
    printf '%s\n' "$t"
}

measure_pair(){
    local a=$1 b=$2 i t
    : > "$BENCH_WORK/samples.a"; : > "$BENCH_WORK/samples.b"
    for ((i = 0; i < CODEGEN_WARMUP; i++)); do
        ${PIN[@]+"${PIN[@]}"} "$a" <"$seed" >/dev/null 2>&1
        [ -n "$b" ] && ${PIN[@]+"${PIN[@]}"} "$b" <"$seed" >/dev/null 2>&1
    done
    for ((i = 0; i < CODEGEN_REPEATS; i++)); do
        if [ -z "$b" ]; then
            t=$(timed_run "$a") && printf '%s\n' "$t" >> "$BENCH_WORK/samples.a"
        elif [ $((i % 2)) -eq 0 ]; then
            t=$(timed_run "$a") && printf '%s\n' "$t" >> "$BENCH_WORK/samples.a"
            t=$(timed_run "$b") && printf '%s\n' "$t" >> "$BENCH_WORK/samples.b"
        else
            t=$(timed_run "$b") && printf '%s\n' "$t" >> "$BENCH_WORK/samples.b"
            t=$(timed_run "$a") && printf '%s\n' "$t" >> "$BENCH_WORK/samples.a"
        fi
    done
    return 0
}

distinguishable(){
    awk -v a="$1" -v am="$2" -v g="$3" -v gm="$4" -v f="$FLOOR" 'BEGIN{
        if (a == "x" || g == "x") exit 1
        if (am + 0 < f + 0) am = f
        if (gm + 0 < f + 0) gm = f
        d = a - g; if (d < 0) d = -d
        exit !(d > am + gm) }'
}

peak_rss(){
    local o
    if o=$(/usr/bin/time -v "$@" <"$seed" 2>&1 >/dev/null); then
        printf '%s' "$o" | awk '/Maximum resident set size/{printf "%.1f", $NF/1024}'
    elif o=$(/usr/bin/time -l "$@" <"$seed" 2>&1 >/dev/null); then
        printf '%s' "$o" | awk '/maximum resident set size/{printf "%.1f", $1/1048576}'
    else printf 'x'; fi
}

install_gnat(){
    if [ "$TA_HOST" = windows ]; then
        gnat_note="no GNAT; get one with Alire (https://alire.ada.dev): alr toolchain --select"
        return 1
    fi
    local s='' c='' try; [ "$(id -u)" -eq 0 ] || s=sudo
    for try in "apt-get:$s apt-get install -y --no-install-recommends gnat" \
               "dnf:$s dnf install -y gcc-gnat" "pacman:$s pacman -S --noconfirm gcc-ada" \
               "zypper:$s zypper install -y gcc-ada" "apk:$s apk add gcc-gnat" "brew:brew install gnat"; do
        command -v "${try%%:*}" >/dev/null 2>&1 && { c=${try#*:}; break; }
    done
    if [ -z "$c" ]; then
        gnat_note="no GNAT, and no package manager (apt-get/dnf/pacman/zypper/apk/brew) to install it with"
        return 1
    fi
    pulse "installing GNAT to compare against"; eval "$c" >/dev/null 2>&1; pulse_stop
    command -v gnatmake >/dev/null 2>&1 && return 0
    gnat_note="tried '${c#* }' but gnatmake is still not on PATH"
    return 1
}

have_gnat(){
    [ "$NO_GNAT" = 1 ] && return 1
    command -v gnatmake >/dev/null 2>&1 || install_gnat
}

corpus_ready(){ ensure_corpus; }

corpus_files(){
    local f; local -a all=()
    for f in "$HERE"/acats/*.ada; do [ -f "$f" ] && all+=("$f"); done
    [ ${#all[@]} -gt 0 ] || return 0
    printf '%s\n' "${all[@]}" | head -n "$CORPUS"
}

load_corpus(){
    CORPUS_FILES=()
    corpus_ready || return 1
    mapfile -t CORPUS_FILES < <(corpus_files)
    [ ${#CORPUS_FILES[@]} -gt 0 ]
}

monster(){
    local n=$1 i
    printf 'with TEXT_IO; use TEXT_IO;\nprocedure Monster is\n'
    printf '   package Int_IO is new Integer_IO (Integer);\n   Seed : Integer;\n   Total : Integer := 0;\n'
    for ((i = 1; i <= n; i++)); do
        printf '   type Kind_%d is (Red_%d, Green_%d, Blue_%d);\n' $i $i $i $i
        printf '   subtype Narrow_%d is Integer range %d .. %d;\n' $i $i $((i + 500))
        printf '   type Rec_%d is record\n      A : Narrow_%d;\n      B : Kind_%d;\n      C : Float;\n   end record;\n' $i $i $i
        printf '   function Fold_%d (X : Integer) return Integer;\n' $i
    done
    for ((i = 1; i <= n; i++)); do
        printf '   function Fold_%d (X : Integer) return Integer is\n      V : Integer := X;\n      R : Rec_%d;\n   begin\n' $i $i
        printf '      R.B := Green_%d;\n      R.C := Float (V mod 7);\n' $i
        printf '      case V mod 4 is\n         when 0 => V := V + %d;\n         when 1 => V := V - %d;\n' $i $i
        printf '         when 2 => V := V * 2 + ((V + %d) - (V - %d) * 1);\n         when others => V := V / 2;\n      end case;\n' $i $i
        printf '      return ((V + 1) * (V + 2) - (V + 3) + Integer (R.C)) mod 1_000_003;\n   end;\n'
    done
    printf 'begin\n   Int_IO.Get (Seed);\n'
    for ((i = 1; i <= n; i++)); do printf '   Total := (Total + Fold_%d (Seed + %d)) mod 1_000_003;\n' $i $i; done
    printf "   Put_Line (\"monster:\" & Integer'Image (Total));\nend;\n"
}

write_programs(){
    mkdir -p "$BENCH_WORK/src"; echo 1 > "$seed"

    cat > "$BENCH_WORK/src/sieve.ada" <<'EOF'
with TEXT_IO; use TEXT_IO;
procedure Sieve is
   package Int_IO is new Integer_IO (Integer);
   Limit : constant := 2_000_000;
   type Flags is array (2 .. Limit) of Boolean;
   Seed  : Integer;
   Prime : Flags;
   Count : Integer := 0;
begin
   Int_IO.Get (Seed);
   for Pass in 1 .. 5 loop
      Count := 0;
      for I in Prime'Range loop Prime (I) := True; end loop;
      for I in Prime'Range loop
         if Prime (I) then
            Count := Count + Seed;
            declare
               J : Integer := I * 2;
            begin
               while J <= Limit loop
                  Prime (J) := False;
                  J := J + I;
               end loop;
            end;
         end if;
      end loop;
   end loop;
   Put_Line ("primes:" & Integer'Image (Count));
end;
EOF

    cat > "$BENCH_WORK/src/matmul.ada" <<'EOF'
with TEXT_IO; use TEXT_IO;
procedure Matmul is
   package Int_IO is new Integer_IO (Integer);
   N : constant := 400;
   type Matrix is array (1 .. N, 1 .. N) of Float;
   Seed    : Integer;
   A, B, C : Matrix;
   Sum     : Float;
begin
   Int_IO.Get (Seed);
   for I in 1 .. N loop
      for J in 1 .. N loop
         A (I, J) := Float (I + J * Seed);
         B (I, J) := Float (I - J);
         C (I, J) := 0.0;
      end loop;
   end loop;
   for I in 1 .. N loop
      for J in 1 .. N loop
         Sum := 0.0;
         for K in 1 .. N loop
            Sum := Sum + A (I, K) * B (K, J);
         end loop;
         C (I, J) := Sum;
      end loop;
   end loop;
   Sum := 0.0;
   for I in 1 .. N loop
      for J in 1 .. N loop Sum := Sum + C (I, J); end loop;
   end loop;
   Put_Line ("checksum:" & Integer'Image (Integer (Sum / 1.0E9)));
end;
EOF

    cat > "$BENCH_WORK/src/lu.ada" <<'EOF'
with TEXT_IO; use TEXT_IO;
procedure LU is
   package Int_IO is new Integer_IO (Integer);
   N     : constant Integer := 1000;
   Last  : constant Integer := N - 1;
   type Matrix is array (1 .. N, 1 .. N) of Float;
   Seed  : Integer;
   A     : Matrix;
   Pivot : Float;
   Total : Float := 0.0;
begin
   Int_IO.Get (Seed);
   for I in 1 .. N loop
      for J in 1 .. N loop
         if I = J then A (I, J) := Float (N + I * Seed);
         else A (I, J) := Float ((I * 7 + J * 3) mod 17) - 8.0; end if;
      end loop;
   end loop;
   for K in 1 .. Last loop
      Pivot := A (K, K);
      for I in K + 1 .. N loop
         A (I, K) := A (I, K) / Pivot;
         for J in K + 1 .. N loop
            A (I, J) := A (I, J) - A (I, K) * A (K, J);
         end loop;
      end loop;
   end loop;
   for I in 1 .. N loop Total := Total + A (I, I); end loop;
   Put_Line ("lu:" & Integer'Image (Integer (Total / 100.0)));
end;
EOF

    cat > "$BENCH_WORK/src/recurse.ada" <<'EOF'
with TEXT_IO; use TEXT_IO;
procedure Recurse is
   package Int_IO is new Integer_IO (Integer);
   Seed  : Integer;
   Total : Integer := 0;
   function Fib (N : Integer) return Integer is
   begin
      if N < 2 then return N; end if;
      return Fib (N - 1) + Fib (N - 2);
   end;
begin
   Int_IO.Get (Seed);
   for I in 1 .. 6 loop
      Total := Total + Fib (30 + Seed);
   end loop;
   Put_Line ("fib:" & Integer'Image (Total));
end;
EOF

    cat > "$BENCH_WORK/src/strings.ada" <<'EOF'
with TEXT_IO; use TEXT_IO;
procedure Strings is
   package Int_IO is new Integer_IO (Integer);
   subtype Line is String (1 .. 64);
   Seed : Integer;
   Buf  : Line := (others => 'a');
   Hits : Integer := 0;
   function Count_Char (S : String; C : Character) return Integer is
      N : Integer := 0;
   begin
      for I in S'Range loop
         if S (I) = C then N := N + 1; end if;
      end loop;
      return N;
   end;
begin
   Int_IO.Get (Seed);
   for Pass in 1 .. 3_000_000 loop
      Buf (1 + ((Pass * Seed) mod 64)) := Character'Val (97 + (Pass mod 26));
      Hits := Hits + Count_Char (Buf (1 .. 32), 'a');
   end loop;
   Put_Line ("hits:" & Integer'Image (Hits));
end;
EOF

    cat > "$BENCH_WORK/src/numerics.ada" <<'EOF'
with TEXT_IO; use TEXT_IO;
procedure Numerics is
   package Int_IO is new Integer_IO (Integer);
   type Money is delta 0.01 range -1_000_000.0 .. 1_000_000.0;
   type Angle is digits 12 range -1.0E9 .. 1.0E9;
   Seed  : Integer;
   Acc   : Money := 0.0;
   Rate  : Money := 0.07;
   Theta : Angle := 0.0;
   Tally : Integer := 0;
begin
   Int_IO.Get (Seed);
   for I in 1 .. 40_000_000 loop
      Acc := Acc + Rate * Seed;
      if Acc > 900_000.0 then Acc := 0.0; end if;
      Theta := Theta + Angle (I mod 1024) * 1.0E-3;
      if Theta > 9.0E8 then Theta := 0.0; end if;
   end loop;
   Tally := Integer (Acc) / 1000 + Integer (Theta / 1.0E6);
   Put_Line ("numerics:" & Integer'Image (Tally));
end;
EOF

    cat > "$BENCH_WORK/src/checks.ada" <<'EOF'
with TEXT_IO; use TEXT_IO;
procedure Checks is
   package Int_IO is new Integer_IO (Integer);
   subtype Small is Integer range 0 .. 999;
   type Table is array (Small) of Small;
   Seed  : Integer;
   T     : Table := (others => 0);
   Idx   : Small := 0;
   Tally : Integer := 0;
begin
   Int_IO.Get (Seed);
   for Pass in 1 .. 60_000 loop
      for I in Small loop
         Idx := Small ((I * 7 + Pass * Seed) mod 1000);
         T (Idx) := Small ((T (Idx) + I + Pass + Seed) mod 997);
      end loop;
   end loop;
   for I in Small loop Tally := (Tally + T (I)) mod 1_000_003; end loop;
   Put_Line ("checks:" & Integer'Image (Tally));
end;
EOF

    cat > "$BENCH_WORK/src/exceptions.ada" <<'EOF'
with TEXT_IO; use TEXT_IO;
procedure Exceptions is
   package Int_IO is new Integer_IO (Integer);
   Trouble : exception;
   Seed    : Integer;
   Caught  : Integer := 0;
   procedure Deep (Level : Integer) is
   begin
      if Level <= 0 then raise Trouble; end if;
      Deep (Level - 1);
   end;
begin
   Int_IO.Get (Seed);
   for I in 1 .. 2_000_000 loop
      begin
         Deep (8 * Seed);
      exception
         when Trouble => Caught := Caught + 1;
      end;
   end loop;
   Put_Line ("caught:" & Integer'Image (Caught));
end;
EOF

    cat > "$BENCH_WORK/src/memory.ada" <<'EOF'
with TEXT_IO, UNCHECKED_DEALLOCATION; use TEXT_IO;
procedure Memory is
   package Int_IO is new Integer_IO (Integer);
   type Node;
   type Link is access Node;
   type Node is record
      Value : Integer;
      Next  : Link;
   end record;
   procedure Free is new Unchecked_Deallocation (Node, Link);
   Seed  : Integer;
   Head  : Link;
   N     : Link;
   Tally : Integer := 0;
begin
   Int_IO.Get (Seed);
   for Pass in 1 .. 3_000 loop
      Head := null;
      for I in 1 .. 5_000 loop
         N := new Node'(Value => I * Seed, Next => Head);
         Head := N;
      end loop;
      while Head /= null loop
         Tally := (Tally + Head.Value) mod 1_000_003;
         N := Head;
         Head := Head.Next;
         Free (N);
      end loop;
   end loop;
   Put_Line ("memory:" & Integer'Image (Tally));
end;
EOF

    cat > "$BENCH_WORK/src/tasking.ada" <<'EOF'
with TEXT_IO; use TEXT_IO;
procedure Tasking is
   package Int_IO is new Integer_IO (Integer);
   Seed  : Integer;
   Total : Integer := 0;
   task Server is
      entry Push (V : Integer);
      entry Drain (V : out Integer);
   end Server;
   task body Server is
      Acc : Integer := 0;
   begin
      loop
         select
            accept Push (V : Integer) do Acc := Acc + V; end Push;
         or
            accept Drain (V : out Integer) do V := Acc; end Drain;
            exit;
         end select;
      end loop;
   end;
begin
   Int_IO.Get (Seed);
   for I in 1 .. 200_000 loop
      Server.Push (Seed);
   end loop;
   Server.Drain (Total);
   Put_Line ("rendezvous:" & Integer'Image (Total));
end;
EOF

    cat > "$BENCH_WORK/src/taskflood.ada" <<'EOF'
with TEXT_IO; use TEXT_IO;
procedure Taskflood is
   package Int_IO is new Integer_IO (Integer);
   Seed  : Integer;
   Total : Integer := 0;
   task type Worker is
      entry Take (V : Integer);
      entry Give (V : out Integer);
   end Worker;
   task body Worker is
      Mine : Integer := 0;
   begin
      accept Take (V : Integer) do Mine := V; end Take;
      for I in 1 .. 50 loop Mine := Mine + I; end loop;
      accept Give (V : out Integer) do V := Mine; end Give;
   end;
begin
   Int_IO.Get (Seed);
   for Round in 1 .. 400 loop
      declare
         Crew : array (1 .. 8) of Worker;
         Got  : Integer;
      begin
         for W in Crew'Range loop Crew (W).Take (W * Seed); end loop;
         for W in Crew'Range loop
            Crew (W).Give (Got);
            Total := (Total + Got) mod 1_000_003;
         end loop;
      end;
   end loop;
   Put_Line ("flood:" & Integer'Image (Total));
end;
EOF

    cat > "$BENCH_WORK/src/taskselect.ada" <<'EOF'
with TEXT_IO; use TEXT_IO;
procedure Taskselect is
   package Int_IO is new Integer_IO (Integer);
   Seed  : Integer;
   Total : Integer := 0;
   task Arbiter is
      entry Left  (V : Integer);
      entry Right (V : Integer);
      entry Done  (V : out Integer);
   end Arbiter;
   task body Arbiter is
      Acc : Integer := 0;
   begin
      loop
         select
            accept Left (V : Integer) do Acc := Acc + V; end Left;
         or
            accept Right (V : Integer) do Acc := Acc - V; end Right;
         or
            accept Done (V : out Integer) do V := Acc; end Done;
            exit;
         else
            Acc := Acc + 1;
         end select;
      end loop;
   end;
begin
   Int_IO.Get (Seed);
   for I in 1 .. 100_000 loop
      if I mod 2 = 0 then Arbiter.Left (Seed); else Arbiter.Right (Seed); end if;
   end loop;
   Arbiter.Done (Total);
   Put_Line ("select: done");
end;
EOF

    cat > "$BENCH_WORK/src/taskelse.ada" <<'EOF'
with TEXT_IO; use TEXT_IO;
procedure Taskelse is
   package Int_IO is new Integer_IO (Integer);
   Seed  : Integer;
   Total : Integer := 0;
   task Poller is
      entry Never (V : Integer);
      entry Done  (V : out Integer);
   end Poller;
   task body Poller is
      Acc : Integer := 0;
   begin
      for I in 1 .. 2_000_000 loop
         select
            accept Never (V : Integer) do Acc := Acc + V; end Never;
         else
            Acc := Acc + 1;
         end select;
      end loop;
      accept Done (V : out Integer) do V := Acc; end Done;
   end;
begin
   Int_IO.Get (Seed);
   Poller.Done (Total);
   Put_Line ("else:" & Integer'Image (Total));
end;
EOF

    cat > "$BENCH_WORK/src/indirect.ada" <<'EOF'
with TEXT_IO; use TEXT_IO;
procedure Indirect is
   package Int_IO is new Integer_IO (Integer);
   type Op is access function (X : Integer) return Integer;
   function Add_One (X : Integer) return Integer;
   function Double  (X : Integer) return Integer;
   function Negate  (X : Integer) return Integer;
   function Square  (X : Integer) return Integer;
   Table : constant array (0 .. 3) of Op :=
     (Add_One'Access, Double'Access, Negate'Access, Square'Access);
   Seed  : Integer;
   Total : Integer := 0;
   function Add_One (X : Integer) return Integer is begin return X + 1; end;
   function Double  (X : Integer) return Integer is begin return X + X; end;
   function Negate  (X : Integer) return Integer is begin return -X; end;
   function Square  (X : Integer) return Integer is begin return X * X; end;
begin
   Int_IO.Get (Seed);
   for I in 1 .. 30_000_000 loop
      Total := (Total + Table (I mod 4) (I mod 512)) mod 1024;
   end loop;
   Put_Line ("indirect:" & Integer'Image (Total));
end;
EOF

    cat > "$BENCH_WORK/src/monitor.ada" <<'EOF'
with TEXT_IO; use TEXT_IO;
procedure Monitor is
   package Int_IO is new Integer_IO (Integer);
   protected Cell is
      procedure Put (X : Integer);
      function  Get return Integer;
      entry     Take (X : out Integer);
   private
      V : Integer := 0;
   end Cell;
   Seed  : Integer;
   Total : Integer := 0;
   Held  : Integer;
   protected body Cell is
      procedure Put (X : Integer) is begin V := (V + X) mod 1024; end Put;
      function  Get return Integer is begin return V; end Get;
      entry     Take (X : out Integer) when True is begin X := V; end Take;
   end Cell;
begin
   Int_IO.Get (Seed);
   for I in 1 .. 4_000_000 loop
      Cell.Put (I mod 512);
      Total := (Total + Cell.Get) mod 1024;
      Cell.Take (Held);
      Total := (Total + Held) mod 1024;
   end loop;
   Put_Line ("monitor:" & Integer'Image (Total));
end;
EOF

    cat > "$BENCH_WORK/src/finalizer.ada" <<'EOF'
with ADA.FINALIZATION; use ADA.FINALIZATION;
with TEXT_IO; use TEXT_IO;
procedure Finalizer is
   package Int_IO is new Integer_IO (Integer);
   Events : Integer := 0;
   package Items is
      type Item is new Controlled with record V : Integer := 0; end record;
      procedure Initialize (I : in out Item);
      procedure Adjust     (I : in out Item);
      procedure Finalize   (I : in out Item);
   end Items;
   use Items;
   Seed : Integer;
   package body Items is
      procedure Initialize (I : in out Item) is begin I.V := Events mod 7; Events := Events + I.V + 1; end Initialize;
      procedure Adjust     (I : in out Item) is begin I.V := (I.V + Events) mod 13; Events := Events + I.V + 3; end Adjust;
      procedure Finalize   (I : in out Item) is begin Events := Events + I.V + 5; end Finalize;
   end Items;
begin
   Int_IO.Get (Seed);
   declare
      Keep : Item;
   begin
      for I in 1 .. 2_000_000 loop
         declare
            Fresh : Item;
         begin
            Fresh.V := I mod 512;
            Keep := Fresh;
         end;
      end loop;
      Events := Events + Keep.V;
   end;
   Put_Line ("finalize:" & Integer'Image (Events));
end;
EOF

    cat > "$BENCH_WORK/src/wraparound.ada" <<'EOF'
with TEXT_IO; use TEXT_IO;
procedure Wraparound is
   package Int_IO is new Integer_IO (Integer);
   type Byte  is mod 256;
   type Odd   is mod 200;
   Seed  : Integer;
   B     : Byte    := 0;
   D     : Odd     := 0;
   Total : Integer := 0;
begin
   Int_IO.Get (Seed);
   for I in 1 .. 10_000_000 loop
      B := B + Byte (I mod 251);
      B := (B * 3) xor 16#5A#;
      D := D * 7 + Odd (I mod 199);
      Total := (Total + Integer (B) + Integer (D)) mod 1024;
   end loop;
   Put_Line ("wraparound:" & Integer'Image (Total));
end;
EOF

    local p
    for p in $ALL_PROGRAMS; do cp "$BENCH_WORK/src/$p.ada" "$BENCH_WORK/src/$p.adb"; done
}

run_stages(){
    local p f w n=0 total=${#PROGRAM_LIST[@]}
    heading "COMPILE STAGES"
    printf '  %-11s %11s %11s %11s %9s\n' program "front end" whole "back end" "front %"; rule
    for p in "${PROGRAM_LIST[@]}"; do
        progress $((n++)) "$total" "staging $p"
        f=$(med "$(measure "$BENCH_TA" --ir "$BENCH_WORK/src/$p.ada" -o "$BENCH_WORK/$p.ll")")
        w=$(med "$(measure "$BENCH_TA" "-O$OPT" "$BENCH_WORK/src/$p.ada" -o "$BENCH_WORK/$p.exe")")
        clear_line
        awk -v p="$p" -v f="$f" -v w="$w" 'BEGIN{ b=w-f
            printf "  %-11s %11s %11s %11.3f %8.0f%%\n", p, f, w, (b>0?b:0), (w>0?f*100/w:0) }'
    done
    clear_line
}

run_parser(){
    local n t lines first='' firstlines=''
    heading "FRONT END AGAINST INPUT SIZE"
    printf '  %-8s %9s %11s %13s %s\n' units lines "front end" "µs per line" ""; rule
    for n in 50 100 200 400 800; do
        progress "$n" 800 "generating and compiling ${n} units"
        monster "$n" > "$BENCH_WORK/src/monster.ada"
        lines=$(wc -l < "$BENCH_WORK/src/monster.ada")
        t=$(med "$(measure "$BENCH_TA" --ir "$BENCH_WORK/src/monster.ada" -o "$BENCH_WORK/monster.ll")")
        clear_line
        [ -z "$first" ] && { first=$t; firstlines=$lines; }
        awk -v n="$n" -v l="$lines" -v t="$t" -v f="$first" -v fl="$firstlines" 'BEGIN{
            per = t*1000000/l
            base = f*1000000/fl
            printf "  %-8s %9s %11s %13.1f %s\n", n, l, t, per,
                   (base>0 ? sprintf("%.2fx the cost per line of the smallest", per/base) : "") }'
    done
    clear_line
    printf '\n  %sCost per line should stay flat. A figure that climbs with size is a\n' "$DIM"
    printf '  super-linear algorithm in the front end, and worth hunting down.%s\n' "$OFF"
}

run_corpus(){
    heading "CORPUS THROUGHPUT"
    load_corpus || { echo "  no corpus available"; return; }
    local n lines secs f finished=0 one peak
    n=${#CORPUS_FILES[@]}
    lines=$(cat "${CORPUS_FILES[@]}" 2>/dev/null | wc -l); : > "$BENCH_WORK/times"
    TIMEFORMAT=%R
    secs=$( { time { for f in "${CORPUS_FILES[@]}"; do
            one=$( { time "$BENCH_TA" --ir "$f" -o "$BENCH_WORK/c.ll" >/dev/null 2>&1; } 2>&1 )
            printf '%s\t%s\n' "$one" "$(basename "$f")" >> "$BENCH_WORK/times"
            finished=$((finished+1)); [ $((finished % 10)) = 0 ] && progress "$finished" "$n" "compiling the suite"
         done ; } ; } 2>&1 | tail -1 )
    clear_line
    printf '  %-22s %s\n' files "$n"
    printf '  %-22s %s\n' lines "$lines"
    printf '  %-22s %s s\n' "wall time" "$secs"
    awk -v l="$lines" -v s="$secs" 'BEGIN{if(s+0>0)printf "  %-22s %d\n","lines per second",l/s}'
    awk -v c="$n" -v s="$secs" 'BEGIN{if(s+0>0)printf "  %-22s %.1f\n","files per second",c/s}'
    heading "SLOWEST INPUTS"
    peak=$(sort -rn "$BENCH_WORK/times" | head -1 | cut -f1)
    sort -rn "$BENCH_WORK/times" | head -n "$SLOWEST" | while IFS=$'\t' read -r t name; do
        printf '  %-18s %7ss  %s\n' "$name" "$t" "$(bar "$(scaled "$t" "$peak" 24)" 24)"
    done
}

run_compare(){
    local other=$1 p a b sa sb n=0 total=${#PROGRAM_LIST[@]} f ref new
    [ -n "$other" ] || die "compare needs the path of another ta binary"
    [ -x "$other" ] || die "cannot run $other"
    heading "AGAINST $(basename "$other")"
    printf '  %-11s %14s %14s %10s   %s\n' program reference "this build" delta ''; rule
    for p in "${PROGRAM_LIST[@]}"; do
        progress $((n++)) "$total" "compiling $p"
        sb=$(measure "$other" "-O$OPT" "$BENCH_WORK/src/$p.ada" -o "$BENCH_WORK/$p.ref")
        sa=$(measure "$BENCH_TA" "-O$OPT" "$BENCH_WORK/src/$p.ada" -o "$BENCH_WORK/$p.new")
        b=$(med "$sb"); a=$(med "$sa"); clear_line
        printf '  %-11s %8s%s %8s%s %s   %s\n' "$p" \
            "$b" "$(spread "$(rsd "$sb")")" "$a" "$(spread "$(rsd "$sa")")" \
            "$(change "$a" "$b")" "$(verdict "$a" "$b" "$(rsd "$sa")" "$(rsd "$sb")")"
    done
    clear_line
    load_corpus || return 0
    TIMEFORMAT=%R
    progress 1 2 "reference over the corpus"
    ref=$( { time { for f in "${CORPUS_FILES[@]}"; do "$other" --ir "$f" -o "$BENCH_WORK/c.ll" >/dev/null 2>&1; done ; } ; } 2>&1 | tail -1 )
    progress 2 2 "this build over the corpus"
    new=$( { time { for f in "${CORPUS_FILES[@]}"; do "$BENCH_TA" --ir "$f" -o "$BENCH_WORK/c.ll" >/dev/null 2>&1; done ; } ; } 2>&1 | tail -1 )
    clear_line; rule
    printf '  %-11s %14s %14s %s\n' corpus "$ref" "$new" "$(change "$new" "$ref")"
}

run_profile(){
    heading "PROFILE"
    load_corpus || { echo "  no corpus available"; return; }
    local sweep=$BENCH_WORK/sweep.sh
    cat > "$sweep" <<EOF
#!/bin/sh
for f do "$BENCH_TA" --ir "\$f" -o "$BENCH_WORK/c.ll" >/dev/null 2>&1; done
EOF
    chmod +x "$sweep"
    if command -v perf >/dev/null 2>&1 && perf stat true >/dev/null 2>&1; then
        pulse "recording with perf"
        perf record -q -o "$BENCH_WORK/perf.data" -- "$sweep" "${CORPUS_FILES[@]}" >/dev/null 2>&1
        pulse_stop
        perf report -i "$BENCH_WORK/perf.data" --stdio --no-children -F overhead,symbol 2>/dev/null \
            | grep -E '^\s+[0-9]' | head -20 | sed 's/^/  /'
        return
    fi
    pulse "building an instrumented compiler"
    gcc -O2 -pg -w -std=gnu2x -o "$BENCH_WORK/ta-pg" "$HERE/turboada.c" -lpthread >/dev/null 2>&1
    pulse_stop
    [ -x "$BENCH_WORK/ta-pg" ] || { echo "  perf is absent and the instrumented build failed"; return; }
    pulse "profiling"
    ( cd "$BENCH_WORK" && for f in "${CORPUS_FILES[@]}"; do "$BENCH_WORK/ta-pg" --ir "$f" -o "$BENCH_WORK/c.ll" >/dev/null 2>&1; done )
    pulse_stop
    if [ -f "$BENCH_WORK/gmon.out" ] && command -v gprof >/dev/null 2>&1; then
        ( cd "$BENCH_WORK" && gprof -b -p "$BENCH_WORK/ta-pg" gmon.out 2>/dev/null | head -22 | sed 's/^/  /' )
    else echo "  no profile was produced"; fi
}

run_codegen(){
    local gnat=$1 suite=${2:-1} p a g am gm na ng oa og n=0 total=${#PROGRAM_LIST[@]} peak=0
    local outcome r note tsv='' cpus=$BENCH_CPU lpk=0 v
    local -a DIALECT
    LOAD_PEAK=0
    if [ -n "$TSV_DIR" ]; then mkdir -p "$TSV_DIR"; tsv=$TSV_DIR/suite$suite.tsv
        printf 'program\tta_med\tta_mad\tgnat_med\tgnat_mad\tdistinguishable\tratio\toutput\tsamples\tcpus\tload_peak\n' > "$tsv"
    fi
    if [ "$SUITES" -gt 1 ]
    then heading "GENERATED CODE — suite $suite of $SUITES" "median ± MAD of $CODEGEN_REPEATS interleaved repetitions, $PIN_WHY"
    else heading "GENERATED CODE" "median ± MAD of $CODEGEN_REPEATS interleaved repetitions, $PIN_WHY"; fi
    if [ "$gnat" = 1 ]
    then printf '  %-11s %15s %15s %7s  %-17s %s\n' program 'ta (s)' 'gnat (s)' ratio verdict stresses
    else printf '  %-11s %15s  %s\n' program 'ta (s)' stresses; fi
    rule
    for p in "${PROGRAM_LIST[@]}"; do
        progress $((n++)) "$total" "$p"
        if ! "$BENCH_TA" "-O$OPT" \
               "$BENCH_WORK/src/$p.ada" -o "$BENCH_WORK/$p.a83" >/dev/null 2>&1; then
            clear_line; printf '  %-11s %14s\n' "$p" "build failed"
            eval "T_$p=x G_$p=x R_${suite}_$p=- D_${suite}_$p=0"; continue
        fi
        g=x gm=x ng=0 og=''
        if concurrent "$p"
        then PIN=(${PIN_MANY[@]+"${PIN_MANY[@]}"}); cpus=$BENCH_CPUS_TASK
        else PIN=(${PIN_ONE[@]+"${PIN_ONE[@]}"});  cpus=$BENCH_CPU; fi
        load_watch_start
        if [ "$gnat" = 1 ] &&
           ( cd "$BENCH_WORK/src" && gnatmake -q "-O$OPT" "$p.adb" -o "$BENCH_WORK/$p.gnat" ) >/dev/null 2>&1
        then measure_pair "$BENCH_WORK/$p.a83" "$BENCH_WORK/$p.gnat"
             read -r g gm ng <<<"$(stats "$BENCH_WORK/samples.b")"
        else measure_pair "$BENCH_WORK/$p.a83" ''; fi
        load_watch_stop; lpk=$LOAD_LAST
        read -r a am na <<<"$(stats "$BENCH_WORK/samples.a")"
        oa=$("$BENCH_WORK/$p.a83" <"$seed" 2>&1 | head -1)
        [ "$g" = x ] || og=$("$BENCH_WORK/$p.gnat" <"$seed" 2>&1 | head -1)
        eval "T_$p=\$a G_$p=\$g AM_$p=\$am GM_$p=\$gm"
        clear_line
        if [ "$gnat" = 1 ]; then
            note=same
            if [ "$g" != x ] && [ "$oa" != "$og" ]
            then comparable "$p" && note=DIFFERS || note=representation; fi
            if distinguishable "$a" "$am" "$g" "$gm"; then
                r=$(awk -v a="$a" -v b="$g" 'BEGIN{printf "%.2f", a/b}')
                outcome=$(speedup "$a" "$g")
                case $outcome in *faster) outcome="$GOOD$outcome$OFF" ;; *slower) outcome="$BAD$outcome$OFF" ;; esac
                eval "R_${suite}_$p=\$r D_${suite}_$p=1"
            else
                r='-'; outcome="${DIM}indistinguishable$OFF"
                eval "R_${suite}_$p=- D_${suite}_$p=0"
            fi
            eval "MA_${suite}_$p=\$a MG_${suite}_$p=\$g"
            printf '  %-11s %s %s %7s  %-17s %s' "$p" "$(pm "$a" "$am")" "$(pm "$g" "$gm")" \
                "$r" "$outcome" "$(describe "$p")"
            case $note in DIFFERS) printf '  %sOUTPUT DIFFERS%s' "$BAD" "$OFF" ;;
                          representation) printf '  %s(totals differ — the standard lets a fixed point type pick its own small)%s' \
                              "$DIM" "$OFF" ;; esac
            awk -v l="$lpk" -v m="$LOAD_MAX" 'BEGIN{exit !(l+0 > m+0)}' &&
                printf '  %s! load reached %s while measuring%s' "$BAD" "$lpk" "$OFF"
            printf '\n'
            [ -n "$tsv" ] && printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s/%s\t%s\t%s\n' \
                "$p" "$a" "$am" "$g" "$gm" \
                "$(eval "printf %s \$D_${suite}_$p")" "$r" "$note" "$na" "$ng" "$cpus" "$lpk" >> "$tsv"
        else
            printf '  %-11s %s  %s\n' "$p" "$(pm "$a" "$am")" "$(describe "$p")"
            [ -n "$tsv" ] && printf '%s\t%s\t%s\t-\t-\t-\t-\t-\t%s/0\t%s\t%s\n' "$p" "$a" "$am" "$na" "$cpus" "$lpk" >> "$tsv"
        fi
    done
    clear_line
    printf '\n  %sload%s    %s at the end of suite %s, %s at its worst while measuring%s\n' \
        "$DIM" "$OFF" "$(loadavg)" "$suite" "$LOAD_PEAK" \
        "$(awk -v l="$LOAD_PEAK" -v m="$LOAD_MAX" 'BEGIN{print (l+0>m+0)?" — SOMETHING ELSE WAS RUNNING, TREAT THIS SUITE AS SUSPECT":""}')"
    [ "$gnat" = 1 ] || return 0
    heading "SIDE BY SIDE"
    for p in "${PROGRAM_LIST[@]}"; do
        eval "a=\${T_$p:-x}"; eval "g=\${G_$p:-x}"
        for v in "$a" "$g"; do
            case $v in x) ;; *) awk -v v="$v" -v m="$peak" 'BEGIN{exit !(v>m)}' && peak=$v ;; esac
        done
    done
    for p in "${PROGRAM_LIST[@]}"; do
        eval "a=\${T_$p:-x}"; eval "g=\${G_$p:-x}"; eval "n=\${D_${suite}_$p:-0}"
        [ "$a" = x ] && continue
        outcome=$(speedup "$a" "$g"); [ "$n" = 1 ] || outcome='indistinguishable'
        printf '  %-11s %s%-5s%s %s %7s  %s\n' "$p" "$BOLD" ta "$OFF" \
            "$(bar "$(scaled "$a" "$peak" 30)" 30)" "$a" "$outcome"
        [ "$g" = x ] && continue
        printf '  %-11s %s%-5s%s %s %7s\n' '' "$DIM" gnat "$OFF" \
            "$(bar "$(scaled "$g" "$peak" 30)" 30)" "$g"
    done
    return 0
}

run_codegen_suites(){
    local gnat=$1 s
    load_gate
    for ((s = 1; s <= SUITES; s++)); do run_codegen "$gnat" "$s"; done
    [ "$SUITES" -gt 1 ] && [ "$gnat" = 1 ] && run_stability
    return 0
}

run_stability(){
    local p r1 r2 d1 d2 a1 g1 a2 g2
    heading "SUITE AGAINST SUITE" "the same ratio measured twice, as the check that it is real"
    printf '  %-11s %9s %9s %10s  %s\n' program 'suite 1' 'suite 2' drift ''; rule
    for p in "${PROGRAM_LIST[@]}"; do
        eval "r1=\${R_1_$p:-x} r2=\${R_2_$p:-x} d1=\${D_1_$p:-0} d2=\${D_2_$p:-0}"
        eval "a1=\${MA_1_$p:-x} g1=\${MG_1_$p:-x} a2=\${MA_2_$p:-x} g2=\${MG_2_$p:-x}"
        [ "$r1" = x ] && continue
        if [ "$d1" != 1 ] || [ "$d2" != 1 ]; then
            printf '  %-11s %9s %9s %10s  %s\n' "$p" "$r1" "$r2" '-' \
                "$([ "$d1" = "$d2" ] && echo 'indistinguishable in both suites' \
                   || echo 'DISTINGUISHABLE IN ONE SUITE ONLY — not published')"
            continue
        fi
        awk -v p="$p" -v a1="$a1" -v g1="$g1" -v a2="$a2" -v g2="$g2" 'BEGIN{
            r1 = a1 / g1; r2 = a2 / g2; d = (r2 - r1) * 100 / r1
            printf "  %-11s %9.3f %9.3f %+9.1f%%  %s\n", p, r1, r2, d,
                ((d < 0 ? -d : d) <= 10) ? "stable" \
                                         : "UNSTABLE — NO RATIO SHOULD BE PUBLISHED FOR THIS ROW" }'
    done
}

run_memory(){
    local p c r n=0 total=${#PROGRAM_LIST[@]}
    heading "PEAK MEMORY" "megabytes"
    printf '  %-11s %14s %14s  %s\n' program "compiling it" "running it" stresses; rule
    for p in "${PROGRAM_LIST[@]}"; do
        progress $((n++)) "$total" "$p"
        c=$(peak_rss "$BENCH_TA" "-O$OPT" "$BENCH_WORK/src/$p.ada" -o "$BENCH_WORK/$p.mem")
        r=x; [ -x "$BENCH_WORK/$p.mem" ] && r=$(peak_rss "$BENCH_WORK/$p.mem")
        clear_line
        printf '  %-11s %14s %14s  %s\n' "$p" "${c:-x}" "${r:-x}" "$(describe "$p")"
    done
    clear_line
}

cpu_model(){
    if [ -r /proc/cpuinfo ]; then sed -n 's/^model name[[:space:]]*: //p' /proc/cpuinfo | head -1
    else sysctl -n machdep.cpu.brand_string 2>/dev/null; fi
}

build_flags(){
    [ -n "${ADA83_BUILD_FLAGS:-}" ] && { printf '%s\n' "$ADA83_BUILD_FLAGS"; return; }
    make -C "$HERE" -s --eval="bench-print-flags: ; @echo \$(CC) \$(CFLAGS) \$(WHOLE_PROGRAM) \$(TUNE)" \
        bench-print-flags 2>/dev/null | head -1
}

bench_header(){
    local mode=$1 gnat=$2
    printf '\n  %sta%s   %s\n' "$BOLD" "$OFF" "$("$BENCH_TA" --version 2>&1 | head -1)"
    printf '  %sbuilt%s   %s\n' "$BOLD" "$OFF" "$(build_flags)"
    if [ "$gnat" = 1 ]; then
        printf '  %sgnat%s    %s (%s)\n' "$BOLD" "$OFF" "$(gnatmake --version 2>&1 | head -1)" \
            "$(gcc --version 2>&1 | head -1)"
    elif [ -n "${gnat_note:-}" ]; then
        printf '  %sgnat%s    %s\n' "$BOLD" "$OFF" "$gnat_note"
    fi
    printf '  %shost%s    %s %s, %s cpus' "$BOLD" "$OFF" "$(uname -s)" "$(uname -m)" \
        "$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo '?')"
    [ -n "$(cpu_model)" ] && printf ', %s' "$(cpu_model)"
    printf '\n  %sload%s    %s at start (1 minute average, %s cpus)\n' "$BOLD" "$OFF" \
        "$(loadavg)" "$(nproc 2>/dev/null || echo '?')"
    case $mode in
      codegen|all) printf '  %smethod%s  benchmark programs at -O%s by both compilers; %s;\n' \
                       "$BOLD" "$OFF" "$OPT" "$PIN_WHY"
                   printf '          %s interleaved repetitions per program after %s warmup runs,\n' \
                       "$CODEGEN_REPEATS" "$CODEGEN_WARMUP"
                   printf '          reported as median ± median absolute deviation over %s suites;\n' "$SUITES"
                   printf '          a ratio is printed only where the medians differ by more than\n'
                   printf '          the sum of the two MADs (MAD floored at %ss)\n' "$FLOOR" ;;
      *)           printf '  %smethod%s  median of %s runs after %s warmup, at -O%s\n' \
                       "$BOLD" "$OFF" "$REPEATS" "$WARMUP" "$OPT" ;;
    esac
}

bench_main(){
    set +e
    case "${1:-}" in help|-h|--help) usage; exit 0 ;; esac

    local mode=${1:-all} reference=${2:-} gnat=0
    REPEATS=${REPEATS:-7} WARMUP=${WARMUP:-1} OPT=${OPT:-2}
    CORPUS=${CORPUS:-300} ONLY=${ONLY:-}
    NO_GNAT=${NO_GNAT:-0}
    CODEGEN_REPEATS=${CODEGEN_REPEATS:-25} CODEGEN_WARMUP=${CODEGEN_WARMUP:-3}
    SUITES=${SUITES:-2} RT=${RT:-0} FLOOR=${FLOOR:-0.002}
    LOAD_MAX=${LOAD_MAX:-2.0} FORCE=${FORCE:-0} NO_PIN=${NO_PIN:-0} TSV_DIR=${TSV_DIR:-}

    BENCH_TA=$(find_compiler) || BENCH_TA=$HERE/bin-$TA_HOST/ta

    BENCH_WORK=$(mktemp -d "${TMPDIR:-/tmp}/turboada-bench-XXXXXX")
    seed=$BENCH_WORK/seed
    LOAD_SAMPLES=$BENCH_WORK/load.samples
    PROGRAM_LIST=(); read -r -a PROGRAM_LIST <<<"${ONLY:-$ALL_PROGRAMS}"

    bench_pinning
    hide_cursor
    [ -x "$BENCH_TA" ] || { pulse "building the compiler"; make -C "$HERE" -s ta >/dev/null 2>&1; pulse_stop
                            BENCH_TA=$(find_compiler) || BENCH_TA=$HERE/bin-$TA_HOST/ta; }
    [ -x "$BENCH_TA" ] || die "cannot build $BENCH_TA"
    write_programs

    case $mode in codegen|all) have_gnat && gnat=1 ;; esac
    bench_header "$mode" "$gnat"

    case $mode in
        stages)  run_stages ;;
        parser)  run_parser ;;
        corpus)  run_corpus ;;
        compare) run_compare "$reference" ;;
        profile) run_profile ;;
        codegen) run_codegen_suites "$gnat" ;;
        memory)  run_memory ;;
        all)     run_stages; run_parser; run_corpus; run_codegen_suites "$gnat"; run_memory ;;
        *)       show_cursor; echo "$SELF: unknown mode '$mode'" >&2; usage >&2; exit 2 ;;
    esac
    show_cursor
    echo
}

gating(){ awk -F'\t' '($3 == "fail" && $1 != "debug") || ($3 == "skip" && $1 == "acats")' "$RESULTS_TSV"; }

show_failure_log(){
    local suite=$1 name=$2 stage
    if [[ $suite == acats ]]; then
        for stage in err out; do
            [[ -s $LOGS_DIR/$name.$stage ]] || continue
            echo "  [$stage]"; head -6 "$LOGS_DIR/$name.$stage" | sed 's/^/    /'
        done
        for stage in bind link; do
            [[ -s $LOGS_DIR/$name.$stage ]] || continue
            echo "  [$stage]"; tail -20 "$LOGS_DIR/$name.$stage" | sed 's/^/    /'
        done
    elif [[ $suite == debug ]]; then
        [[ -s $TA_LOGS/debug/$name.log ]] && grep -E '^(FAILED|PENDING|  ---|    )' "$TA_LOGS/debug/$name.log"
    elif [[ -s $TA_LOGS/$suite/$name.log ]]; then
        tail -25 "$TA_LOGS/$suite/$name.log" | sed 's/^/    /'
    fi
    return 0
}

show_first_failures(){
    local max=${CI_MAX_FAILURES:-0} suite name status detail
    gating | awk -v m="$max" 'm <= 0 || ++n <= m' |
    while IFS=$'\t' read -r suite name status detail; do
        echo "--- $suite/$name  [$status]  $detail"
        show_failure_log "$suite" "$name"
    done
}

show_debug_failures(){
    local suite name status detail
    awk -F'\t' '$1 == "debug" && $3 == "fail"' "$RESULTS_TSV" |
    while IFS=$'\t' read -r suite name status detail; do
        echo "--- debug/$name  [$status]  $detail"
        show_failure_log debug "$name"
    done
}

ci_report(){
    local summary=$RUN_DIR/test_summary.txt platform=${CI_PLATFORM:-$(uname -s)} suite missing=''
    [[ -s $summary ]] || { echo "::error::the suite produced no summary; it did not run to completion"; exit 1; }
    for suite in $CI_SUITES; do
        suite_enabled "$suite" || continue
        awk -F'\t' -v s="$suite" '$1 == s { found = 1; exit } END { exit !found }' "$RESULTS_TSV" || missing+=" $suite"
    done
    printf '\n===== suite stats (%s) =====\n' "$platform"; cat "$summary"; printf '=============================\n\n'
    [[ -n ${GITHUB_STEP_SUMMARY:-} ]] &&
        { printf '### %s\n```\n' "$platform"; cat "$summary"; printf '```\n'; } >> "$GITHUB_STEP_SUMMARY"
    if [[ -n $missing ]]; then
        echo "::error::$platform: no verdict at all from:$missing; the suite did not run to completion"
        exit 1
    fi
    n(){ awk -F'\t' -v s="$1" -v v="$2" '$1 == s && $3 == v { c++ } END { print c + 0 }' "$RESULTS_TSV"; }
    local af as xf pf bf df rf ff gf counts
    af=$(n acats fail) as=$(n acats skip) xf=$(n extensions fail) pf=$(n project fail)
    bf=$(n bonus fail) df=$(n debug fail) rf=$(n repro fail) ff=$(n fuzz fail) gf=$(n gameplay fail)
    counts="$af ACATS failed, $as never ran, $xf extension, $pf project, $bf bonus, $df debug (non-gating), $rf reproducer, $ff fuzz, $gf gameplay failures"
    #  Debug/DWARF cases depend on the host's gdb/lldb/lldb-dap/python and
    #  their Ada support, which varies by platform; a failure there is
    #  reported in full (expected vs got) but does not gate the suite.
    if ((df)); then
        echo "::warning::$platform: $df debug test(s) failed (non-gating); detail follows"
        show_debug_failures
        if [[ -n ${GITHUB_STEP_SUMMARY:-} ]]; then
            {
                printf '\n<details><summary>debug failures on %s — non-gating (host gdb/lldb/python dependent)</summary>\n\n```\n' "$platform"
                show_debug_failures
                printf '```\n</details>\n'
            } >> "$GITHUB_STEP_SUMMARY"
        fi
    fi
    ((af + as + xf + pf + bf + rf + ff + gf)) || { echo "$counts"; return 0; }
    echo "$counts"
    show_first_failures
    if [[ -n ${GITHUB_STEP_SUMMARY:-} ]]; then
        {
            printf '\n**%s**\n\n' "$counts"
            printf '<details><summary>failing tests on %s</summary>\n\n```\n' "$platform"
            show_first_failures
            printf '```\n</details>\n'
        } >> "$GITHUB_STEP_SUMMARY"
    fi
    echo "::error::$platform: $counts"
    exit 1
}

suite_of(){ case $1 in
    x|extensions) echo extensions ;;
    p|project)    echo project ;;
    b83|bonus)    echo bonus ;;
    dbg|debug)    echo debug ;;
    rp|repro)     echo repro ;;
    fz|fuzz)      echo fuzz ;;
    gp|gameplay)  echo gameplay ;;
    acats)        echo acats ;;
    *)            return 1 ;;
esac; }

main(){
    if [[ ${1:-} == bench ]]; then shift; bench_main "$@"; return; fi

    local -a args=()
    JOBS_OPTION='' ACCEPT_OPTION=0
    while (($#)); do
        case $1 in
            -j)       (($# > 1)) || die "-j needs a number of workers"; JOBS_OPTION=$2; shift 2 ;;
            -j[0-9]*) JOBS_OPTION=${1#-j}; shift ;;
            --accept) ACCEPT_OPTION=1; shift ;;
            --only)   (($# > 1)) || die "--only needs a suite list"; ONLY_SUITES=$2; shift 2 ;;
            --only=*) ONLY_SUITES=${1#--only=}; shift ;;
            --skip)   (($# > 1)) || die "--skip needs a suite list"; SKIP_SUITES=$2; shift 2 ;;
            --skip=*) SKIP_SUITES=${1#--skip=}; shift ;;
            *)        args+=("$1"); shift ;;
        esac
    done
    [[ -z $JOBS_OPTION || $JOBS_OPTION =~ ^[1-9][0-9]*$ ]] || die "-j wants a positive number, not '$JOBS_OPTION'"
    set -- ${args[@]+"${args[@]}"}

    local cmd=${1:-run} suite item title
    shift || true
    SELECTION=()
    case $cmd in
        h|help|-h|--help) usage; return ;;
        run|g|check|bless|list) SELECTION=("${@:-all}") ;;
        q)  SELECTION=("${@:-c32}") ;;
        ci) SELECTION=($CI_SUITES) ;;
        *)  suite=$(suite_of "$cmd") || { usage >&2; exit 2; }
            if [[ $suite == gameplay ]] && (($#)); then SELECTION=("gameplay/$(IFS=/; printf '%s' "$*")")
            elif (($#)); then for item; do SELECTION+=("$suite/$item"); done; else SELECTION=("$suite"); fi ;;
    esac

    if [[ $cmd == list ]]; then
        ensure_corpus || die "the test corpus is missing and tests.zip cannot be unpacked"
        discover "${SELECTION[@]}" | tr ':' '/'
        return
    fi

    engine_setup
    select_items "${SELECTION[@]}"
    case $cmd in
        check) title="CHECK" ;;
        bless) title="BLESS" ;;
        ci)    title="CI RUN" ;;
        *)     title="RUN" ;;
    esac
    run_pool "$ITEMS" "$title — ${SELECTION[*]}"
    rm -f "$ITEMS"

    case $cmd in
        check) compare_to_baseline; ((REGRESSIONS == 0)) || exit 1 ;;
        bless) write_baseline ;;
        ci)    ci_report ;;
        run|g|q) ;;
        *)     if awk -F'\t' '$3 == "fail" { found = 1 } END { exit !found }' "$RESULTS_TSV"; then exit 1; fi ;;
    esac
}
main "$@"
