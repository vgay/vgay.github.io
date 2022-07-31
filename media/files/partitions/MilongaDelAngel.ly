\version "2.22.1"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "chord-grid-JAS.ly"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
  system-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 8)
                             (padding . 0))
  oddHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \null \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} }
  } }
  evenHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} \null }
  } }
}

title = #"Milonga Del Angel"
composer = #"Astor Piazzolla"
meter = #"(Slow Tango)"
kwtempo = #"Slow"
kwstyle = #"Tango"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  %asplayed = #"" % doit être commentée si vide
  url = #""
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
    \override MultiMeasureRest #'expand-limit = #2
  }
  \context {
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  \context { \Score markFormatter = #format-mark-box-alphabet }
}


form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f

}

ossature = {
  \mark \markup { \box \bold Intro }
  \repeat unfold 2 { s1*6 \break } \mark \default %A
  \repeat unfold 4 { s1*4 \break } \mark \default %B
  \repeat unfold 4 { s1*4 \break } \mark \default %C
  \repeat unfold 3 { s1*4 \break } \mark \default \pageBreak %D
  \repeat unfold 3 { s1*4 \break } s1*6 \break \mark \default %E
  \repeat unfold 4 { s1*4 \break } \mark \default %F
  s1*4 \break s1*5 \break \mark \default %G
  \repeat unfold 3 { s1*4 \break }

}

theNotes =  \relative c' {
  \clef "treble" \key d \major \time 4/4
  b'1 | \grace { a8 } b1 |   % 3
  \grace { fis8 } b1 | \grace { fis'8 } b,1 |    % 5
  d | \grace { fis8 } cis1 | \break  % 7
  \grace { cis8 } g1 | fis |    % 9
  b ~ | b |   % 11
  \grace { a8 } b4. d8 ~ d2 ~ | d1 \bar "||"    % 13
  d2.. cis16 b | d2. cis16 d cis b |   % 15
  d2. \tuplet 3/2 { d8 cis b  } | fis1 |    % 17
  b2 ~ b8 a4 g8 | b2. a16 b a g |   % 19
  fis8 g a2. ~ | a1 |    % 21
  r8 b, e fis g4. a8 | fis16 e fis4. ~ fis4 \tuplet 3/2 { fis8 e d  } |   % 23
  d2 ~ d4. cis8 | d d fis fis b b cis cis |    % 25
  d4. cis8 e d4 cis16 b | a2. g8 a |   % 27
  fis1 ~ | fis | \bar "||"    % 29
  d'2. cis8 b | d2 cis8 d4 cis16 b |   % 31
  d2. cis8 b | fis2 ~ fis8 b, \tuplet 6/4 { cis16 d e fis g a  } |    % 33
  b2. a8 g | b4. a8 d b \tuplet 3/2 { a fis d  } |   % 35
  b1 ~ | b |    % 37
  r8 b e fis g4. a8 | fis16 e fis4. ~ fis cis8 |   % 39
  e16 cis d4. ~ d cis8 | b cis d e f fis b cis |    % 41
  d2. cis8 b | cis2. b8 ais! |   % 43
  b1 ~ | b \bar "||"    % 45
  \inlineMMRN R1 *4 \inlineMMRN R1 *3 | r2. \tuplet 3/2 { g8 gis! a!  }  % 53
  ais!4. b!8 ~ b4 c! | e16 d e4. ~ e4 \tuplet 3/2 { a,8 ais! b!  } |   % 55
  c!4. cis!8 ~ cis4 d! | g16 fis g4. ~ g2 \bar "||"    % 57
  \key es \major
  d4 es ~ es c | d8 bes g2 r8 f'16 g |   % 59
  f es d8 ~ d2 es8 c | d bes g2 r8 f16 g |    % 61
  f es d8 ~ d2. | es8 c d2 bes'4 |   % 63
  g2. \tuplet 3/2 { b,!8 c cis!  } | d4 c es g \bar "||" |    % 65
  \tuplet 3/2 { as8 c es  } as2. | g2 ~ g8 f es d |   % 67
  es16 f g8 ~ g2. ~ | g f16 es d c |    % 69
  ges! bes c d es2.| f,!16 g as c! d2.|   % 71
  \tuplet 3/2 { g,8 c d  } es2. ~| es1 ~ |  % 73
  es ~| es2 r8 e!4. ~ \bar "||"    % 75
  \key e \major
  e2. dis8 cis | e2. dis16 e dis cis |  % 77
  e2. \tuplet 3/2 { dis8 d! cis  } | gis2. a8 b |   % 79
  cis2. b8 a | cis2. b16 cis b a |    % 81
  gis8 a b2. ~ | b1 |   % 83
  r8 cis, fis gis a2 | gis2. fis8 gis |    % 85
  e2. ~ e8 e | gis4. gis8 cis4. cis8 |   % 87
  dis2. dis4 | cis2. cis4 |    % 89
  gis8 a dis4 gis,8 a cis4 ~ | cis8 fis, gis4 ~ gis ~ gis16 a gis fis \bar "||" |    % 91
  gis2. a16 gis g gis | b2. a8 gis |    % 93
  gis a fis2. ~ | fis1 |    % 95
  g2. gis8 g | dis'2 ~ dis8 cis d dis |   % 97
  gis,2 gis' ~ | gis1 ~ |   % 99
  gis2. r4 \bar "||" \key as \major
  as2. g8 f |   % 101
  as2 ~ as8 g4 f8 | as2. \tuplet 3/2 { g8 ges! f  } |   % 103
  c1 |   f2. es8 des |  % 105
  f2 ~ f8 es4 des8 | c des es2. ~ |   % 107
  es1   | bes8 c des2. |  % 109
  c16 des c bes c4 ~ c \tuplet 3/2 { bes8 as g  } | as16 g f8 ~ f4 ~ f8 as c16 c f f |   % 111
  g2. f8 g  | c,2 ~ c8\fermata r des,16\fermata d!\fermata es\fermata e!\fermata |   % 113
  f g as8 ~ as2. | des,16 es f8 ~ f2. |   % 115
  bes,16 c des8 ~ des4 ~ des2\fermata | \tuplet 3/2 { c'4 bes as  } g2\fermata
  \bar ".."
}

theNotesII =  \relative c' {
  \clef "treble" \numericTimeSignature\time 4/4 \key d \major | % 1
  \repeat percent 6 { cis1  } | % 3
  d1 ~ | d1 | % 9
  a1 |
  gis1 | % 11
  a1 | % 12
  gis1 \bar "||"
  a1 | % 14
  gis1 | % 15
  a1 | % 16
  gis1 | % 17
  g1 | % 18
  g2.  a4 | % 19
  d2  cis |
  b2  a \bar "||"
  b2.  cis8  b | % 22
  bes1 | % 23
  b1 | % 24
  b4  d ~  d  fis | % 25
  b4  a  gis  fis | % 26
  f1 | % 27
  r8  d4.  cis  b8 ~ | % 28
  b4  a ~  a4. r8 \bar "||"
  a'1 |
  gis1 | % 31
  a1 | % 32
  gis1 | % 33
  g2.  fis8  e | % 34
  es1 | % 35
  d1 | % 36
  R1 \bar "||"
  b1 | % 38
  bes1 | % 39
  a1 |
  b2.  cis8  d | % 41
  fis1 | % 42
  f2  e | % 43
  d1 ~ | % 44
  d1 \bar "||"
  r8  fis  g4
  fis8  a4  fis8 | % 46
  b16  a  b4. ~  b2 | % 47
  r8  e,  fis4  d8  e4  cis8 | % 48
  fis16  e  fis4. ~  fis2 |  % 49
  r8  gis  a4  gis8  b4  gis8 |
  cis16  b  cis4. ~  cis2 | % 51
  r8  cis,  d4  dis8  e4  e8 | % 52
  gis16  fis  gis4. ~  gis2 \bar "||"
  r8  e  f4  fis8  g4  gis8 | % 54
  b16  a  b4. ~  b2 | % 55
  r8  g  as4  a8  bes4  b8 | % 56
  d16  cis  d4. ~  d2 \bar "||"
  \key es \major
  d4 es4 ~  es  c | % 58
  d8  bes  g2 r8  f16 g16 | % 59
  f16  es  d8 ~  d2 es'8  c |
  d8  bes  g2 r8  f16  g |  % 61
  f16  es  d8 ~  d2. | % 62
  es8  c  d2  bes'4 | % 63
  g2. \times 2/3  { b,8  c  cis } | % 64
  d4  c  es  g \bar "||"
  f4.  g8 ~  g4  as | % 66
  g2.  c,8  b | % 67
  es4.  g8 ~  g4  es | % 68
  d'4.  c8 ~  c4  g |   % 69
  fis4.  fis8 ~  fis4  fis |
  f4.  f8 ~  f4  g16  f es16  f | % 71
  g4.  as8 ~  as4  g | % 72
  f4.  es8 ~  es4  d | % 73
  r8  es  d2. | % 74
  r8  es  d2. \bar "||"
  \key e \major
  b1 | % 76
  ais1 | % 77
  b1 | % 78
  ais1 | % 79
  fis'2.  e4 |
  e2  dis | % 81
  r8  cis4. r8  b4. | % 82
  r8  a4. r8  gis4. \bar "||"
  cis2.  dis8  cis | % 84
  c1 | % 85
  cis4  gis'2. | % 86
  e2  gis | % 87
  g1 | % 88
  e2.  dis8  cis | % 89
  dis1 ~ |
  dis1 \bar "||"
  d1 ~ | % 92
  d1 | % 93
  cis2  dis | % 94
  gis2  fis | % 95
  e1 ~ | % 96
  e1 | % 97
  gis2  a | % 98
  gis2  fis | % 99
  gis2. r4 \bar "||"
  \key as \major
  r4  g,2. | % 101
  r4  g2. | % 102
  r4  g2. | % 103
  r4  g2. | % 104
  r4  c2. | % 105
  r4  c2. | % 106
  c2  es | % 107
  bes'2  as \bar "||"
  r8 ^"Pizz."  des, des  des r
  f8  f  f | % 109
  r8  f  f  f r  as  as
  as8 |
  des,4.  des8  c4.  c8 | % 111
  b'2 ^"arco" es, |  % 112
  as,2 ~ as8 \fermata r r4 \fermata | % 113
  bes2 as | % 114
  des2  c | % 115
  bes2 c4. \fermata r8 | % 116
  r2 c \fermata \bar "|."
}

Basse = \relative c {
  \clef "bass" \key d \major \time 4/4
  \repeat "percent" 6 { b4. fis'8 fis4 fis,}    % 9
  \repeat "percent" 6 { b4. fis'8 fis4 fis,} \bar "||"    % 13
  \repeat "percent" 4 { b4. fis'8 fis4 fis,}    % 17
  e'4. b8 b4 e | a,4. e'8 e4 a, |   % 19
  d4. d8 cis4. cis8 | b4. b8 a4. a8 |    % 21
  g4. fis'8 e4 g, | fis4. e'8 d4 fis, |   % 23
  b4. g'8 fis4 b, | a4. g'8 fis4 a, |    % 25
  gis!4. fis'8 fis4 gis, |
  \once \override Score.RehearsalMark.self-alignment-X = #LEFT
  \mark \markup { Archet } g1 |   % 27
  fis ~ | fis |\bar "||"     % 29
  \repeat "percent" 4 { r8 b b b r b b b }   % 33
  a4. e'8 ~ e4 fis8 g | d4. a'8 a4 d, |   % 35
  g,4. d'8 e4 fis | g,2 r8 fis' e d |    % 37
  cis4. g'8 g4 cis, | fis4. g8 g4 fis |   % 39
  b,4. g'8 fis4 b, | a4. g'8 fis4 a, |    % 41
  gis!4. fis'8 fis4 gis, | cis4. g'8 fis4 fis, |   % 43
  b4. g'8 fis4 fis, | b4. g'8 fis4 fis, \bar "||"    % 45
  b4. c!8 c4 b | b4. c!8 c b g fis |   % 47
  e4. e8 e4 e | e4. b'8 ais! b fis g |    % 49
  gis!4. gis!8 gis!4 gis! | gis!4. d'8 d cis a gis |   % 51
  fis4. fis8 fis4. fis8 | fis2. \tuplet 3/2 { g8 gis! a  } |    % 53
  ais!4. ais!8 ais!4 ais! | a2. \tuplet 3/2 { a8 ais! b!  } |   % 55
  c!4. c!8 c!4 c! | c!4. g'8 ~ g4 g, \bar "||"    % 57
  \key es \major
  \repeat "percent" 8 { c4. g'8 ~ g4 as, }|\bar "||"    % 65
  f'4. es8 ~ es4 f | d4. as'8 ~ as4 g |   % 67
  c,4. es8 ~ es4 c | bes4. es8 ~ es4 a,! |   % 69
  as4. d8 ~ d4 as!  | d4. as'8 ~ as4 d, |   % 71
  g4. f8 ~ f4 es | d4. c8 ~ c4 b! |    % 73
  c4. g'8 ~ g4 g,! | c4. g'8 ~ g4 g,! \bar "||"   % 75
  \key e \major
  \repeat "percent" 4 { cis4. gis'8 gis4 gis,}
  fis'4. cis'8 cis4 fis, | b,4. fis'8 fis4 b, |   % 81
  e4. e8 dis4. dis8 | cis4. cis8 b4. b8 |   % 83
  cis4. fis8 fis4. fis,8 | gis4. fis'8 fis4. gis,8 |   % 85
  cis4. gis'8 gis4. cis,8 | b4. gis'8 gis4. b,8 |   % 87
  ais!4. g'!8 g4 ais, | dis4. g8 g4 dis |   % 89
  \repeat percent 2 { gis,4. fis'8 fis4 gis,  }   % 91
  cis4. cis8 cis4 cis | cis4. cis8 cis4 cis |    % 93
  fis4. fis8 fis4 fis | fis4. fis8 fis4 fis |     % 95
  dis4. dis8 dis4 dis | dis4. dis8 dis4 dis |  % 97
  gis,4. gis8 gis4 gis | gis4. gis8 gis4 gis |   % 99
  gis2 r4 cis16 d! dis! e \bar "||"   \key as \major
  f4. g8 g4 cis,16 d! dis! e |   % 101
  f4. g8 g4 cis,16 d! dis! e | f4. g8 g4 cis,16 d! dis! e |   % 103
  f4. g8 g4 fis,!16 g as a! | bes4. as'8 as4 b,!16 c des d! |   % 105
  es4. bes'8 bes4 e,!16 f ges! g! | as2 g |   % 107
  ges! f  | r8 bes, bes bes r as as as |    % 109
  r g g g r c c c | f4 r8 f es4 r8 es |   % 111
  d!4 r g, r | c2 ~ c8\fermata r r4\fermata |    % 113
  des2 c | bes as |   % 115
  g ges!\fermata | r f\fermata
  \bar ".."
}

PianoRH = \relative c' {
  \clef "treble" \time 4/4 \key d \major | % 1
  r8 d e a d d'4. | % 2
  r8 d,, f as d d'4. | % 3
  r8 d,, e a d d'4. | % 4
  r8 d,, f as d d'4. | % 5
  r8 b,, e g b e4. | % 6
  r8 b, d fis b d4. | % 7
  r8 cis, e g ais cis4. | % 8
  r8 cis, e g ais cis4. | % 9
  r8 d, fis cis ~ cis2 |
  r8 d f cis ~ cis2 | % 11
  r8 d fis cis ~ cis2 | % 12
  r8 d f cis ~ cis2 \bar "||"
  r8 d fis cis ~ cis2 | % 14
  r8 d f cis ~ cis2 | % 15
  r8 d fis cis ~ cis2 | % 16
  r8 d f cis ~ cis2 | % 17
  r8 d' g fis ~ fis2 | % 18
  r8 cis g' fis ~ fis2 | % 19
  fis8 ( cis4. ) e8 ( a,4. ) |
  d8 ( a4. ) cis8 ( fis,4. ) \bar "||"
  r8 <g, b e>4. r8 <g b d>4. | % 22
  r8 <ais cis fis>4. ~ <ais cis fis>4 <g ais e'>4 | % 23
  <b d>1 | % 24
  r8 <fis b d>4. ~ <fis b d>4 <a cis d fis>4 | % 25
  <b d fis b>1 | % 26
  <a d f a>1 | % 27
  r8 <b'' d fis>4. <a cis e> <g b d>8~ | % 28
  <g b d>4 <fis a cis> ~ <fis a cis>4. r8 \bar "||"
  r8 <b,, d fis> <b d fis> <b d fis> r <b d fis>8 <b d fis> <b d fis> |
  r8 <b d f> <b d f> <b d f> r <b d f>8 <b d f> <b d f> | % 31
  r8 <b d fis> <b d fis> <b d fis> r <b d fis>8 <b d fis> <b d fis> | % 32
  r8 <d fis b> <d fis b> <d fis b> r <d fis b>8 <d fis b> <d fis b> | % 33
  r8 e4. fis g8 | % 34
  r8 a4. b fis8 | % 35
  d4 e8 fis b,4. d8 | % 36
  g4 fis8 g g fis e d8 \bar "||"
  r8 g, b cis e g b8 cis | % 38
  e8 cis ais fis e2 | % 39
  r8 d' fis cis ~ cis2 |
  r8 d fis cis ~ cis2 | % 41
  r8 d fis cis ~ cis2 | % 42
  r8 b a'4 r8 bes, g'4 | % 43
  fis16 e fis4. ~ fis2 | % 44
  fis16 e fis4. ~ fis2 \bar "||"
  r8 fis, g4 fis8 a4 fis8 | % 46
  b16 a b4. ~ b2 | % 47
  r8 e, fis4 d8 e4 cis8 | % 48
  fis16 e fis4. ~ fis2 | % 49
  r8 gis a4 gis8 b4 gis8 |
  cis16 b cis4. ~ cis2 | % 51
  r8 cis, d4 dis8 e4 e8 | % 52
  gis16 fis gis4. ~ gis2 \bar "||"
  r8 e f4 fis8 g4 gis8 | % 54
  b16 a b4. ~ b2 | % 55
  r8 g as4 a8 bes4 b8 | % 56
  d16 cis d4. ~ d2 \bar "||"
  \key es \major r8 <es, g d'>4. ~ <es g d'>2 | % 58
  r8 <es ges as d>4. ~ <es ges as d>2 | % 59
  r8 <f as bes es>4. ~ <f as bes es>2 |
  r8 <es ges as d>4. ~ <es ges as d>2 | % 61
  r8 <d g d'>4. ~ <d g d'>2 | % 62
  r8 <es ges as d>4. ~ <es ges as d>2 | % 63
  r8 <f as bes f'>4. ~ <f as bes f'>2 ~ | % 64
  <f as bes f'>1 \bar "||"
  f'8 c as g' c, as8 as' c, | % 66
  f8 as, c f, f' as,8 c b | % 67
  es8 c as g' c, as8 es' c | % 68
  d'8 g, d c' g c,8 g' es | % 69
  fis8 d fis, fis' c8 fis, fis' c |
  f8 c f, f' c f,8 f' c | % 71
  g'8 d b as' d, b8 g' c, | % 72
  f8 c as es' f, as8 d g, | % 73
  es'2 r | % 74
  R1 \bar "||"
  \key e \major r8 e, gis dis ~ dis2 | % 76
  r8 e g dis ~ dis2 | % 77
  r8 e gis dis ~ dis2 | % 78
  r8 e g dis ~ dis2 | % 79
  r8 e' a gis ~ gis2 |
  r8 dis a' gis ~ gis2 | % 81
  <e gis>2 <b fis'> | % 82
  <a e'>2 <gis dis'> \bar "||"
  <fis, cis'>1 | % 84
  <c' fis>2. dis4 | % 85
  e2. ~ e8 cis' | % 86
  e4. e8 gis4. gis8 | % 87
  <e, g>1 | % 88
  <e g>2. r4 | % 89
  gis4 a gis a |
  fis4 gis2. \bar "||"
  r8 eis b' gis cis2 ~ | % 92
  cis8 d b gis cis2 | % 93
  cis8 a fis4 dis'8 a8 fis4 | % 94
  gis'8 cis, a4 fis'8 cis8 a4 | % 95
  g8 cis ais dis ~ dis2 | % 96
  g,8 dis' cis g' ~ g2 | % 97
  <gis, gis'>8 <bis bis'> <dis dis'>4 <fis, fis'>8 <bis bis'> <dis dis'>4 | % 98
  <e, e'>8 <gis gis'> <cis cis'>4 <dis, dis'>8 <a' a'> <cis cis'>4 | % 99
  <gis gis'>2. r4 \bar "||"
  \key as \major r4 <as c es g>2. | % 101
  r4 <as ces eses g>2. | % 102
  r4 <as c es g>2. | % 103
  r4 <a c d g>2. | % 104
  r4 <c des f c'>2. | % 105
  r4 <des f g c>2. | % 106
  r4 \times 2/3 { as,8 c as'} r4 \times 2/3 { bes,8 es bes' }| % 107
  r4 \times 2/3 { bes,8 es bes'} r4 \times 2/3 { a,8 es' a } \bar "||"
  r8 <bes, des f> <bes des f> <bes des f>8 r <des f bes> <des f bes> <des f bes>8 | % 109
  r8 <f bes des> <f bes des> <f bes des> r <bes, f' as>8 <bes f' as> <bes f' as> |
  <as c f>4 r8 <as c f> <c f as>4 r8 <c f as>8 | % 111
  <b d g>2 <b d g> | % 112
  <bes des as'>2 ~ <bes des as'>8 \fermata r r4 \fermata | % 113
  <des f>2 <c f> | % 114
  <des f>2 <c f> | % 115
  <des f>2 <bes c f>4. \fermata r8 | % 116
  r2 <bes c es f> \fermata \bar "|."
}

PianoLH = \relative c' {
  \clef "bass" \time 4/4 \key d \major | % 1
  a1 | % 2
  as1 | % 3
  a1 | % 4
  as1 | % 5
  g1 | % 6
  fis1 | % 7
  e1 | % 8
  e1 | % 9
  <d fis a>1 |
  <d f as>1 | % 11
  <d fis a>1 | % 12
  <d f as>1 \bar "||"
  <d fis a>1 | % 14
  <d f as>1 | % 15
  <d fis a>1 | % 16
  <d f as>1 | % 17
  e,8 b' g' d' ~ d2 | % 18
  a,8 e' g cis fis4 e | % 19
  d,8 a' d4 cis,8 a'8 cis4 |
  b,8 g' b4 a,8 fis'8 a4 \bar "||"
  g,8 d4. g8 e4. | % 22
  fis4. e8 ~ e4 fis | % 23
  b,8 a cis4 ~ cis b8 a8 | % 24
  a4. g'8 fis4 a, | % 25
  gis4. fis'8 fis4 gis, | % 26
  <g g'>1 | % 27
  r8 <b'' d fis>4. <a cis e> <g b d>8 ~ | % 28
  <g b d>4 <fis a cis> ~ <fis a cis>4. r8 \bar "||"
  r8 <b, a'> <b a'> <b a'> r <b a'>8 <b a'> <b a'> |
  r8 <b gis'> <b gis'> <b gis'> r <b gis'>8 <b gis'> <b gis'> | % 31
  r8 <b a'> <b a'> <b a'> r <b a'> <b a'>8 <b a'> | % 32
  r8 <b gis'> <b gis'> <b gis'> r <b gis'>8 <b gis'> <b gis'> | % 33
  r8 <a c e>4. <b d fis> <c e g>8 | % 34
  r8 <c es a>4. <es ges b> <a, c fis>8 | % 35
  <g d'>1 ~ | % 36
  <g d'>4 fis'8 g g fis8 e d \bar "||"
  <g, b e>1 | % 38
  <ais cis a'>1 | % 39
  r8 fis'4 fis8 ~ fis2 |
  r8 fis4 fis8 ~ fis2 | % 41
  r8 fis4 fis8 ~ fis2 | % 42
  r8 b4. r8 ais4. | % 43
  cis16 b cis4 g8 fis4 d | % 44
  cis'16 b cis4 g8 fis4 d \bar "||"
  r8 <a' cis es> <a cis es>4 <a cis es>8 <cis es fis>4 <a cis es>8 | % 46
  <cis es fis>8 <cis es fis>4. ~ <cis es fis>2 | % 47
  r8 <g b> <g b>4 <g b>8 <g b>4 r8 | % 48
  <g b>8 <g b>4. ~ <g b>2 | % 49
  r8 <b d fis> <b d fis>4 <b d fis>8 <d fis gis>4 <b d fis>8 |
  <d fis gis>8 <d fis gis>4. ~ <d fis gis>2 | % 51
  r8 <cis, fis a> <d fis a>4 <dis fis a>8 <e a cis>4 <e a cis>8 | % 52
  <gis a cis>8 <gis a cis>4. ~ <gis a cis>2 \bar "||"
  r8 <e a c> <f a c>4 <fis c' e>8 <g c e>4 <gis c e>8 | % 54
  <b c e>8 <b c e>4. ~ <b c e>2 | % 55
  r8 <g c es> <as c es>4 <a c es>8 <bes es g>4 <b es g>8 | % 56
  <d es g>8 <d es g>4. ~ <d es g>2 \bar "||"
  \key es \major <c,, g'>4. <c g'>8 ~ <c g'>4 <c g'>4 | % 58
  <c g'>4. <c g'>8 ~ <c g'>4 <c g'> | % 59
  <c g'>4. <c g'>8 ~ <c g'>4 <c g'> |
  <c g'>4. <c g'>8 ~ <c g'>4 <c g'> | % 61
  <c g'>4. <c g'>8 ~ <c g'>4 <c g'> | % 62
  <c g'>4. <c g'>8 ~ <c g'>4 <c g'> | % 63
  <c g'>4. <c g'>8 ~ <c g'>4 <c g'> | % 64
  <c g'>4. <c g'>8 ~ <c g'>4 <c g'> \bar "||"
  f'4. g8 ~ g4 as | % 66
  g2. c,8 b | % 67
  es4. g8 ~ g4 es | % 68
  d'4. c8 ~ c4 g | % 69
  fis4. fis8 ~ fis4 fis |
  f4. f8 ~ f4 g16 f es16 f | % 71
  g4. as8 ~ as4 g | % 72
  f4. es8 ~ es4 d | % 73
  r8 es ~ <d es>2. | % 74
  r8 es ~ <d es>2. \bar "||"
  \key e \major <e gis b>2 r | % 76
  <e g ais>2 r | % 77
  <e gis b>2 r | % 78
  <e g ais>2 r | % 79
  fis,8 cis' a' e' ~ e2 |
  b,8 fis' a dis gis4 fis | % 81
  e,,8 b' e4 dis,8 b' dis4 | % 82
  cis,8 a' cis4 b,8 gis' b4 \bar "||"
  cis2. dis8 cis | % 84
  c1 | % 85
  cis2. ~ cis8 gis' | % 86
  cis4. cis8 e4. e8 | % 87
  <ais, cis>1 | % 88
  <ais cis>2. r4 | % 89
  c2 cis |
  dis2 cis4 c \bar "||"
  b4 dis cis2 | % 92
  d2 cis | % 93
  cis,8 fis a4 dis,8 fis cis'4 | % 94
  gis8 a fis'4 fis,8 cis'8 fis4 | % 95
  g,8 cis ais dis ~ dis2 | % 96
  g,8 dis' cis g' ~ g2 | % 97
  <gis, dis' fis>2 <fis bis dis> | % 98
  <e gis cis>2 <dis a' cis> | % 99
  gis2. <cis,, gis'>16 <d a'> <dis ais'>16 <e b'> \bar "||"
  \key as \major c'4 g' ~ g as,16 a16 bes b | % 101
  c4 g' ~ g as,16 a bes16 b | % 102
  c4 g' ~ g as,16 a bes16 b | % 103
  c4 g' ~ g fis16 g as16 a | % 104
  bes,4 as' ~ as b,16 c des16 d | % 105
  es4 bes' ~ bes e,16 f16 ges g | % 106
  as,8 es' r4 as,8 es' r4 | % 107
  as,8 es' r4 f,8 es' r4 \bar "||"
  r8 <bes des> <bes des> <bes des> r <as f'>8 <as f'> <as f'> | % 109
  r8 <g bes> <g bes> <g bes> r <c, as'>8 <c as'> <c as'> |
  <f c'>4 r8 <f c'> <es f'>4 r8 <es f'>8 | % 111
  <d f'>2 <g f'> | % 112
  <c, e'>2 ~ <c e'>8 \fermata r r4 \fermata | % 113
  as'2 as | % 114
  as2 as | % 115
  bes2 f4. \fermata r8 | % 116
  r2 <f c' g'> \fermata \bar "|."
}

GuitarI = \relative d {
 \clef "treble_8" \time 4/4 \key d \major | % 1
 r8 d e a8 d d'4. | % 2
 r8 d,, f as d d'4. | % 3
 r8 d,, e a d d'4. | % 4
 r8 d,, f as d d'4. | % 5
 r8 b,, e g b e4. | % 6
 r8 b, d fis b d4. | % 7
 r8 cis, e g ais cis4.| % 8
 r8 cis, e g ais cis4. | % 9
 r8 d fis cis ~ cis2 |
 r8 d f cis ~ cis2 | % 11
 r8 d fis cis ~ cis2 | % 12
 r8 d f cis ~ cis2 \bar "||"
 r8 d fis cis ~ cis2 | % 14
 r8 d f cis ~ cis2 | % 15
 r8 d fis cis ~ cis2 | % 16
 r8 d f cis ~ cis2 | % 17
 r8 d g fis ~ fis2 | % 18
 r8 cis g' fis ~ fis2 | % 19
 fis8 ( cis4. ) e8 ( a,4. ) |
 d8 ( a4. ) cis8 ( fis,4. ) \bar "||"
 r8 <g b e>4. r8 <g b d>4. | % 22
 r8 <ais cis fis>4. ~ <ais cis fis>4 <g ais e'>4 | % 23
 <b d>1 | % 24
 r8 <fis b d>4. ~ <fis b d>4 <a cis d fis>4 | % 25
 <b d fis b>1 | % 26
 <a d f a>1 | % 27
 r8 <b' d fis>4. <a cis e> <g b d>8 ~ | % 28
 <g b d>4 <fis a cis> ~ <fis a cis>4. r8 \bar "||"
 r8 <b, d fis> <b d fis>8 <b d fis> r <b d fis> <b d fis>8 <b d fis> |
 r8 <b d f> <b d f> <b d f> r <b d f>8 <b d f> <b d f> | % 31
 r8 <b d fis> <b d fis> <b d fis> r <b d fis>8 <b d fis> <b d fis> | % 32
 r8 <d fis b> <d fis b> <d fis b> r <d fis b>8 <d fis b> <d fis b> | % 33
 r8 e4. fis g8 | % 34
 r8 a4. b fis8 | % 35
 d4 e8 fis b,4. d8 | % 36
 g4 fis8 g g fis e d8 \bar "||"
 r8 g, b cis e g b8 cis | % 38
 e8 cis ais fis  e2 | % 39
 r8 d fis cis ~ cis2 |
 r8 d fis cis ~ cis2 | % 41
 r8 d fis cis ~ cis2 | % 42
 r8 b a'4 r8 bes, g'4 | % 43
 fis16 e fis4. ~ fis2 | % 44
 fis16 e fis4. ~ fis2 \bar "||"
 r8 fis g4 fis8 a4 fis8 | % 46
 b16 a b4. ~ b2 | % 47
 r8 e, fis4 d8 e4 cis8 | % 48
 fis16 e fis4. ~ fis2 | % 49
 r8 gis a4 gis8 b4 gis8 |
 cis16 b cis4. ~ cis2 | % 51
 r8 cis, d4 dis8 e4 e8 | % 52
 gis16 fis gis4. ~ gis2 \bar "||"
 r8 e f4 fis8 g4 gis8 | % 54
 b16 a b4. ~ b2 | % 55
 r8 g as4 a8 bes4 b8 | % 56
 d16 cis d4. ~ d2 \bar "||"
 \key es \major r8 <es, g d'>4.~ <es g d'>2 | % 58
 r8 <es ges as d>4. ~ <es ges as d>2 | % 59
 r8 <f as bes es>4. ~ <f as bes es>2 |
 r8 <es ges as d>4. ~ <es ges as d>2 | % 61
 r8 <d g d'>4. ~ <d g d'>2 | % 62
 r8 <es ges as d>4. ~ <es ges as d>2 | % 63
 r8 <f as bes f'>4. ~ <f as bes f'>2 ~ | % 64
 <f as bes f'>1 \bar "||"
 f8 c as g' c, as8 as' c, | % 66
 f8 as, c f, f' as,8 c b | % 67
 es8 c as g' c, as8 es' c | % 68
 d'8 g, d c' g c,8 g' es | % 69
 fis8 d fis, fis' c8 fis, fis' c |
 f8 c f, f' c f,8 f' c | % 71
 g'8 d b as' d, b8 g' c, | % 72
 f8 c as es' f, as8 d g, | % 73
 es'2 r | % 74
 R1 \bar "||"
 \key e \major
 r8 e gis dis8 ~ dis2 | % 76
 r8 e g dis ~ dis2 | % 77
 r8 e gis dis ~ dis2 | % 78
 r8 e gis dis ~ dis2 | % 79
 r8 e a gis ~ gis2 |
 r8 dis a' gis ~ gis2 | % 81
 <e gis>2 <b fis'> | % 82
 <a e'>2 <gis dis'> \bar "||"
 <fis cis'>1 | % 84
 <c' fis>2. dis4 | % 85
 e2. ~ e8 cis' | % 86
 e,4. e8 gis4. gis8 | % 87
 <e g>1 | % 88
 <e g>2. r4 | % 89
 gis4 a gis a |
 fis4 gis2. \bar "||"
 eis,8 b' gis cis ~ cis2 | % 92
 dis8 b gis cis ~ cis2 | % 93
 cis'8 a fis4 dis'8 a8 fis4 | % 94
 gis'8 cis, a4 fis'8 cis8 a4 | % 95
 g,8 cis ais dis ~ dis2 | % 96
 g,8 dis' cis g' ~ g2 | % 97
 gis8 bis dis4 fis,8 bis8 dis4 | % 98
 e,8 gis cis4 dis,8 a'8 cis4 | % 99
 gis2. gis,16 a ais b \bar "||"
 \key as \major
 r4 <as c es g>2. | % 101
 r4 <as ces eses g>2. | % 102
 r4 <as c es g>2. | % 103
 r4 <a c d g>2. | % 104
 r4 <c des f c'>2. | % 105
 r4 <des f g c>2. | % 106
 r4  \times 2/3 { as8 c as' } r4  \times 2/3 { bes,8 es bes' } | % 107
 r4  \times 2/3 { bes,8 es bes' } r4  \times 2/3 { a,8 es' a } \bar "||"
 r8 <bes, des f> <bes des f> <bes des f>8 r <des f bes> <des f bes> <des f bes>8 | % 109
 r8 <f bes des> <f bes des> <f bes des> r <bes, f' as>8 <bes f' as> <bes f' as> |
 <as c f>4 r8 <as c f> <c f as>4 r8  <c f as>8 | % 111
 <b d g>2 <b d g> | % 112
 <bes des as'>2 ~  <bes des as'>8 \fermata r8 r4 \fermata   | % 113
  <des f>2 <c f> | % 114
 <des f>2 <c f> | % 115
 <des f>2  <bes c f>4. \fermata r8 | % 116
  r2  <bes c es f> \fermata \bar ".."
}

GuitarII = \relative a {
 \clef "treble_8" \time 4/4 \key d \major | % 1
 a1 | % 2
 as1 | % 3
 a1 | % 4
 as1 | % 5
 g1 | % 6
 fis1 | % 7
 <e g bes cis>1 ~ | % 8
 <e g bes cis>1 | % 9
 <d fis a>1  |
 <d f as>1 | % 11
 <d fis a>1 | % 12
 <d f as>1 \bar "||"
 <d fis a>1 | % 14
 <d f as>1 | % 15
 <d fis a>1 | % 16
 <d f as>1 | % 17
 e,8 b' g' d' ~ d2 | % 18
 a,8 e' g cis fis4 e | % 19
 d,8 a' d4 cis,8 a'8 cis4 |
 b,8 g' b4 a,8 fis'8 a4 \bar "||"
 g8 d4. g8 e4. | % 22
 fis4. e8 ~ e4 fis | % 23
 b,8 a cis4 ~ cis b8 a8 | % 24
 a4. g'8 fis4 a, | % 25
 gis4. fis'8 fis4 gis, | % 26
 <g g'>1 | % 27
 r8 <b' d fis>4. <a cis e> <g b d>8 ~ | % 28
 <g b d>4 <fis a cis> ~ <fis a cis>4. r8 \bar "||"
 r8 <b, a'> <b a'> <b a'> r <b a'>8 <b a'> <b a'> |
 r8 <b gis'> <b gis'> <b gis'> r <b gis'>8 <b gis'> <b gis'> | % 31
 r8 <b a'> <b a'> <b a'> r <b a'> <b a'>8 <b a'> | % 32
 r8 <b gis'> <b gis'> <b gis'> r <b gis'>8 <b gis'> <b gis'> | % 33
 r8  <a' c e>4. <b d fis> <c e g>8 | % 34
 r8 <c es a>4. <es ges b> <a, c fis>8 | % 35
 <g d'>1 ~ | % 36
 <g d'>4 fis8 g g fis8 e d \bar "||"
 <g b e>1 | % 38
 <ais cis a'>1 | % 39
 r8 <fis b d>4 <fis b cis>8 ~ <fis b cis>2 |
 r8 <fis b d>4 <fis b cis>8 ~ <fis b cis>2 | % 41
 r8 <fis b d>4 <fis b cis>8 ~ <fis b cis>2 | % 42
 r4 <f a> r <e g> | % 43
 cis'16 b cis4 g8 fis4 d4 | % 44
 cis'16 b cis4 g8 fis4 d4 \bar "||"
 r8 <a' cis es> <a cis es>4 <a cis es>8 <cis es fis>4 <a cis es>8 | % 46
 <cis es fis>8 <cis es fis>4. ~ <cis es fis>2 | % 47
 r8 <g b> <g b>4 <g b>8 <g b>4 r8 | % 48
 <g b>8 <g b>4. ~ <g b>2 | % 49
 r8 <b d fis> <b d fis>4 <b d fis>8 <d fis gis>4 <b d fis>8 |
 <d fis gis>8 <d fis gis>4. ~ <d fis gis>2 | % 51
 r8 <cis, fis a> <d fis a>4 <dis fis a>8 <e a cis>4 <e a cis>8 | % 52
 <gis a cis>8 <gis a cis>4. ~ <gis a cis>2 \bar "||"
 r8 <e a c> <f a c>4 <fis c' e>8 <g c e>4 <gis c e>8 | % 54
 <b c e>8 <b c e>4. ~ <b c e>2 | % 55
 r8 <g c es> <as c es>4 <a c es>8 <bes es g>4 <b es g>8 | % 56
 <d es g>8 <d es g>4. ~ <d es g>2 \bar "||"
 \key es \major <c, g'>4. <c g'>8 ~ <c g'>4 <c g'> | % 58
 <c g'>4. <c g'>8 ~ <c g'>4 <c g'> | % 59
 <c g'>4. <c g'>8 ~ <c g'>4 <c g'> |
 <c g'>4. <c g'>8 ~ <c g'>4 <c g'> | % 61
 <c g'>4. <c g'>8 ~ <c g'>4 <c g'> | % 62
 <c g'>4. <c g'>8 ~ <c g'>4 <c g'> | % 63
 <c g'>4. <c g'>8 ~ <c g'>4 <c g'> | % 64
 <c g'>4. <c g'>8 ~ <c g'>4 <c g'> \bar "||"
 \inlineMMRN R1*4  \inlineMMRN R1*6 \bar "||"
 \key e \major
 <e gis b>2 r | % 76
 <e g ais>2 r | % 77
 <e gis b>2 r | % 78
 <e g ais>2 r | % 79
 fis,8 cis' a' e' ~ e2 |
 b,8 fis' a dis  gis4 fis | % 81
 e,8 b' e4 dis,8 b' dis4 | % 82
 cis,8 a' cis4 b,8 gis' b4 \bar "||"
 cis,2. dis8 cis | % 84
 c1 | % 85
 cis2. ~ cis8 gis' | % 86
 cis4. cis8 e4. e8 | % 87
 <ais, cis>1 | % 88
 <ais cis>2. r4 | % 89
 c2 cis |
 dis2 cis4 c \bar "||"
 b4 dis cis2 | % 92
 d2 cis | % 93
 cis,8 fis a4 dis,8 fis cis'4 | % 94
 gis8 a fis'4 fis,8  cis'8 fis4 | % 95
 g,8 cis ais dis ~ dis2 | % 96
 g,8 dis' cis g' ~ g2 | % 97
 <gis, dis' fis>2 <fis bis dis> | % 98
 <e gis cis>2 <dis a' cis> | % 99
 gis2. cis,16 d dis e \bar "||"
 \key as \major c4 g' ~ g as,16 a16 bes b | % 101
 c4 g' ~ g as,16 a bes16 b | % 102
 c4 g' ~ g as,16 a bes16 b | % 103
 c4 g' ~ g fis16 g as16 a | % 104
 bes,4 as' ~ as b,16 c des16 d | % 105
 es4 bes' ~ bes e,16 f ges16 g | % 106
 as,8 es' c'4 as,8 es' bes'4 | % 107
 as,8 es' bes'4 f,8 es' a4 \bar "||"
 r8 <bes des> <bes des> <bes des> r <as f'>8 <as f'> <as f'> | % 109
 r8 <g bes> <g bes> <g bes> r <c, as'>8 <c as'> <c as'> |
 <f c'>4 r8 <f c'> <es f'>4 r8 <es f'>8 | % 111
 <d f'>2 <g f'> | % 112
 <c, e'>2 ~ <c e'>8 \fermata r r4 \fermata | % 113
 as'2 as | % 114
 as2 as | % 115
 bes2 f4. \fermata r8 | % 116
 r2 <f c' g'> \fermata \bar ".."
}

TenorSax = \relative dis'' {
 \clef "treble" \time 4/4 \key d \major
 \repeat percent 6 { cis1 } | % 2
 d1 ~ | % 8
 d1 | % 9
 a1 |
 gis1 | % 11
 a1 | % 12
 gis1 \bar "||"
 a1 | % 14
 gis1 | % 15
 a1 | % 16
 gis1 | % 17
 g1 | % 18
 g2. a4 | % 19
 d2 cis |
 b2 a \bar "||"
 b2. cis8 b | % 22
 bes1 | % 23
 b1 | % 24
 b4 d ~ d fis | % 25
 b4 a gis fis | % 26
 f1 | % 27
 r8 d4. cis b8 ~ | % 28
 b4 a ~ a4. r8 \bar "||"
 a'1 |
 gis1 | % 31
 a1 | % 32
 gis1 | % 33
 g2. fis8 e | % 34
 es1 | % 35
 d1 | % 36
 R1 \bar "||"
 b1 | % 38
 bes1 | % 39
 a1 |
 b2. cis8 d | % 41
 fis,1 | % 42
 f2 e | % 43
 d1 ~ | % 44
 d1 \bar "||"
 r8 fis g4 fis8 a4 fis8 | % 46
 b16 a b4. ~ b2 | % 47
 r8 e, fis4 d8 e4 cis8 | % 48
 fis16 e fis4. ~ fis2 | % 49
 r8 gis a4 gis8 b4 gis8 |
 cis16 b cis4. ~ cis2 | % 51
 r8 cis, d4 dis8 e4 e8 | % 52
 gis16 fis gis4. ~ gis2 \bar "||"
 r8 e f4 fis8 g4 gis8 | % 54
 b16 a b4. ~ b2 | % 55
 r8 g as4 a8 bes4 b8 | % 56
 d16 cis d4. ~ d2 \bar "||"
 \key es \major d4 es ~ es c | % 58
 d8 bes g2 r8 f16 g | % 59
 f16 es d8 ~ d2 es'8 c8 |
 d8 bes g2 r8 f16 g | % 61
 f16 es d8 ~ d2. | % 62
 es8 c d2 bes'4 | % 63
 g2. \times 2/3 { b,8 c cis } | % 64
 d4 c es g \bar "||"
 f4. g8 ~ g4 as | % 66
 g2. c,8 b | % 67
 es4. g8 ~ g4 es | % 68
 d'4. c8 ~ c4 g | % 69
 fis4. fis8 ~ fis4 fis |
 f4. f8 ~ f4 g16 f es16 f | % 71
 g4. as8 ~ as4 g | % 72
 f4. es8 ~ es4 d | % 73
 r8 es d2. | % 74
 r8 es d2. \bar "||"
 \key e \major b'1 | % 76
 ais1 | % 77
 b1 | % 78
 ais1 | % 79
 fis'2. e4 |
 e2 dis | % 81
 r8 cis4. r8 b4. | % 82
 r8 a4. r8 gis4. \bar "||"
 cis2. dis8 cis | % 84
 c1 | % 85
 cis4 gis'2. | % 86
 e2 gis | % 87
 g1 | % 88
 e2. dis8 cis | % 89
 dis1 ~ |
 dis1 \bar "||"
 d1 ~ | % 92
 d1 | % 93
 cis2 dis | % 94
 gis2 fis | % 95
 e1 ~ | % 96
 e1 | % 97
 gis,2 a | % 98
 gis2 fis | % 99
 gis2. r4 \bar "||"
 \key as
 \major r4 g2. | % 101
 r4 g2. | % 102
 r4 g2. | % 103
 r4 g2. | % 104
 r4 c2. | % 105
 r4 c2. | % 106
 c2 es | % 107
 bes'2 as \bar "||"
 r8 des,  des des r f f f8 | % 109
 r8 f f f r as as as8 |
 des,4. des8 c4. c8 | % 111
 b2 es, | % 112
 as2 ~ as8 \fermata r r4 \fermata | % 113
 bes2 as | % 114
 des2 c | % 115
 bes2 c4. \fermata r8 | % 116
 r2 c \fermata \bar ".."
}

\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #4
    print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
  \bookpart {
    \header { meter = \markup \pad-around #1 \fontsize #1 \with-color #red "Violon part page 5" }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Devnull \ossature
        \new Devnull { s1*28 \pageBreak }
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
            Bandoneon
        } }
        \theNotes
      >>
  } }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Devnull \ossature
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
            Violon
        } }
        { \theNotesII \label #'theLastPage }
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #4
    print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \header { meter = \markup \pad-around #1 \fontsize #1 \with-color #red "Tenor Sax part page 5" }
    \score {
      <<
        \new Devnull \ossature
        \new Devnull { s1*28 \pageBreak }
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
            Bandoneon
        } }
        \transpose c d \theNotes
      >>
  } }
  \bookpart {
    \score {
      <<
        \new Devnull \ossature
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
            "T. Sax"
        } }
        { \transpose c d \TenorSax \label #'theLastPage }
      >>
} } }


\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #4
    print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \header { meter = \markup \pad-around #1 \fontsize #1 \with-color #red "Violon part page 5" }
    \score {
      <<
        \new Devnull \ossature
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
            Bandoneon
        } }
        \naturalizeMusic \transpose c a \theNotes
      >>
  } }
  \bookpart {
    \score {
      <<
        \new Devnull \ossature
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
            Violon
        } }
        { \naturalizeMusic \transpose c a \theNotesII  \label #'theLastPage }
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    print-first-page-number = ##t
    page-count = #2
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \header { meter = \markup \pad-around #1 \fontsize #1 \with-color #red "Violon part page 3" }
    \score {
      <<
        \new Devnull \ossature
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
            Bandoneon
        } }
        \theNotes
      >>
  } }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Devnull \ossature
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
            Violon
        } }
        { \theNotesII \label #'theLastPage }
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #2
    print-first-page-number = ##t
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \header { meter = \markup \pad-around #1 \fontsize #1 \with-color #red "Tenor Sax part page 3" }
    \score {
      <<
        \new Devnull \ossature
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
            Bandoneon
        } }
        \transpose c d \theNotes
      >>
  } }
  \bookpart {
    \score {
      <<
        \new Devnull \ossature
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
            "T. Sax"
        } }
        { \transpose c d \TenorSax \label #'theLastPage }
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #2
    print-first-page-number = ##t
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \header { meter = \markup \pad-around #1 \fontsize #1 \with-color #red "Violon part page 3" }
    \score {
      <<
        \new Devnull \ossature
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
            Bandoneon
        } }
        \naturalizeMusic \transpose c a \theNotes
      >>
  } }
  \bookpart {
    \score {
      <<
        \new Devnull \ossature
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
            Violon
        } }
        { \naturalizeMusic \transpose c a \theNotesII \label #'theLastPage }
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #2
    print-first-page-number = ##t
  }
  #(define output-suffix "Bassa4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Devnull \ossature
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.F_change" " "}
            "Double Bass"
        } }
        { \Basse \label #'theLastPage }
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #4
    print-first-page-number = ##t
  }
  #(define output-suffix "BassTab")
  \bookpart {
    \score {
      <<
        \new Devnull \ossature
        \new ChordNames { \harmonies }
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.F_change" " "}
            "Double Bass"
        } }
        { \Basse \label #'theLastPage }
      >>
} } }



\book {
  \paper {
    #(set-paper-size "a4")
    print-first-page-number = ##t
    page-count = #2
  }
  #(define output-suffix "Guitara4")
  \bookpart {
    \header { meter = \markup \pad-around #1 \fontsize #1 \with-color #red "Guitar part II page 3" }
    \score {
      <<
        \new Devnull \ossature
          \new Staff \with { instrumentName = "Guitar 1" } \GuitarI
       >>
} }
  \bookpart {
    \score {
      <<
        \new Devnull \ossature
          \new Staff  \with { instrumentName = "Guitar 2" } { \GuitarII \label #'theLastPage }
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    print-first-page-number = ##t
    page-count = #4
  }
  #(define output-suffix "GuitarTab")
  \bookpart {
    \header { meter = \markup \pad-around #1 \fontsize #1 \with-color #red "Guitar part II page 5" }
    \score {
      <<
        \new Devnull \ossature
          \new Staff \with { instrumentName = "Guitar 1" } \GuitarI
       >>
} }
  \bookpart {
    \score {
      <<
        \new Devnull \ossature
          \new Staff  \with { instrumentName = "Guitar 2" } { \GuitarII \label #'theLastPage }
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    print-first-page-number = ##t
    oddHeaderMarkup = \markup {
      \on-the-fly \print-page-number-check-first {
        \fill-line { \null \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "00" "?"} }
    } }
    evenHeaderMarkup = \markup {
      \on-the-fly \print-page-number-check-first {
        \fill-line { \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "00" "?"} \null }
    } }
  }
  #(define output-suffix "Da4")

  \bookpart {
    \score {
      <<
        \new Devnull \ossature
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = Bandoneon shortInstrumentName = "B." } \theNotes
          \new Staff \with { instrumentName = Violon shortInstrumentName = "V." } \theNotesII
          \new PianoStaff \with { instrumentName = Piano shortInstrumentName = "P." } <<
            \new Staff \PianoRH
            \new Staff { \PianoLH \label #'theLastPage } >>
          \new Staff \with { instrumentName = "Double Bass" shortInstrumentName = "D.B." }
          { \Basse \label #'theLastPage }
      >> >>
      \layout {
        \context {
          \Score
          \override Clef #'break-visibility = #'#(#f #f #t)
          \override KeySignature #'break-visibility = #'#(#f #f #t)
      } }
} } }
