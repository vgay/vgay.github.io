
\version "2.22.1"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "BookPartPagesNumber.ly"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##t
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 20)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 20)
                            (minimum-distance . 15)
                            (padding . 2))
  print-first-page-number = ##f
}

title = #"My Favorite Things (latin)"
composer = #"Richard Rogers"
meter = #"(Med. Latin)"
kwtempo = #"Medium"
kwstyle = #"Latin"

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
  % asplayed = #"" % doit être commentée si vide
  url = #""
  arranger = \markup \small "arr. Vincent Gay"
  tagline = ##f
}

\layout {
  short-indent = 3\mm
  \context {
    \Score
    %voltaSpannerDuration = #(ly:make-moment 4 4)
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
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}

ossature =  \relative c {
  \set Score.markFormatter = #format-mark-box-letters
  \time 4/4 %\autoPageBreaksOff
  \mark \markup { \box \bold { Intro } } s1*8 \break \bar "[|:"
  \mark #1 s1*8 \break s1*8 \break \bar "||"
  \mark \markup { \box \bold { "Interlude 1" } } s1*4 \break \bar ":|]"
  \mark \markup \bold { \box { B } \with-color #red \musicglyph "scripts.varsegno"  } 
  %\autoPageBreaksOff
  s1*8 \break s1*8 \break \bar "||"
  \mark #3 s1*8 \break s1*8 \break \bar "||"
  \doubleMark 
  \markup { \with-color #red { "To Coda" \raise #0.6 \musicglyph "scripts.varcoda"} }
  \markup  { \box \bold "Interlude 2" }
  s1*4 \break \bar "|."
  \mark-y-dir #`( (,left . ,DOWN) (,center . ,DOWN) )
  \doubleMark 
  \markup \with-color #red { "Solos on " \box C " and " \box "Interlude 2"" then D.S. al Coda" }
  \markup {  \bold \larger \center-column {\pad-markup #2 " "  \pad-markup #0 \with-color #red \musicglyph "scripts.varcoda"} }
  s1*6 
  \bar ".."
}

ossatureGuit =  \relative c {
  \set Score.markFormatter = #format-mark-box-letters
  \time 4/4 
  \mark \markup { \box \bold { Intro } } s1*8 \break \bar "[|:"
  \mark #1 s1*8 \break s1*8 \break \bar "||"
  \mark \markup { \box \bold { "Interlude 1" } } s1*4 \break \bar ":|]"
  \label #'SegnoG
  \mark \markup \bold { \box { B } \with-color #red \musicglyph "scripts.varsegno"  } s1*8 \break s1*8 \break \bar "||"
  \mark #3 s1*8 \break s1*8 \break \bar "||"
  \doubleMark 
  \markup { \with-color #red { "To Coda" \raise #0.6 \musicglyph "scripts.varcoda"} }
  \markup  { \box \bold "Interlude 2" }
  s1*4 \break \bar "|."
  \mark-y-dir #`( (,left . ,DOWN) (,center . ,DOWN) )
  \doubleMark 
  \markup { \with-link #'SegnoG { \with-color #red { "Solos on " \box C " and " \box "Interlude 2"" then D.S. al Coda" } }}
  \markup {  \bold \larger \center-column {\pad-markup #2 " "  \pad-markup #0 \with-color #red \musicglyph "scripts.varcoda"} }
  s1*6 
  \bar ".."
}


ossatureHorns =  \relative c {
  \autoPageBreaksOff
  \set Score.markFormatter = #format-mark-box-letters
  \time 4/4 
  \mark \markup { \box \bold { Intro } } s1*8 \break \bar "[|:"
  \mark #1 s1*8 \break s1 \autoBreaksOff s1*6 \autoBreaksOn s1 \break \bar "||"
  \mark \markup { \box \bold { "Interlude 1" } } s1*4 \break \bar ":|]"
  \mark \markup \bold { \box { B } \with-color #red \musicglyph "scripts.varsegno"  } 
  s1*8 \autoPageBreaksOn \break s1*8 \break \bar "||"
  \mark #3 s1*8 \break s1*8 \break \bar "||"
  \doubleMark 
  \markup { \with-color #red { "To Coda" \raise #0.6 \musicglyph "scripts.varcoda"} }
  \markup  { \box \bold { "Interlude 2" } \small " (played as background during solos)"  }
  s1*4 \break \bar "|."
  \mark-y-dir #`( (,left . ,DOWN) (,center . ,DOWN) )
  \doubleMark 
  \markup  \with-color #red { "Solos on " \box C " and " \box "Interlude 2"" then D.S. al Coda" }
  \markup {  \bold \larger \center-column {\pad-markup #1 " "  \with-color #red \musicglyph "scripts.varcoda"} }
  s1*6 
 
  \bar ".."
}

ossatureCond =  \relative c {
  \set Score.markFormatter = #format-mark-box-letters
  \time 4/4 
  \mark \markup { \box \bold { Intro } } s1*8 \break \bar "[|:"
  \mark #1 s1*8 \break s1*8 \break \bar "||"
  \mark \markup { \box \bold { "Interlude 1" } } s1*4 \break \bar ":|]"
  \mark \markup \bold { \box { B } \with-color #red \musicglyph "scripts.varsegno"  } s1*8 \break s1*8 \break \bar "||"
  \mark #3 s1*8 \break s1*8 \break \bar "||"
  \doubleMark 
  \markup { \page-link #15 { \with-color #red { "To Coda" \raise #0.6 \musicglyph "scripts.varcoda"} } }
  \markup  { \box \bold { "Interlude 2" } \small " (played as background during solos)"  }
  s1*4 \break \bar "|."
  \mark-y-dir #`( (,left . ,DOWN) (,center . ,DOWN) )
  \doubleMark 
  \markup \page-link #6 { \with-color #red { "Solos on " \box C " and " \box "Interlude 2"" then D.S. al Coda" } }
  \markup {  \bold \larger \center-column {\pad-markup #2 " "  \pad-markup #0 \with-color #red \musicglyph "scripts.varcoda"} }
  s1*6 
  \bar ".."
}


ossaturePiano =  \relative c {
  \set Score.markFormatter = #format-mark-box-letters
  \time 4/4 
  \mark \markup { \box \bold { Intro } } s1*8 \break \bar "[|:"
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup \bold { \box { A } \small " (play the guitar score in the absence of this one)" }
  s1*16  \break \bar "||"
  \mark \markup { \box \bold { "Interlude 1" } } s1*4 \break \bar ":|]"
  \label #'SegnoP 
  \mark \markup \bold { \box { B } \with-color #red \musicglyph "scripts.varsegno"  } s1*8 \break s1*8 \break \bar "||"
  \mark #3 s1*8 \break s1*8 \break \bar "||"
  \doubleMark 
  \markup { \with-color #red { "To Coda" \raise #0.6 \musicglyph "scripts.varcoda"} }
  \markup  { \box \bold { "Interlude 2" } }
  s1*4 \break \bar "|."
  \mark-y-dir #`( (,left . ,DOWN) (,center . ,DOWN) )
  \doubleMark 
  \markup { \with-link #'SegnoP { \with-color #red { "Solos on " \box C " and " \box "Interlude 2"" then D.S. al Coda" } }}
  \markup {  \bold \larger \center-column {\pad-markup #2 " "  \pad-markup #0 \with-color #red \musicglyph "scripts.varcoda"} }
  s1*6 
 
  \bar ".."
}




global = \relative {
  \key g \major
  \compressEmptyMeasures
  \override MultiMeasureRest #'expand-limit = #2
  \time 4/4 | % 1
}  

PianoMD =  \relative c' {
  \global
  R1*4 | % 5
  e4 -\mp g'8 -\< e8 g4 b,8 a'8 | % 6
  r8 a4 c,8 a'4 a4 | % 7
  <g, d' fis>4. -. -\! -\f <g d' fis>8 r4 <g d' fis>4 ~ | % 8
  <g d' fis>2. r4 |
  R1*16 |
  <b b'>8 -\mf ^\markup "tacet 1st X" e8 g8 <b, b'>8 ~ <b b'>8 g'4 <c, c'>8 ~ | % 46
  <c c'>8 fis8 a8 <c, c'>8 ~ <c c'>8 fis8 a8 <c, c'>8 | % 47
  <b b'>8 e8 g8 <b, b'>8 ~ <b b'>8 g'4 <c, c'>8 ~ | % 48
  <c c'>8 fis8 a8 <c, c'>8 ~ <c c'>8 fis8 a8 <c, c'>8 | % 49
  <b b'>8 e8 g8 <b, b'>8 ~ <b b'>8 g'4 <c, c'>8 ~ |
  <c c'>8 fis8 a8 <c, c'>8 ~ <c c'>8 fis8 a8 <c, c'>8 | % 51
  <b b'>8 e8 g8 <b, b'>8 ~ <b b'>8 g'4 <c, c'>8 ~ | % 52
  <c c'>8 fis8 a8 <c, c'>8 ~ <c c'>8 fis8 a8 <c, c'>8 | % 53
  <g g'>8 c8 e8 <g, g'>8 ~ <g g'>8 e'4 <g, g'>8 ~ | % 54
  <g g'>8 c8 e8 <g, g'>8 ~ <g g'>8 c8 e8 <g, g'>8 | % 55
  <g g'>8 c8 e8 <g, g'>8 ~ <g g'>8 e'4 <g, g'>8 ~ | % 56
  <g g'>8 c8 e8 <g, g'>8 ~ <g g'>8 c8 e8 <g, g'>8 | % 57
  <e e'>8 a8 c8 <e, e'>8 ~ <e e'>8 c'4 <a a'>8 ~ | % 58
  <a a'>8 d8 fis8 <a, a'>8 ~ <a a'>8 d8 fis8 <a, a'>8 | % 59
  <d, d'>8 g8 b8 <d, d'>8 ~ <d d'>8 b'4 <g g'>8 ~ |
  <g g'>8 c8 e8 <g, g'>8 ~ <g g'>8 c8 e8 <g, g'>8 | % 61
  <d d'>8 g8 b8 <d, d'>8 ~ <d d'>8 b'4 <g g'>8 ~ | % 62
  <g g'>8 c8 e8 <g, g'>8 ~ <g g'>8 c8 e8 <g, g'>8 | % 63
  <c, c'>8 fis8 a8 <c, c'>8 ~ <c c'>8 a'4 <fis fis'>8 ~ | % 64
  <fis fis'>8 b8 dis8 <fis, fis'>8 ~ <fis fis'>8 b8 dis8 <fis, fis'>8 |
  <b b'>8 e8 g8 <b, b'>8 ~ <b b'>8 g'4 <b, b'>8 ~ | % 66
  <b b'>8 e8 g8 <b, b'>8 ~ <b b'>8 e8 g8 <b, b'>8 | % 67
  <c c'>8 fis8 a8 <c, c'>8 ~ <c c'>8 a'4 <fis, fis'>8 ~ | % 68
  <fis fis'>8 b8 dis8 <fis, fis'>8 ~ <fis fis'>8 b8 dis8 <fis, fis'>8 | % 69
  <b b'>8 e8 g8 <b, b'>8 ~ <b b'>8 g'4 <b, b'>8 ~ |
  <b b'>8 e8 g8 <b, b'>8 ~ <b b'>8 e8 g8 <b, b'>8 | % 71
  <g g'>8 c8 e8 <g, g'>8 ~ <g g'>8 e'4 <g, g'>8 ~ | % 72
  <g g'>8 c8 e8 <g, g'>8 ~ <g g'>8 c8 e8 <g, g'>8 | % 73
  <g g'>8 c8 e8 <g, g'>8 ~ <g g'>8 e'4 <g, g'>8 ~ | % 74
  <g g'>8 c8 e8 <g, g'>8 ~ <g g'>8 c8 e8 <g, g'>8 | % 75
  <e e'>8 a8 cis8 <e, e'>8 ~ <e e'>8 cis'4 <e, e'>8 ~ | % 76
  <e e'>8 a8 cis8 <e, e'>8 ~ <e e'>8 a8 cis8 <e, e'>8 | % 77
  <d d'>8 g8 b8 <d, d'>8 ~ <d d'>8 b'4 <g g'>8 ~ | % 78
  <g g'>8 c8 e8 <g, g'>8 ~ <g g'>8 c8 e8 <g, g'>8 | % 79
  <g g'>8 c8 e8 <g, g'>8 ~ <g g'>8 e'4 <a, a'>8 ~ |
  <a a'>8 d8 fis8 <a, a'>8 ~ <a a'>8 d8 fis8 <a, a'>8 | % 81
  <b b'>8 e8 g8 <b, b'>8 ~ <b b'>8 g'4 <c, c'>8 ~ | % 82
  <c c'>8 fis8 a8 <c, c'>8 ~ <c c'>8 fis8 a8 <c, c'>8 | % 83
  <b b'>8 e8 g8 <b, b'>8 ~ <b b'>8 g'4 <c, c'>8 ~ | % 84
  <c c'>8 fis8 a8 <c, c'>8 ~ <c c'>8 fis8 a8 <c, c'>8 | % 85
  <b b'>8 -\mp e8 g8 <b, b'>8 ~ <b b'>8 g'4 <c, c'>8 ~ | % 86
  <c c'>8 fis8 a8 <c, c'>8 ~ <c c'>8 fis8 a8 <c, c'>8 | % 87
  <b b'>8 e8 g8 <b, b'>8 ~ <b b'>8 g'4 <c, c'>8 ~ | % 88
  <c c'>8 fis8 a8 <c, c'>8 ~ <c c'>8 fis8 a8 <c, c'>8 | % 89
  <g d'>4. - "Ralentir" <d' g>8 ~ <d g>4 <d g>4 | 
  r8 <a e'>4. ~ -\f <a e'>2 \fermata
}
PianoMG =  \relative c, {
  \global
  \clef "bass" 
  R1*4 
  e4 -\mp g'8 -\< b,8 g'4 fis,8 fis'8 r8 a4 c,8 a'4 e4 <e b'>4. -. -\!
  -\f <e b'>8 r4 <e b'>4 ~ <e b'>2. r4 |
  R1*16 |
  g8 -\mf b8 e8 g,8 ~ g8 e'4 a,8 ~ | 
  a8 c8 fis8 a,8 ~ a8 c8 fis8 a,8  |
  g8 b8 e8 g,8 ~ g8 e'4 a,8 ~ | 
  a8 c8 fis8 a,8 ~ a8 c8 fis8 a,8 | 
  g8 b8 e8 g,8 ~ g8 e'4 a,8 ~ | 
  a8 c8 fis8 a,8 ~ a8 c8 fis8 a,8 | 
  g8 b8 e8 g,8 ~ g8 e'4 a,8 ~ | 
  a8 c8 fis8 a,8 ~ a8 c8 fis8 a,8 | 
  e8 g8 c8 e,8 ~ e8 c'4 e,8 ~ | 
  e8 g8 c8 e,8 ~ e8 g8 c8 e,8 
  e8 g8 c8 e,8 ~ e8 c'4 e,8 ~ | 
  e8 g8 c8 e,8 ~ e8 g8 c8 e,8 | 
  c8 e8 a8 c,8 ~ c8 a'4 fis8 ~ |
  fis8 a8 d8 fis,8 ~ fis8 a8 d8 fis,8 |
  b,8 d8 g8 b,8 ~ b8 g'4 e8 ~ |
  e8 g8 c8 e,8 ~ e8 g8 c8 e,8 |
  b8 d8 g8 b,8 ~ b8 g'4 e8 ~ |
  e8 g8 c8 e,8 ~ e8 g8 c8 e,8 |
  a,8 c8 fis8 a,8 ~ a8 fis'4 dis8 ~ |
  dis8 fis8 b8 dis,8 ~ dis8 fis8 b8 dis,8 |
  g8 b8 e8 g,8 ~ g8 e'4 g,8 ~ |
  g8 b8 e8 g,8 ~ g8 b8 e8 g,8 |
  a8 c8 fis8 a,8 ~ a8 fis'4 dis,8 ~ |
  dis8 fis8 b8 dis,8 ~ dis8 fis8 b8 dis,8 | 
  g8 b8 e8 g,8 ~ g8 e'4 g,8 ~ |
  g8 b8 e8 g,8 ~ g8 b8 e8 g,8 |
  e8 g8 c8 e,8 ~ e8 c'4 e,8 ~ | 
  e8 g8 c8 e,8 ~ e8 g8 c8 e,8 |
  e8 g8 c8 e,8 ~ e8 c'4 e,8 ~ |
  e8 g8 c8 e,8 ~ e8 g8 c8 e,8 |
  cis8 e8 a8 cis,8 ~ cis8 a'4 cis,8 ~ |
  cis8 e8 a8 cis,8 ~ cis8 e8 a8 cis,8 |
  b8 d8 g8 b,8 ~ b8 g'4 e8 ~ |
  e8 g8 c8 e,8 ~ e8 g8 c8 e,8 |
  e8 g8 c8 e,8 ~ e8 c'4 fis,8 ~ |
  fis8 a8 d8 fis,8 ~ fis8 a8 d8 fis,8 |
  g8 b8 e8 g,8 ~ g8 e'4 a,8 ~ |
  a8 c8 fis8 a,8 ~ a8 c8 fis8 a,8 |
  g8 b8 e8 g,8 ~ g8 e'4 a,8 ~ |
  a8 c8 fis8 a,8 ~ a8 c8 fis8 a,8 |
  g8 -\mp b8 e8 g,8 ~ g8 e'4 a,8 ~ |
  a8 c8 fis8 a,8 ~ a8 c8 fis8 a,8 |
  g8 b8 e8 g,8 ~ g8 e'4 a,8 ~ |
  a8 c8 fis8 a,8 ~ a8 c8 fis8 a,8 | 
  <e b'>4. <b' e>8 ~ <b e>4 <b e>4 |
  r8 <fis c'>4. ~ -\f <fis c'>2 \fermata 
}
Basse =  \relative c, {
  \global
  e4 g'8 b,8 g'4 fis,8 fis'8 | % 2
  r8 a4 c,8 a'4 e4 | % 3
  e,4 g'8 b,8 g'4 fis,8 fis'8 | % 4
  r8 a4 c,8 a'4 e4 | % 5
  e,4 g'8 -\< b,8 g'4 fis,8 fis'8 | % 6
  r8 a4 c,8 a'4 e4 | % 7
  e4. -. -\! -\f -\f e8 r4 e4 ~ | % 8
  e2. r4 |
  e,4 -\mf g'8 b,8 g'4 fis,8 fis'8 | 
  r8 a4 c,8 a'4 e4 | % 11
  e,4 g'8 b,8 g'4 fis,8 fis'8 | % 12
  r8 a4 c,8 a'4 e4 | % 13
  c4 g'8 a8 b4 g,8 g'8 | % 14
  r8 g4 c,8 b'4 g4 | % 15
  c,4 g'8 a8 b4 g,8 g'8 | % 16
  r8 g4 c,8 e'4 g,4 | % 17
  a,4 c'8 e,8 c'4 a,8 d8 | % 18
  r8 a'4 d,8 a'4 c,4 | % 19
  g4 b'8 d,8 b'4 c,8 g'8 | 
  r8 g4 c,8 g'4 b,4 | % 21
  g4 d''8 g,8 d'4 g,,8 c8 | % 22
  r8 g'4 c,8 g'4 b,4 | % 23
  fis4 a'8 c,8 a'4 b,8 d8 | % 24
  r8 fis4 b,8 b'4 g,4 |
  e4 g'8 b,8 g'4 fis,8 fis'8 | % 26
  r8 a4 c,8 a'4 e4 | % 27
  e,4 g'8 b,8 g'4 fis,8 fis'8 | % 28
  r8 a4 c,8 a'4 e4 | % 29
  e,4 g'8 b,8 g'4 fis,8 fis'8 | 
  r8 a4 c,8 a'4 e4 | % 31
  e,4 g'8 b,8 g'4 fis,8 fis'8 | % 32
  r8 a4 c,8 a'4 e,4 | % 33
  c'4 g'8 a8 b4 g,8 g'8 | % 34
  r8 g4 c,8 b'4 g4 | % 35
  c,4 g'8 a8 b4 g,8 g'8 | % 36
  r8 g4 c,8 e'4 g,4 | % 37
  a,4 c'8 e,8 c'4 a,8 d8 | % 38
  r8 a'4 d,8 a'4 c,4 | % 39
  g4 b'8 d,8 b'4 c,8 g'8 | 
  r8 g4 c,8 g'4 b,4 | % 41
  g4 d''8 g,8 d'4 g,,8 c8 | % 42
  r8 g'4 c,8 g'4 b,4 | % 43
  fis4 a'8 c,8 a'4 b,8 d8 | % 44
  r8 fis4 b,8 b'4 g,4 |
  e4 g'8 b,8 g'4 b,8 e8 | % 46
  r8 b'4 e,,8 g'4 c,4 | % 47
  fis,4 a'8 c,8 a'4 b,8 d8 | % 48
  r8 fis4 b,8 a'4 b,4 | % 49
  e,4 g'8 b,8 g'4 b,8 e8 | 
  r8 b'4 e,,8 g'4 g,4 | % 51
  c4 g'8 a8 b4 g,8 g'8 | % 52
  r8 g4 c,8 e'4 g,4 | % 53
  c,4 g'8 a8 b4 g,8 g'8 | % 54
  r8 g4 c,8 c'4 g4 | % 55
  a,4 e'8 fis8 g4 a,8 e'8 | % 56
  r8 e4 a,8 cis'4 g4 | % 57
  g,4 b'8 d,8 b'4 g8 c,8 | % 58
  r8 g'4 c,8 g'4 b,4 | % 59
  c4 g'8 c,8 b'4 g,8 g'8 | 
  r8 a4 d,8 fis4 fis,4 | % 61
  e4 g'8 b,8 g'4 fis,8 a'8 | % 62
  r8 a4 c,8 a'4 e4 | % 63
  e,4 g'8 b,8 g'4 fis,8 a'8 | % 64
  r8 a4 c,8 a'4 e4 | % 65
  e,4 g'8 b,8 g'4 fis,8 a'8 | % 66
  r8 a4 c,8 a'4 e4 | % 67
  e,4 g'8 b,8 g'4 fis,8 a'8 | % 68
  r8 a4 c,8 a'4 e4 | % 69
  e,4. b'8 ~ b4 b4 | 
  r8 fis4. ~ -\f fis2 \fermata 
}

Accords =  \chordmode {
  e1:m7 fis:m5-7 e1:m7 fis:m5-7 e1:m7 fis:m5-7 e1:m7 s %Intro
  e1:m7 fis:m5-7 e1:m7 fis:m5-7 c1*4:7+ 
  a1:m7 d:7 g:7+ c:7+ g:7+ c:7+ fis:m5-7 b:9- %A
  e1:m7 fis:m5-7 e1:m7 fis:m5-7 %Interlude
  e1:m7 fis:m5-7 e1:m7 fis:m5-7 c1*4:7+ 
  a1:m7 d:7 g:7+ c:7+ g:7+ c:7+ fis:m5-7 b:9- %A'
  e1*2:m7 fis1:m5-7 b:9- e1*2:m7 c1*2:7+
  c1*2:7+ a:7 g1:7+ c1*2:7+ d1:7 %B 
  e1:m7 fis:m5-7 e1:m7 fis:m5-7 %Interlude
  e1:m7 fis:m5-7 e1:m7 fis:m5-7 e1:m7 fis:m5-7 %Coda
}

GrilleGuitare =  \chordmode {
  \override ChordNames.ChordName.color = #red
  s1*8 %Intro
  g1 a:m g a:m e1*4:m 
  c1 fis:dim b:m e:m b:m e:m a:m dis:dim %A
  g1 a:m g a:m %Interlude
  g1 a:m g a:m e1*4:m 
  c1 fis:dim b:m e:m b:m e:m a:m dis:dim %A
  g1*2 a1:m dis:dim g1*2 e:m
  e:m cis:dim b1:m e1*2:m fis1:dim %B
  g1 a:m g a:m %Interlude
  g1 a:m g a:m g a:m %Coda
  
}


Tenor =  \relative c' {
  \global 
  R1*4 | % 5
  b4 -\mp e'8 ( -\< b8 e4 ) g,8 ( e'8 ) | % 6
  r8 e4 g,8 ( e'4 ) e4 | % 7
  e4. -. -\! -\f e8 r4 e4 ~ | % 8
  e2. r4 |
  R1*8 | % 13
  g,4._\markup "tacet 1st X"  a8 ~ a2 | % 18
  g4. b8 ~ b2 | % 19
  g4. b8 ~ b2 | 
  g4. c8 ~ c2 | % 21
  g4. b8 ~ b2 | % 22
  g4. c8 ~ c2 | % 23
  fis,4. a8 ~ a2 | % 24
  fis4. c'8 ~ c2 |
  R1*8 | % 13
  \label #'Segno
  g4. -\mp e8 ~ e2 | % 34
  d1 | % 35
  e4. g8 ~ g2 | % 36
  b1 | % 37
  c,4. e8 ~ e4 g4 | % 38
  b4. a8 ~ a2 | % 39
  b4. d8 ~ d4 fis4 | 
  e4. e8 ~ e2 | % 41
  g,4 ( b4 d4. ) g,8 | % 42
  r8 c,4 ( e8 ) r8 g8 ( e4 ) | % 43
  fis4 ( a4 c4. ) a8 | % 44
  r8 b4 ( dis8 ) r8 fis8 ( e8 dis8 ) |
  d4 r4 r2 | % 46
  r2 r8 d8 -\mf d8 e8 | % 47
  e8 -. r4. r2 | % 48
  r2 r8 dis8 -\mf dis8 g8 | % 49
  g8 -. r8 r4 r2 | 
  r4. g,8 ~ g4 c4 ~ | % 51
  c1 ~ | % 52
  c2 r4 b4 -\p | % 53
  b4. c8 ~ c4 b4 | % 54
  b4. a8 ~ a4 b4 | % 55
  cis4. d8 ~ d4 cis4 | % 56
  e2. g,4 -\mp | % 57
  b4. c8 ~ c4 b4 | % 58
  c2. b4 | % 59
  c2 b2 | 
  d2 r2 | % 61
  b4. -> e8 ~ -> e4 e4 -> | % 62
  c4 -^ r4 r2 | % 63
  g4. -> d'8 ~ -> d4 d4 -> | % 64
  a4 -^ r4 r2 | % 65
  b4. -> -\mp e8 ~ -> e4 e4 -> | % 66
  c4 -^ r4 r2 | % 67
  g4. -> d'8 ~ -> d4 d4 -> | % 68
  a4 -^ r4 r2 | % 69
  b4. -> e8 ~ -> e4 e4 -> | 
  r8 c4. ~ -\f c2 \fermata 
}



Alto =  \relative c {
  \global 
  R1*4 | % 5
  e4 -\mp g'8 ( -\< -\< d8 g4 ) b,8 ( g'8 ) | % 6
  r8 a4 c,8 ( a'4 ) a4 | % 7
  b4. -. -\! -\! -\f -\f b8 r4 b4 ~ \startTrillSpan | % 8
  b2. \stopTrillSpan r4 |
  R1*8 | % 13
  c,4._\markup "tacet 1st X"  e8~ 2 | c4. fis8~ 2 | d4. fis8~ 2 | e4. e8~ 2 |
  d4. -\mp fis8 ~ 2 | % 22
  c4. e8~ 2 | 
  c4. e8 ~ 2 | % 24
  b4. dis8~2 |
  R1*4 | % 29
  \label #'Segno
  g,4 ( b4 d4. ) a8 | 
  r8 a4 ( c8 ) r8 e8 ( c4 ) | % 31
  g4 ( b4 d4. ) a8 | % 32
  r8 a4 ( c8 ) r8 e8 ( c4 ) | % 33
  e,4 ( g4 b4. ) g8 | % 34
  r8 b4 ( e8 ) r8 g8 ( e4 ) | % 35
  c4 ( b4 g4. ) b8 | % 36
  r8 g4 ( fis8 ) r8 e'8 ( d8 c8 ) | % 37
  c4 ( e4 g4. ) e8 | % 38
  r8 fis4 ( a8 ) r8 c8 ( a4 ) | % 39
  b,4 ( d4 fis4. ) d8 | 
  r8 e4 ( g8 ) r8 b8 ( g4 ) | % 41
  b,4 ( d4 g4. ) d8 | % 42
  r8 e4 ( g8 ) r8 b8 ( g4 ) | % 43
  a,4 ( c4 e4. ) c8 | % 44
  r8 dis4 ( fis8 ) r8 a8 ( g8 fis8 ) |
  g4 r r2 | % 46  
  r2 r8 fis8 -\mf fis8 a8 | % 47
  a8 -. r4. r2 | % 48
  r2 r8 fis8 -\mf fis8 a8 | % 49
  d8 -. r8 r4 r2 | 
  r4. b,8 ~ b4 e4 ~ | % 51
  e1 ~ | % 52
  e2 r4 b4 -\p | % 53
  b4. c8 ~ c4 b4 | % 54
  b4. a8 ~ a4 b4 | % 55
  cis4. d8 ~ d4 cis4 | % 56
  e2. d4 | % 57
  fis4. g8 ~ g4 fis4 | % 58
  g2. fis4 | % 59
  g2 fis2 | 
  a2 r2 | % 61
  d,4. -> g8 ~ -> g4 g4 -> | % 62
  e4 -^ r4 r2 | % 63
  b4. -> e8 ~ -> e4 e4 -> | % 64
  c4 -^ r4 r2 | % 65
  d4. -> g8 ~ -> g4 g4 -> | % 62
  e4 -^ r4 r2 | % 63
  b4. -> e8 ~ -> e4 e4 -> | % 64
  c4 -^ r4 r2 | % 65
  b4. -> e8 ~ -> e4 e4 -> | 
  r8 c4. ~ -\f c2 \fermata 
}

TrumpetII =  \relative cis' {
  \global
  R1*4 | % 4
  b4 -\mp e'8 ( -\< -\< b8 e4 ) g,8 ( e'8 ) | % 6
  r8 e4 g,8 ( e'4 ) e4 | % 7
  d4. -. -\! -\! -\f -\f d8 r4 d4 ~ \startTrillSpan | % 8
  d2. \stopTrillSpan r4 |
  e,4._\markup "tacet 1st X" b'8 ~ b4 b4 | % 14
  fis4. e8 ~ e4 e4 | % 15
  b4. e8 ~ e4 e4 | % 16
  fis4. e8 ~ e4 r4 | % 17
  e4.  b'8 ~ b4 b4 | % 14
  fis4. e8 ~ e4 e4 | % 15
  b4. e8 ~ e4 e4 | % 16
  fis8 e8 fis4 ~ fis4 r4 | % 17
  e4. b'8 ~ b4 a4 | % 18
  e4. fis8 ~ fis4 e4 | % 19
  d4. a'8 ~ a4 g4 | 
  c,1 | % 21
  d4. e8 ~ e4 fis4 | % 22
  g4. a8 ~ a4 b4 | % 23
  c4. d8 ~ d4 c4 | % 24
  fis,1 |
  R1*4 | % 29
  \label #'Segno
  e4. ( b'8 ~ b4 ) b4 | 
  fis4. e8 ~ e4 e4 | % 31
  b4. e8 ~ e4 e4 | % 32
  fis4. e8 ~ e4 r4 | % 33
  e4. b'8 ~ b4 b4 | % 34
  fis4. e8 ~ e4 e4 | % 35
  b4. e8 ~ e4 e4 | % 36
  fis8 e8 fis2 r4 | % 37
  e4. b'8 ~ b4 a4 | % 38
  e4. fis8 ~ fis4 e4 | % 39
  d4. a'8 ~ a4 g4 | 
  c,1 | % 41
  fis4. -\mf g8 ~ g4 a4 | % 42
  b4. c8 ~ c4 d4 | % 43
  e4. e8 ~ e4 e4 | % 44
  a,1 |
  g4 r8 g8 ~ g4 g4 | % 46
  g4. b,8 ~ b2 | % 47
  r4 r8 fis'8 ~ fis4 fis4 | % 48
  fis4. b,8 ~ b2 | % 49
  r4 r8 e8 ~ e4 e4 | 
  e4. b8 ~ b4 b4 ~ | % 51
  b1 ~ | % 52
  b2 r4  e4 | % 53
  e4. fis8 ~ fis4 e4 | % 54
  fis4. e8 ~ e4 fis4 | % 55
  g4. a8 ~ a4 g4 | % 56
  a2. g4 | % 57
  b4. c8 ~ c4 b4 | % 58
  c2. b4 | % 59
  c2 b2 | 
  d2 r2 | % 61
  g,4. -> -\mp d'8 ~ -> d4 d4 -> | % 66
  a4 -^ r4 r2 | % 67
  g4. -> -\mp d'8 ~ -> d4 d4 -> | % 66
  a4 -^ r4 r2 | % 67
  g4. -> -\mp d'8 ~ -> d4 d4 -> | % 66
  a4 -^ r4 r2 | % 67
  g4. -> d'8 ~ -> d4 d4 -> | % 68
  a4 -^ r4 r2 | % 69
  g4. -> d'8 ~ -> d4 d4 -> | 
  r8 fis16 ( -\f -\f g16 fis4 ~ fis2 ) \fermata
}

Baryton =  \relative c {
  \global
  R1*4 | % 5
  e4 -\mp g'8 ( -\< e8 g4 ) b,8 ( a'8 ) | % 6
  r8 a4 c,8 ( a'4 ) a4 | % 7
  e4. -. -\! -\f e8 r4 e4 ~ | % 8
  e2. r4 |
  R1*11 | 
  r4_\markup "tacet 1st X" e8 g8 e8 c8 b8 a8 | % 21
  g4. -\mf g'8 ~ g4 g,4 | % 22
  r8 g'4 g8 ~ g4 b,4 | % 23
  fis4. a'8 ~ a4 d,4 | % 24
  r8 fis4 b,8 ~ b4 g4 |
  e4 r4 r2 | % 26
  R1*7 | % 33
  \label #'Segno
  g'4. -\mp e8 ~ e2 | % 34
  d1 | % 35
  e4. g8 ~ g2 | % 36
  b1 | % 37
  c,4. e8 ~ e4 g4 | % 38
  b4. a8 ~ a2 | % 39
  b,4. d8 ~ d4 fis4 | 
  g1 | % 41
  g4. fis8 ~ fis4 d4 | % 42
  c4. d8 ~ d4 e4 | % 43
  fis4. e8 ~ e4 a4 | % 44
  r8 fis4 a8 r8 c8 b8 a8 |
  b4 r4 r2 | % 46
  r2 r8 -\p e,8 e8 fis8 | % 47
  fis8 -. r8 r4 r2 | % 48
  r2 r8 b,8 -\mf b8 e8 | % 49
  e8 -. r8 r4 r2 | 
  r4. b8 ~ b4 c4 ~ | % 51
  c1 ~ | % 52
  c2 r2 | % 53
  R1*3 | % 56
  r2 r4 e4 -\mp | % 57
  g4. a8 ~ a4 fis4 | % 58
  g2. fis4 | % 59
  g2 fis2 | 
  a2 r2 | % 61
  e4. -> b'8 ~ -> b4 b4 -> | % 62
  fis4 -^ r4 r2 | % 63
  e4. -> b'8 ~ -> b4 b4 -> | % 64
  fis4 -^ r4 r2 | % 65
  e4. -> -\mp b'8 ~ -> b4 b4 -> | % 66
  fis4 -^ r4 r2 | % 67
  e4. -> b'8 ~ -> b4 b4 -> | % 68
  fis4 -^ r4 r2 | % 69
  e,4. -> b'8 ~ -> b4 b4 -> | 
  r8 fis4. ~ -\f fis2 \fermata 
}

Trombone =  \relative c {
  \global 
  R1*4 | % 5
  b4 -\mp e8 ( -\< b8 e4 ) g,8 ( e'8 ) | % 6
  r8 e4 g,8 ( e'4 ) e4 | % 7
  b'4. -. -\! -\f b8 r4 b4 ~ | % 8
  b2. r4 |
  R1*11 | % 13
  r4 _\markup "Tacet 1st X" e,8 ( g8 ) e8 ( c8 b8 a8 ) | % 21
  g4. g8 ~ g2 | % 22
  g4. g8 ~ g2 | % 23
  fis4. fis8 ~ fis2 | % 24
  b1 |
  R1*4 | % 29
  \label #'Segno
  e4 ( -\mp g4 b4. ) fis8 | 
  r8 fis4 ( a8 ) r8 c8 ( a4 ) | % 31
  e4 ( g4 b4. ) fis8 | % 32
  r8 fis4 ( a8 ) r8 c8 ( a4 ) | % 33
  c,4 ( e4 g4. ) e8 | % 34
  r8 e4 ( g8 ) r8 b8 ( g4 ) | % 35
  e4 ( c4 b4. ) c8 | % 36
  r8 e4 ( c8 ) r8 b8 ( a8 g8 ) | % 37
  a4 ( c4 e4. ) c8 | % 38
  r8 d4 ( fis8 ) r8 a8 ( fis4 ) | % 39
  g4 ( b4 d4. ) g,8 | 
  r8 c,4 ( e8 ) r8 g8 ( e4 ) | % 41
  g4. b8 ~ b2 | % 42
  g4. c8 ~ c2 | % 43
  fis,4. a8 ~ a2 | % 44
  fis4. c'8 ~ c2 |
  e4 r4 r2 | % 46
  r2 r8 b8 -\mf b8 c8 | % 47
  c8 -. r8 r4 r2 | % 48
  r2 r8 a8 -\mf a8 b8 | % 49
  b8 -. r8 r4 r2 | 
  r4. e,8 ~ e4 g4 ~ | % 51
  g1 ~ | % 52
  g2 r2 | % 53
  R1*3 | % 56
  r2 r4 e4 -\mp | % 57
  g4. a8 ~ a4 fis4 | % 58
  g2. fis4 | % 59
  g2 fis2 | 
  a2 r2 | % 61
  g4. -> b8 ~ -> b4 b4 -> | % 62
  a4 -^ r4 r2 | % 63
  e4. -> b'8 ~ -> b4 b4 -> | % 64
  fis4 -^ r4 r2 | % 65
  g4. -> -\mp b8 ~ -> b4 b4 -> | % 66
  a4 -^ r4 r2 | % 67
  e4. -> b'8 ~ -> b4 b4 -> | % 68
  fis4 -^ r4 r2 | % 69
  e4. -> b'8 ~ -> b4 b4 -> | 
  r8 fis4. ~ -\f fis2 \fermata \bar "|."
}


Vocal =  \relative c' {
  \global
  R1*8
  e4. -\mf b'8 ~ b4 b4 | 
  fis4. e8 ~ e4 e4 | % 11
  b4. e8 ~ e4 e4 | % 12
  fis4. e8 ~ e4 r4 | % 13
  e4. -\mf b'8 ~ b4 b4 | % 14
  fis4. e8 ~ e4 e4 | % 15
  b4. e8 ~ e4 e4 | % 16
  fis8 e8( fis4) ~ fis4 r4 | % 17
  e4. b'8 ~ b4 a4 | % 18
  e4. fis8 ~ fis4 e4 | % 19
  d4. a'8 ~ a4 g4 | 
  c,1 | % 21
  b4. c8 ~ c4 d4 | % 22
  e4. fis8 ~ fis4 g4 | % 23
  a4. b8 ~ b4 a4 | % 24
  dis,1 |
  R1*4 | % 29
  e4. b'8 ~ b4 b4 | 
  fis4. e8 ~ e4 e4 | % 31
  b4. e8 ~ e4 e4 | % 32
  fis4. e8 ~ e4 r4 | % 33
  e4. b'8 ~ b4 b4 | % 34
  fis4. e8 ~ e4 e4 | % 35
  b4. e8 ~ e4 e4 | % 36
  fis8 e8( fis2) r4 | % 37
  e4. b'8 ~ b4 a4 | % 38
  e4. fis8 ~ fis4 e4 | % 39
  d4. a'8 ~ a4 g4 | 
  c,1 | % 41
  b4. c8 ~ c4 d4 | % 42
  e4. fis8 ~ fis4 g4 | % 43
  a4. bes8 ~ bes4 b4 | % 44
  c1 |
  r4 r8 b8 ~ b4 b4 | % 46
  b4. e,8 ~ e2 | % 47
  r4 r8 a8 ~ a4 a4 | % 48
  a4. dis,8 ~ dis2 | % 49
  r4 r8 g8 ~ g4 g4 | 
  g4. b,8 ~ b4 e4 ~ | % 51
  e1 ~ | % 52
  e2 r4 e4 | % 53
  e4. fis8 ~ fis4 e4 | % 54
  fis4. e8 ~ e4 fis4 | % 55
  g4. a8 ~ a4 g4 | % 56
  a2. g4 | % 57
  b4. c8 ~ c4 b4 | % 58
  c2. b4 | % 59
  c2 b2 | 
  d2 r2 | % 61
  R1*4 | 
  R1*6
}

TrumpetI =  \relative c' {
  \global
  R1*4 | % 5
  e4 -\mp g'8 ( -\< e8 g4 ) b,8 ( a'8 ) | % 6
  r8 a4 c,8 ( a'4 ) a4 | % 7
  b4. -. -\! -\f b8 r4 b4 ~ \startTrillSpan | % 8
  b2. \stopTrillSpan r4 |
  e,4.  -\mp b'8 ~ b4 b4 | 
  fis4. e8 ~ e4 e4 | % 11
  b4. e8 ~ e4 e4 | % 12
  fis4. e8 ~ e4 r4 | % 13
  e4.  b'8 ~ b4 b4 | % 14
  fis4. e8 ~ e4 e4 | % 15
  b4. e8 ~ e4 e4 | % 16
  fis8 e8 fis4 ~ fis4 r4 | % 17
  e4. b'8 ~ b4 a4 | % 18
  e4. fis8 ~ fis4 e4 | % 19
  d4. a'8 ~ a4 g4 | 
  c,1 | % 21
  b4. c8 ~ c4 d4 | % 22
  e4. fis8 ~ fis4 g4 | % 23
  a4. b8 ~ b4 a4 | % 24
  dis,1 |
  R1*4 | % 13
  \label #'Segno
  e4. b'8 ~ b4 b4 | 
  fis4. e8 ~ e4 e4 | % 31
  b4. e8 ~ e4 e4 | % 32
  fis4. e8 ~ e4 r4 | % 33
  e4. b'8 ~ b4 b4 | % 34
  fis4. e8 ~ e4 e4 | % 35
  b4. e8 ~ e4 e4 | % 36
  fis8 e8 fis2 r4 | % 37
  e4. b'8 ~ b4 a4 | % 38
  e4. fis8 ~ fis4 e4 | % 39
  d4. a'8 ~ a4 g4 | 
  c,1 | % 41
  b4. c8 ~ c4 d4 | % 42
  e4. fis8 ~ fis4 g4 | % 43
  a4. bes8 ~ bes4 b4 | % 44
  c1 |
  r4 r8 b8 ~ b4 b4 | % 46
  b4. e,8 ~ e2 | % 47
  r4 r8 a8 ~ a4 a4 | % 48
  a4. dis,8 ~ dis2 | % 49
  r4 r8 g8 ~ g4 g4 | 
  g4. b,8 ~ b4 e4 ~ | % 51
  e1 ~ | % 52
  e2 r4 e4 | % 53
  e4. fis8 ~ fis4 e4 | % 54
  fis4. e8 ~ e4 fis4 | % 55
  g4. a8 ~ a4 g4 | % 56
  a2. g4 | % 57
  b4. c8 ~ c4 b4 | % 58
  c2. b4 | % 59
  c2 b2 | 
  d2 r2 | % 61
  g,,4. -> -\mp d'8 ~ -> d4 d4 -> | % 66
  a4 -^ r4 r2 | % 67
  g4. -> -\mp d'8 ~ -> d4 d4 -> | % 66
  a4 -^ r4 r2 | % 67
  g4. -> -\mp d'8 ~ -> d4 d4 -> | % 66
  a4 -^ r4 r2 | % 67
  g4. -> d'8 ~ -> d4 d4 -> | % 68
  a4 -^ r4 r2 | % 69
  d4. -> g8 ~ -> g4 g4 -> | 
  r8 fis16 ( -\f g16 fis4 ~ fis2 ) \fermata
}

Guitare =  \relative f {
  \clef "treble_8" 
  \global
  R1*4 | % 5
  e4 -\mp g'8 -\< e8 g4 b,8 a'8 | % 6
  r8 a4 c,8 a'4 a4 | % 7
  <d, g b fis'>4. -. -\! -\f <d g b fis'>8 r4 <d g b fis'>4 ~ | % 8
  <d g b fis'>2. r4 
  <b d g>4. <b d g>8 ~ <b d g>4 r8 <a c e>8 ~ |    
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 31
  <b d g>4. <b d g>8 ~ <b d g>4 r8 <a c e>8 ~ | % 32
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 33
  <g b e>4. <g b e>8 ~ <g b e>4 r8 <b e g>8 ~ | % 34
  <b e g>4. <b e g>8 ~ <b e g>4 <g b e>4 | % 35
  <g b e>4. <g b e>8 ~ <g b e>4 r8 <b e g>8 ~ | % 36
  <b e g>4. <b e g>8 ~ <b e g>4 <g b e>4 | % 37
  <g c e>4. <g c e>8 ~ <g c e>4 r8 <a c fis>8 ~ | % 38
  <a c fis>4. <a c fis>8 ~ <a c fis>4 <a c fis>4 | % 39
  <b d fis>4. <b d fis>8 ~ <b d fis>4 r8 <b e g>8 ~ |
  <b e g>4. <b e g>8 ~ <b e g>4 <b e g>4 | % 41
  <b d fis>4. <b d fis>8 ~ <b d fis>4 r8 <b e g>8 ~ | % 42
  <b e g>4. <b e g>8 ~ <b e g>4 <b e g>4 | % 43
  <c e a>4. <c e a>8 ~ <c e a>4 r8 <a dis fis cis'>8 ~ | % 44
  <a dis fis cis'>4. <a dis fis cis'>8 ~ <a dis fis cis'>4 <a dis fis cis'>4 
  <b d g>4. <b d g>8 ~ <b d g>4 r8 <c e a>8 ~ | % 26
  <c e a>4. <c e a>8 ~ <c e a>4 <c e a>4 | % 27
  <b d g>4. <b d g>8 ~ <b d g>4 r8 <a c e>8 ~ | % 28
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 29
  <b d g>4. <b d g>8 ~ <b d g>4 r8 <a c e>8 ~ |    
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 31
  <b d g>4. <b d g>8 ~ <b d g>4 r8 <a c e>8 ~ | % 32
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 33
  <g b e>4. <g b e>8 ~ <g b e>4 r8 <b e g>8 ~ | % 34
  <b e g>4. <b e g>8 ~ <b e g>4 <g b e>4 | % 35
  <g b e>4. <g b e>8 ~ <g b e>4 r8 <b e g>8 ~ | % 36
  <b e g>4. <b e g>8 ~ <b e g>4 <g b e>4 | % 37
  <g c e>4. <g c e>8 ~ <g c e>4 r8 <a c fis>8 ~ | % 38
  <a c fis>4. <a c fis>8 ~ <a c fis>4 <a c fis>4 | % 39
  <b d fis>4. <b d fis>8 ~ <b d fis>4 r8 <b e g>8 ~ |
  <b e g>4. <b e g>8 ~ <b e g>4 <b e g>4 | % 41
  <b d fis>4. <b d fis>8 ~ <b d fis>4 r8 <b e g>8 ~ | % 42
  <b e g>4. <b e g>8 ~ <b e g>4 <b e g>4 | % 43
  <c e a>4. <c e a>8 ~ <c e a>4 r8 <a dis fis cis'>8 ~ | % 44
  <a dis fis cis'>4. <a dis fis cis'>8 ~ <a dis fis cis'>4 <a dis fis cis'>4 
  <b d g>4. <b d g>8 ~ <b d g>4 r8 <b d g>8 ~ | % 46
  <b d g>4. <b d g>8 ~ <b d g>4 <b d g>4 | % 47
  <c e a>4. <c e a>8 ~ <c e a>4 r8 <a dis fis cis'>8 ~ | % 48
  <a dis fis cis'>4. <a dis fis cis'>8 ~ <a dis fis cis'>4 <a dis fis cis'>4 | % 49
  <b d g>4. <b d g>8 ~ <b d g>4 r8 <b d g>8 ~ |   
  <b d g>4. <b d g>8 ~ <b d g>4 <b d g>4 | % 51
  <g b e>4. <g b e>8 ~ <g b e>4 r8 <b e g>8 ~ | % 52
  <b e g>4. <b e g>8 ~ <b e g>4 <g b e>4 | % 53
  <g b e>4. <g b e>8 ~ <g b e>4 r8 <b e g>8 ~ | % 54
  <b e g>4. <b e g>8 ~ <b e g>4 <g b e>4 | % 55
  <g cis e>4. <g cis e>8 ~ <g cis e>4 r8 <g cis e>8 ~ | % 56
  <g cis e>4. <g cis e>8 ~ <g cis e>4 <g cis e>4 | % 57
  <b d fis>4. <b d fis>8 ~ <b d fis>4 r8 <b e g>8 ~ | % 58
  <b e g>4. <b e g>8 ~ <b e g>4 <b e g>4 | % 59
  <g b e>4. <g b e>8 ~ <g b e>4 r8 <a c fis>8 ~ |   
  <a c fis>4. <a c fis>8 ~ <a c fis>4 <a c fis>4 | % 61
  <b d g>4. <b d g>8 ~ <b d g>4 r8 <a c e>8 ~ | % 62
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 63
  <b d g>4. <b d g>8 ~ <b d g>4 r8 <a c e>8 ~ | % 64
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 65
  <b d g>4. <b d g>8 ~ <b d g>4 r8 <a c e>8 ~ | % 66
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 67
  <b d g>4. <b d g>8 ~ <b d g>4 r8 <a c e>8 ~ | % 68
  <a c e>4. <a c e>8 ~ <a c e>4 <a c e>4 | % 69
  <b d g>4. <b d g>8 ~ <b d g>4 <b d g>4 | 
  r8 <c e a>4. ~ -\f <c e a>2 \fermata 
}

GuitareTabs =  \relative f' {
  \clef "tab" 
  \stopStaff \override Staff.StaffSymbol.line-count = #6
  \startStaff 
  R1*6 | % 7
  <d g b fis'>4. -. \4 \3 \2 \1 <d g b fis'>8 \4 \3 \2 \1 r4 <d g b fis'>4 ~ \4 \3 \2 \1 | % 8
  <d g b fis'>2. \4 \3 \2 \1 r4 
  <b d g>4. \3 \2 \1 <b d g>8 ~ \3 \2 \1 <b d g>4 \3 \2 \1 r8 <c e a>8 ~ \3 \2 \1 | 
  <c e a>4. \3 \2 \1 <c e a>8 ~ \3 \2 \1 <c e a>4 \3 \2 \1 <c e a>4 \3 \2 \1 | % 31
  <b d g>4. \3 \2 \1 <b d g>8 ~ \3 \2 \1 <b d g>4 \3 \2 \1 r8 <c e a>8 ~ \3 \2 \1 | % 32
  <c e a>4. \3 \2 \1 <c e a>8 ~ \3 \2 \1 <c e a>4 \3 \2 \1 <c e a>4 \3 \2 \1 | % 33
  <g b e>4. \3 \2 \1 <g b e>8 ~ \3 \2 \1 <g b e>4 \3 \2 \1 r8 <b e g>8 ~ \3 \2 \1 | % 34
  <b e g>4. \3 \2 \1 <b e g>8 ~ \3 \2 \1 <b e g>4 \3 \2 \1 <g b e>4 \3 \2 \1 | % 35
  <g b e>4. \3 \2 \1 <g b e>8 ~ \3 \2 \1 <g b e>4 \3 \2 \1 r8 <b e g>8 ~ \3 \2 \1 | % 36
  <b e g>4. \3 \2 \1 <b e g>8 ~ \3 \2 \1 <b e g>4 \3 \2 \1 <g b e>4 \3 \2 \1 | % 37
  <g c e>4. \3 \2 \1 <g c e>8 ~ \3 \2 \1 <g c e>4 \3 \2 \1 r8 <a c fis>8 ~ \3 \2 \1 | % 38
  <a c fis>4. \3 \2 \1 <a c fis>8 ~ \3 \2 \1 <a c fis>4 \3 \2 \1 <a c fis>4 \3 \2 \1 | % 39
  <b d fis>4. \3 \2 \1 <b d fis>8 ~ \3 \2 \1 <b d fis>4 \3 \2 \1 r8 <b e g>8 ~ \3 \2 \1 | 
  <b e g>4. \3 \2 \1 <b e g>8 ~ \3 \2 \1 <b e g>4 \3 \2 \1 <b e g>4 \3 \2 \1 | % 41
  <b d fis>4. \3 \2 \1 <b d fis>8 ~ \3 \2 \1 <b d fis>4 \3 \2 \1 r8 <b e g>8 ~ \3 \2 \1 | % 42
  <b e g>4. \3 \2 \1 <b e g>8 ~ \3 \2 \1 <b e g>4 \3 \2 \1 <b e g>4 \3 \2 \1 | % 43
  <c e a>4. \3 \2 \1 <c e a>8 ~ \3 \2 \1 <c e a>4 \3 \2 \1 r8 <a dis fis cis'>8 ~ \4 ~ \3 \2 \1 | % 44
  <a dis fis cis'>4. \4 \3 \2 \1 <a dis fis cis'>8 ~ \4 ~ \3 \2 \1 <a dis fis cis'>4 \4 \3 \2 \1 <a dis fis cis'>4 \4 \3 \2 \1
  <b d g>4. \3 \2 \1 <b d g>8 ~ \3 \2 \1 <b d g>4 \3 \2 \1 r8 <c e a>8 ~ \3 \2 \1 | % 26
  <c e a>4. \3 \2 \1 <c e a>8 ~ \3 \2 \1 <c e a>4 \3 \2 \1 <c e a>4 \3 \2 \1 | % 27
  <b d g>4. \3 \2 \1 <b d g>8 ~ \3 \2 \1 <b d g>4 \3 \2 \1 r8 <c e a>8 ~ \3 \2 \1 | % 28
  <c e a>4. \3 \2 \1 <c e a>8 ~ \3 \2 \1 <c e a>4 \3 \2 \1 <c e a>4 \3 \2 \1 | % 29
  <b d g>4. \3 \2 \1 <b d g>8 ~ \3 \2 \1 <b d g>4 \3 \2 \1 r8 <c e a>8 ~ \3 \2 \1 | 
  <c e a>4. \3 \2 \1 <c e a>8 ~ \3 \2 \1 <c e a>4 \3 \2 \1 <c e a>4 \3 \2 \1 | % 31
  <b d g>4. \3 \2 \1 <b d g>8 ~ \3 \2 \1 <b d g>4 \3 \2 \1 r8 <c e a>8 ~ \3 \2 \1 | % 32
  <c e a>4. \3 \2 \1 <c e a>8 ~ \3 \2 \1 <c e a>4 \3 \2 \1 <c e a>4 \3 \2 \1 | % 33
  <g b e>4. \3 \2 \1 <g b e>8 ~ \3 \2 \1 <g b e>4 \3 \2 \1 r8 <b e g>8 ~ \3 \2 \1 | % 34
  <b e g>4. \3 \2 \1 <b e g>8 ~ \3 \2 \1 <b e g>4 \3 \2 \1 <g b e>4 \3 \2 \1 | % 35
  <g b e>4. \3 \2 \1 <g b e>8 ~ \3 \2 \1 <g b e>4 \3 \2 \1 r8 <b e g>8 ~ \3 \2 \1 | % 36
  <b e g>4. \3 \2 \1 <b e g>8 ~ \3 \2 \1 <b e g>4 \3 \2 \1 <g b e>4 \3 \2 \1 | % 37
  <g c e>4. \3 \2 \1 <g c e>8 ~ \3 \2 \1 <g c e>4 \3 \2 \1 r8 <a c fis>8 ~ \3 \2 \1 | % 38
  <a c fis>4. \3 \2 \1 <a c fis>8 ~ \3 \2 \1 <a c fis>4 \3 \2 \1 <a c fis>4 \3 \2 \1 | % 39
  <b d fis>4. \3 \2 \1 <b d fis>8 ~ \3 \2 \1 <b d fis>4 \3 \2 \1 r8 <b e g>8 ~ \3 \2 \1 | 
  <b e g>4. \3 \2 \1 <b e g>8 ~ \3 \2 \1 <b e g>4 \3 \2 \1 <b e g>4 \3 \2 \1 | % 41
  <b d fis>4. \3 \2 \1 <b d fis>8 ~ \3 \2 \1 <b d fis>4 \3 \2 \1 r8 <b e g>8 ~ \3 \2 \1 | % 42
  <b e g>4. \3 \2 \1 <b e g>8 ~ \3 \2 \1 <b e g>4 \3 \2 \1 <b e g>4 \3 \2 \1 | % 43
  <c e a>4. \3 \2 \1 <c e a>8 ~ \3 \2 \1 <c e a>4 \3 \2 \1 r8 <a dis fis cis'>8 ~ \4 ~ \3 \2 \1 | % 44
  <a dis fis cis'>4. \4 \3 \2 \1 <a dis fis cis'>8 ~ \4 ~ \3 \2 \1 <a dis fis cis'>4 \4 \3 \2 \1 <a dis fis cis'>4 \4 \3 \2 \1
  <b d g>4. \3 \2 \1 <b d g>8 ~ \3 \2 \1 <b d g>4 \3 \2 \1 r8 <b d g>8 ~ \3 \2 \1 | % 46
  <b d g>4. \3 \2 \1 <b d g>8 ~ \3 \2 \1 <b d g>4 \3 \2 \1 <b d g>4 \3 \2 \1 | % 47
  <c e a>4. \3 \2 \1 <c e a>8 ~ \3 \2 \1 <c e a>4 \3 \2 \1 r8 <a dis fis cis'>8 ~ \4 ~ \3 \2 \1 | % 48
  <a dis fis cis'>4. \4 \3 \2 \1 <a dis fis cis'>8 ~ \4 ~ \3 \2 \1 <a dis fis cis'>4 \4 \3 \2 \1 <a dis fis cis'>4 \4 \3 \2 \1 | % 49
  <b d g>4. \3 \2 \1 <b d g>8 ~ \3 \2 \1 <b d g>4 \3 \2 \1 r8 <b d g>8 ~ \3 \2 \1 | 
  <b d g>4. \3 \2 \1 <b d g>8 ~ \3 \2 \1 <b d g>4 \3 \2 \1 <b d g>4 \3 \2 \1 | % 51
  <g b e>4. \3 \2 \1 <g b e>8 ~ \3 \2 \1 <g b e>4 \3 \2 \1 r8 <b e g>8 ~ \3 \2 \1 | % 52
  <b e g>4. \3 \2 \1 <b e g>8 ~ \3 \2 \1 <b e g>4 \3 \2 \1 <g b e>4 \3 \2 \1 | % 53
  <g b e>4. \3 \2 \1 <g b e>8 ~ \3 \2 \1 <g b e>4 \3 \2 \1 r8 <b e g>8 ~ \3 \2 \1 | % 54
  <b e g>4. \3 \2 \1 <b e g>8 ~ \3 \2 \1 <b e g>4 \3 \2 \1 <g b e>4 \3 \2 \1 | % 55
  <g c e>4. \3 \2 \1 <g c e>8 ~ \3 \2 \1 <g c e>4 \3 \2 \1 r8 <a c fis>8 ~ \3 \2 \1 | % 56
  <a c fis>4. \3 \2 \1 <a c fis>8 ~ \3 \2 \1 <a c fis>4 \3 \2 \1 <a c fis>4 \3 \2 \1 | % 57
  <b d fis>4. \3 \2 \1 <b d fis>8 ~ \3 \2 \1 <b d fis>4 \3 \2 \1 r8 <b e g>8 ~ \3 \2 \1 | % 58
  <b e g>4. \3 \2 \1 <b e g>8 ~ \3 \2 \1 <b e g>4 \3 \2 \1 <b e g>4 \3 \2 \1 | % 59
  <g b e>4. \3 \2 \1 <g b e>8 ~ \3 \2 \1 <g b e>4 \3 \2 \1 r8 <a c fis>8 ~ \3 \2 \1 | 
  <a c fis>4. \3 \2 \1 <a c fis>8 ~ \3 \2 \1 <a c fis>4 \3 \2 \1 <a c fis>4 \3 \2 \1 | % 61
  <b d g>4. \3 \2 \1 <b d g>8 ~ \3 \2 \1 <b d g>4 \3 \2 \1 r8 <c e a>8 ~ \3 \2 \1 | % 62
  <c e a>4. \3 \2 \1 <c e a>8 ~ \3 \2 \1 <c e a>4 \3 \2 \1 <c e a>4 \3 \2 \1 | % 63
  <b d g>4. \3 \2 \1 <b d g>8 ~ \3 \2 \1 <b d g>4 \3 \2 \1 r8 <c e a>8 ~ \3 \2 \1 | % 64
  <c e a>4. \3 \2 \1 <c e a>8 ~ \3 \2 \1 <c e a>4 \3 \2 \1 <c e a>4 \3 \2 \1 | % 65
  <b d g>4. \3 \2 \1 <b d g>8 ~ \3 \2 \1 <b d g>4 \3 \2 \1 r8 <c e a>8 ~ \3 \2 \1 | % 66
  <c e a>4. \3 \2 \1 <c e a>8 ~ \3 \2 \1 <c e a>4 \3 \2 \1 <c e a>4 \3 \2 \1 | % 67
  <b d g>4. \3 \2 \1 <b d g>8 ~ \3 \2 \1 <b d g>4 \3 \2 \1 r8 <c e a>8 ~ \3 \2 \1 | % 68
  <c e a>4. \3 \2 \1 <c e a>8 ~ \3 \2 \1 <c e a>4 \3 \2 \1 <c e a>4 \3 \2 \1 | % 69
  <b d g>4. \3 \2 \1 <b d g>8 ~ \3 \2 \1 <b d g>4 \3 \2 \1 <b d g>4 \3 \2 \1 | 
  r8 <c e a>4. ~ \3 \2 \1 -\f <c e a>2 \fermata \3 \2 \1 
}

Paroles = \lyricmode {

  %[Verse 1]
  Rain -- drops on ro -- ses and whis -- kers on kit -- tens
  Bright cop -- per ket -- tles and warm woo -- len mit -- tens____
  Brown pa -- per pac -- ka -- ges tied up with strings
  These are a few of my fa -- vo -- rite things
  %[Verse 3]
  Girls in white dre -- sses with blue sa -- tin sa -- shes
  Snow -- flakes that stay on my nose and eye -- la -- shes____
  Sil -- ver white win -- ters that melt in -- to springs
  These are a few of my fa -- vo -- rite things
  %[Hook]
  When the dog bites, when the bee stings
  When I'm fee -- ling sad
  I sim -- ply re -- mem -- ber my fa -- vo -- rite things
  And then I don't feel, don't feel so bad
}

ParolesII = \lyricmode {
  %[Verse 2]
  Cream co -- lored po -- nies and crisp ap -- ple stru -- dels
  Door -- bells and sleigh bells and schnit -- zel with noo -- dles
  Wild geese that fly with the moon on their wings
  These are a few of my fa -- vo -- rite things
}


\book {
  #(define output-suffix "Da4")
  \paper {
    #(set-paper-size "a4")
    first-page-number =#0
    print-page-number = ##t
  }  \bookpart {
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "My Favorite Things" }
        \fill-line { "Music for Little Big Band" }
        \vspace #2
        \fontsize #4 {
          \fill-line { \circle \bold \concat {" " \musicglyph "clefs.G_change" " "} }
          \fill-line { "Conductor" } 
        }
        \vspace #2      
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Full Score \fontsize #-2 "(conductor)"} }
          \vspace #0.3
          \line  {  \hspace #15 Vocal }
          \vspace #0.3
          \line  {  \hspace #15 Horn I \fontsize #-2 "(Alto Sax)" }
          \vspace #0.3
          \line  {  \hspace #15 Horn II \fontsize #-2 "(Tenor Sax)" }
          \vspace #0.3
          \line  {  \hspace #15 Horn III \fontsize #-2 "(Baryton Sax)" }
          \vspace #0.3
          \line  {  \hspace #15 Horn IV \fontsize #-2 "(Trumpet 1)" }
          \vspace #0.3
          \line  {  \hspace #15 Horn V \fontsize #-2 "(Trumpet 2)" }
          \vspace #0.3
          \line  {  \hspace #15 Horn VI \fontsize #-2 "(Trombone)" }
          \vspace #0.3
          \line  {  \hspace #15 Piano }
          \vspace #0.3
          \line  {  \hspace #15 Guitare }
          \vspace #0.3
          \line  {  \hspace #15  Bass }
        }
        \vspace #3
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
        \vspace #3
       \fill-line { \epsfile #X #20 #"QRC-MyRealBook.eps" }
      }
    }
  }   \bookpart {
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { "My Favorite Things (Richard Rogers) - Full Score" } } }
      ragged-last-bottom = ##f
      ragged-bottom = ##f
    }
    \score {
      <<
        \new Staff
        <<
          \set Staff.instrumentName = "Vocal"
          \set Staff.shortInstrumentName = "Voc."

          \context Staff <<
            \context Voice = "Vocal" {  \Vocal }
            \addlyrics \Paroles
            \addlyrics \ParolesII
            \context Voice = "Ossature" {  \ossatureCond }
          >>
        >>
        \new StaffGroup 
        <<
          \new Staff \with { instrumentName = \markup { \center-column { "Horn 1" \line { "(A.Sax)" } } } 
                             shortInstrumentName = "A.Sx" midiInstrument = "alto sax" } 
          <<
            \context Staff <<
              \context Voice = "Alto" {  \transpose c a \Alto }
            >>
          >>
          \new Staff \with { instrumentName = \markup { \center-column { "Horn 2" \line { "(T.Sax)" } } } 
                             shortInstrumentName = "T.Sx" midiInstrument = "tenor sax" } 
          <<
            \context Staff <<
              \context Voice = "Tenor" {   \transpose c d \Tenor }
            >>
          >>
          \new Staff \with { instrumentName = \markup { \center-column { "Horn 3" \line { "(B.Sax)" } } } 
                             shortInstrumentName = "B.Sx" midiInstrument = "baritone sax" } 
          <<
            \context Staff <<
              \context Voice = "Baryton" {   \transpose c a \Baryton }
            >>
          >>
        >>
        \new StaffGroup <<
          \new Staff \with { instrumentName = \markup { \center-column { "Horn 4" \line { "(Tpt.1)" } } } 
                             shortInstrumentName = "Tpt.1" midiInstrument = "trumpet"} 
          <<
            \context Staff <<
              \context Voice = "Trumpet" {  \transpose c d \TrumpetI }
            >>
          >>
          \new Staff \with { instrumentName = \markup { \center-column { "Horn 5" \line { "(Tpt.2)" } } } 
                             shortInstrumentName = "Tpt.2" midiInstrument = "trumpet"} 
          <<
            \context Staff <<
              \context Voice = "Trumpet" {  \transpose c d \TrumpetII }
            >>
          >>
          \new Staff \with { instrumentName = \markup { \center-column { "Horn 6" \line { "(Tbn.)" } } }  
                             shortInstrumentName = "Tbn."  midiInstrument = "trombone"} 
          <<
            \context Staff <<
              \context Voice = "Trombone" {  \clef bass \Trombone }
            >>
          >>
        >>
        \new StaffGroup <<
          \new PianoStaff
          <<
            \set PianoStaff.instrumentName = "Piano"
            \set PianoStaff.shortInstrumentName = "Pno"

            \context Staff = "1" <<
              \context Voice = "PianoMD" {  \PianoMD }
            >> \context Staff = "2" <<
              \context Voice = "PianoMG" {  \PianoMG }
            >>
          >>
          \context ChordNames = "Accords" { \Accords}
          \new Staff \with { instrumentName = "Guitar" 
                             shortInstrumentName = "guit." midiInstrument = "guitar" } 
          <<
            \set Staff.instrumentName = "Guitare"
            \set Staff.shortInstrumentName = "Guit."

            \context Staff <<
              \context Voice = "Guitare" {  \Guitare }
            >>
          >>
          \new Staff
          <<
            \set Staff.instrumentName = "Bass"
            \set Staff.shortInstrumentName = "Bass"

            \context Staff <<
              \context Voice = "Basse" {  \clef bass \Basse }
            >>
          >>
        >> 
      >>
      \layout {
        \context {
          \Score
          \override Clef #'break-visibility = #'#(#f #f #t)
        }

      }
} } }


\book {
  #(define output-suffix "Ca4")
  \paper {
    #(set-paper-size "a4")
    print-page-number = ##t
    print-first-page-number = ##f
  }  
  \bookpart {
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "My Favorite Things" }
        \fill-line { "Music for Little Big Band" }
        \vspace #2
        \fontsize #4 {
          \fill-line \fontsize #6 { \circle \bold \concat {C \raise #-1 K} }
          \fill-line \fontsize #2 { "C version" } 
        }
        \vspace #2      
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline Vocal }
          \vspace #0.3
          \page-link #3 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(Alto Sax)" } }
          \vspace #0.3
          \page-link #4 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Tenor Sax)" } }
          \vspace #0.3
          \page-link #5 \line  {  \hspace #10 \underline { Horn III \fontsize #-2 "(Baryton Sax)" } }
          \vspace #0.3
          \page-link #6 \line  {  \hspace #10 \underline { Horn IV \fontsize #-2 "(Trumpet 1)" } }
          \vspace #0.3
          \page-link #7 \line  {  \hspace #10 \underline { Horn V \fontsize #-2 "(Trumpet 2)" } }
          \vspace #0.3
          \page-link #8 \line  {  \hspace #10 \underline { Horn VI \fontsize #-2 "(Trombone)" } }
          \vspace #0.3
          \page-link #9 \line  {  \hspace #10 \underline Piano }
          \vspace #0.3
          \page-link #11 \line  {  \hspace #10 \underline Guitare }
          \vspace #0.3
          \page-link #13 \line  {  \hspace #10  \underline Bass }
        }
        \vspace #1
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  }   
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \paper {
      print-page-number = ##f
    }      
    \score {
      <<
        \context ChordNames = "Accords" { \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = "Vocal"
          \context Staff <<
            \context Voice = "Vocal" {  \Vocal }
            \addlyrics \Paroles
            \addlyrics \ParolesII
            \context Voice = "Ossature" {  \ossature }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      print-page-number = ##f
    }      
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \context ChordNames = "Accords" { \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 1" \line { "(A.Sax)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Alto" {  \transpose c c' \Alto }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      print-page-number = ##f
    }      
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \context ChordNames = "Accords" { \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 2" \line { "(T.Sax)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Tenor" {   \Tenor }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      print-page-number = ##f
    }      
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \context ChordNames = "Accords" { \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 3" \line { "(B.Sax)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Baryton" { \clef bass \transpose c c, \Baryton }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      print-page-number = ##f
    }      
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \context ChordNames = "Accords" { \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 4" \line { "(Tpt.1)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Trumpet" {  \TrumpetI }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      print-page-number = ##f
    }      
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \context ChordNames = "Accords" { \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 5" \line { "(Tpt.2)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Trumpet" {  \TrumpetII }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      print-page-number = ##f
    }      
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \context ChordNames = "Accords" { \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 6" \line { "(Tbn.)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Trombone" {  \clef bass \Trombone }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \new PianoStaff
        <<
          \set PianoStaff.instrumentName = "Piano"

          \context Staff = "1" <<
            \context Voice = "PianoMD" {  \PianoMD }
            \context Voice = "Ossature" {  \ossaturePiano }
          >> 
          \context ChordNames = "Accords" { \Accords}
          \context Staff = "2" <<
            \context Voice = "PianoMG" {  \PianoMG }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \context ChordNames = "Accords" { \Accords}
        \new Staff \with { instrumentName = "Guitar" } 
        <<
          \context Staff <<
            \context Voice = "Guitare" {  \Guitare }
            \context Voice = "Ossature" {  \ossatureGuit }
          >>
          \new TabStaff
          <<
            \GuitareTabs
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      print-page-number = ##f
    }      
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \context ChordNames = "Accords" { \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = "Bass"

          \context Staff <<
            \context Voice = "Basse" {  \clef bass \Basse }
            \context Voice = "Ossature" {  \ossature }
          >>
        >>
      >>
      \layout {}
} } }

\book {
  #(define output-suffix "CTab")
  \paper {
    #(set-paper-size "tablette")
    print-page-number = ##t
    print-first-page-number = ##f
  }  
  \bookpart {
    \markup {
      \column {      
        \vspace #1
        \fill-line { \fontsize #9 "My Favorite Things" }
        \fill-line { "Music for Little Big Band" }
        \vspace #2
        \fill-line \fontsize #6 { \circle \bold \concat {C \raise #-1 K} }
        \fill-line \fontsize #2 { "C version" } 
        \fontsize #3 {
          \page-link #2 \line  {  \hspace #10 \underline Vocal }
          \page-link #5 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(Alto Sax)" } }
          \page-link #7 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Tenor Sax)" } }
          \page-link #9 \line  {  \hspace #10 \underline { Horn III \fontsize #-2 "(Baryton Sax)" } }
          \page-link #11 \line  {  \hspace #10 \underline { Horn IV \fontsize #-2 "(Trumpet 1)" } }
          \page-link #13 \line  {  \hspace #10 \underline { Horn V \fontsize #-2 "(Trumpet 2)" } }
          \page-link #15 \line  {  \hspace #10 \underline { Horn VI \fontsize #-2 "(Trombone)" } }
          \page-link #17 \line  {  \hspace #10 \underline Piano }
          \page-link #21 \line  {  \hspace #10 \underline Guitare }
          \page-link #25 \line  {  \hspace #10  \underline Bass }
        }
        \override #'(line-width . 120)
        \fontsize #1 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  }   
  \bookpart {
    \header { meter = \markup \pad-around #1 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \paper {
      page-count = #3
    }      
    \score {
      <<
        \context ChordNames = "Accords" { \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = "Vocal"
          \context Staff <<
            \context Voice = "Vocal" {  \Vocal }
            \addlyrics \Paroles
            \addlyrics \ParolesII
            \context Voice = "Ossature" {  \ossature }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      page-count = #2
    }      
    \header { meter = \markup \pad-around #1 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \context ChordNames = "Accords" { \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 1" \line { "(A.Sax)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Alto" { \transpose c c'  \Alto }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      page-count = #2
    }      
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \context ChordNames = "Accords" { \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 2" \line { "(T.Sax)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Tenor" {   \Tenor }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      page-count = #2
    }      
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \context ChordNames = "Accords" { \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 3" \line { "(B.Sax)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Baryton" { \clef bass \transpose c c, \Baryton }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      page-count = #2
    }      
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \context ChordNames = "Accords" { \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 4" \line { "(Tpt.1)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Trumpet" {  \TrumpetI }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      page-count = #2
    }      
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \context ChordNames = "Accords" { \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 5" \line { "(Tpt.2)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Trumpet" {  \TrumpetII }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      page-count = #2
    }      
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \context ChordNames = "Accords" { \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 6" \line { "(Tbn.)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Trombone" {  \clef bass \Trombone }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \new PianoStaff
        <<
          \set PianoStaff.instrumentName = "Piano"

          \context Staff = "1" <<
            \context Voice = "PianoMD" {  \PianoMD }
            \context Voice = "Ossature" {  \ossaturePiano }
          >> 
          \context ChordNames = "Accords" { \Accords}
          \context Staff = "2" <<
            \context Voice = "PianoMG" {  \PianoMG }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \context ChordNames = "Accords" { \Accords}
        \new Staff \with { instrumentName = "Guitar" } 
        <<
          \context Staff <<
            \context Voice = "Guitare" {  \Guitare }
            \context Voice = "Ossature" {  \ossatureGuit }
          >>
          \new TabStaff
          <<
            \GuitareTabs
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      page-count = #2
    }      
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \context ChordNames = "Accords" { \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = "Bass"

          \context Staff <<
            \context Voice = "Basse" {  \clef bass \Basse }
            \context Voice = "Ossature" {  \ossature }
          >>
        >>
      >>
      \layout {}
} } }


\book {
  #(define output-suffix "Bba4")
  \paper {
    #(set-paper-size "a4")
    print-page-number = ##t
    print-first-page-number = ##f
  }  
  \bookpart {
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "My Favorite Things" }
        \fill-line { "Music for Little Big Band" }
        \vspace #2
        \fontsize #4 {
          \fill-line \fontsize #6 { \circle \bold \concat {" " B  \flat " "} }
          \fill-line \fontsize #2 { \concat {B \small \flat " Version"} } 
        }
        \vspace #2      
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(Alto Sax)" } }
          \vspace #0.3
          \page-link #3 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Tenor Sax)" } }
          \vspace #0.3
          \page-link #4 \line  {  \hspace #10 \underline { Horn III \fontsize #-2 "(Baryton Sax)" } }
          \vspace #0.3
          \page-link #5 \line  {  \hspace #10 \underline { Horn IV \fontsize #-2 "(Trumpet 1)" } }
          \vspace #0.3
          \page-link #6 \line  {  \hspace #10 \underline { Horn V \fontsize #-2 "(Trumpet 2)" } }
          \vspace #0.3
          \page-link #7 \line  {  \hspace #10 \underline { Horn VI \fontsize #-2 "(Trombone)" } }
          \vspace #0.3
          \page-link #8 \line  {  \hspace #10  \underline Bass }
        }
        \vspace #1
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  }   

  \bookpart {
    \paper {
      print-page-number = ##f
    }      
    \header { meter = \markup \fontsize #3 \pad-around #2 \circle \bold \concat {" " B  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 1" \line { "(A.Sax)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Alto" {  \transpose c d' \Alto }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      print-page-number = ##f
    }      
    \header { meter = \markup \fontsize #3 \pad-around #2 \circle \bold \concat {" " B  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 2" \line { "(T.Sax)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Tenor" { \transpose c d \Tenor }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      print-page-number = ##f
    }      
    \header { meter = \markup \fontsize #3 \pad-around #2 \circle \bold \concat {" " B  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 3" \line { "(B.Sax)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Baryton" { \transpose c d' \Baryton }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      print-page-number = ##f
    }      
    \header { meter = \markup \fontsize #3 \pad-around #2 \circle \bold \concat {" " B  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 4" \line { "(Tpt.1)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Trumpet" {  \transpose c d \TrumpetI }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      print-page-number = ##f
    }      
    \header { meter = \markup \fontsize #3 \pad-around #2 \circle \bold \concat {" " B  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 5" \line { "(Tpt.2)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Trumpet" {  \transpose c d \TrumpetII }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      print-page-number = ##f
    }      
    \header { meter = \markup \fontsize #3 \pad-around #2 \circle \bold \concat {" " B  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 6" \line { "(Tbn.)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Trombone" {  \transpose c d'' \Trombone }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }

  \bookpart {
    \paper {
      print-page-number = ##f
    }      
    \header { meter = \markup \fontsize #3 \pad-around #2 \circle \bold \concat {" " B  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = "Wind Bass"

          \context Staff <<
            \context Voice = "Basse" { \transpose c d'' \Basse }
            \context Voice = "Ossature" {  \ossature }
          >>
        >>
      >>
      \layout {}
} } }

\book {
  #(define output-suffix "BbTab")
  \paper {
    #(set-paper-size "tablette")
    print-page-number = ##t
    print-first-page-number = ##f
  }  
  \bookpart {
    \markup {
      \column {      
        \vspace #1
        \fill-line { \fontsize #9 "My Favorite Things" }
        \fill-line { "Music for Little Big Band" }
        \vspace #2
        \fill-line \fontsize #6 { \circle \bold \concat {" " B  \flat " "} }
        \fill-line \fontsize #2 { \concat {B \small \flat " Version"} } 
        \fontsize #3 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(Alto Sax)" } }
          \page-link #4 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Tenor Sax)" } }
          \page-link #6 \line  {  \hspace #10 \underline { Horn III \fontsize #-2 "(Baryton Sax)" } }
          \page-link #8 \line  {  \hspace #10 \underline { Horn IV \fontsize #-2 "(Trumpet 1)" } }
          \page-link #10 \line  {  \hspace #10 \underline { Horn V \fontsize #-2 "(Trumpet 2)" } }
          \page-link #12 \line  {  \hspace #10 \underline { Horn VI \fontsize #-2 "(Trombone)" } }
          \page-link #14 \line  {  \hspace #10  \underline "Wind Bass" }
        }
        \override #'(line-width . 120)
        \fontsize #1 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  }   
  \bookpart {
    \paper {
      page-count = #2
    }      
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 1" \line { "(A.Sax)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Alto" {  \transpose c d' \Alto }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      page-count = #2
    }      
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 2" \line { "(T.Sax)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Tenor" {   \transpose c d \Tenor }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      page-count = #2
    }      
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 3" \line { "(B.Sax)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Baryton" { \transpose c d' \Baryton }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      page-count = #2
    }      
    \header { meter = \markup \pad-around #1 \circle \bold \concat {" " B  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 4" \line { "(Tpt.1)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Trumpet" {  \transpose c d \TrumpetI }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      page-count = #2
    }      
    \header { meter = \markup \pad-around #2 \circle \bold \concat {" " B  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 5" \line { "(Tpt.2)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Trumpet" {  \transpose c d \TrumpetII }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      page-count = #2
    }      
    \header { meter = \markup \pad-around #2 \circle \bold \concat {" " B  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 6" \line { "(Tbn.)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Trombone" {  \transpose c d'' \Trombone }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      page-count = #2
    }      
    \header { meter = \markup \pad-around #1 \circle \bold \concat {" " B  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c d \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = "Wind Bass"

          \context Staff <<
            \context Voice = "Basse" {  \transpose c d'' \Basse }
            \context Voice = "Ossature" {  \ossature }
          >>
        >>
      >>
      \layout {}
} } }

\book {
  #(define output-suffix "Eba4")
  \paper {
    #(set-paper-size "a4")
    print-page-number = ##t
    print-first-page-number = ##f
  }  
  \bookpart {
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "My Favorite Things" }
        \fill-line { "Music for Little Big Band" }
        \vspace #2
        \fontsize #4 {
          \fill-line \fontsize #6 { \circle \bold \concat {" " E  \flat " "} }
          \fill-line \fontsize #2 { \concat {E \small \flat " Version"} } 
        }
        \vspace #2      
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(Alto Sax)" } }
          \vspace #0.3
          \page-link #3 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Tenor Sax)" } }
          \vspace #0.3
          \page-link #4 \line  {  \hspace #10 \underline { Horn III \fontsize #-2 "(Baryton Sax)" } }
          \vspace #0.3
          \page-link #5 \line  {  \hspace #10 \underline { Horn IV \fontsize #-2 "(Trumpet 1)" } }
          \vspace #0.3
          \page-link #6 \line  {  \hspace #10 \underline { Horn V \fontsize #-2 "(Trumpet 2)" } }
          \vspace #0.3
          \page-link #7 \line  {  \hspace #10 \underline { Horn VI \fontsize #-2 "(Trombone)" } }
          \vspace #0.3
          \page-link #8 \line  {  \hspace #10  \underline "Wind Bass" }
        }
        \vspace #1
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  }   

  \bookpart {
    \paper {
      print-page-number = ##f
    }      
    \header { meter = \markup \fontsize #3 \pad-around #2 \circle \bold \concat {" " E  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 1" \line { "(A.Sax)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Alto" {  \transpose c a \Alto }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      print-page-number = ##f
    }      
    \header { meter = \markup \fontsize #3 \pad-around #2 \circle \bold \concat {" " E  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 2" \line { "(T.Sax)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Tenor" { \transpose c a \Tenor }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      print-page-number = ##f
    }      
    \header { meter = \markup \fontsize #3 \pad-around #2 \circle \bold \concat {" " E  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 3" \line { "(B.Sax)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Baryton" { \transpose c a \Baryton }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      print-page-number = ##f
    }      
    \header { meter = \markup \fontsize #3 \pad-around #2 \circle \bold \concat {" " E  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 4" \line { "(Tpt.1)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Trumpet" {  \transpose c a, \TrumpetI }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      print-page-number = ##f
    }      
    \header { meter = \markup \fontsize #3 \pad-around #2 \circle \bold \concat {" " E  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 5" \line { "(Tpt.2)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Trumpet" {  \transpose c a \TrumpetII }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      print-page-number = ##f
    }      
    \header { meter = \markup \fontsize #3 \pad-around #2 \circle \bold \concat {" " E  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 6" \line { "(Tbn.)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Trombone" {  \transpose c a' \Trombone }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }

  \bookpart {
    \paper {
      print-page-number = ##f
    }      
    \header { meter = \markup \fontsize #3 \pad-around #2 \circle \bold \concat {" " E  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = "Wind Bass"

          \context Staff <<
            \context Voice = "Basse" { \transpose c a' \Basse }
            \context Voice = "Ossature" {  \ossature }
          >>
        >>
      >>
      \layout {}
} } }

\book {
  #(define output-suffix "EbTab")
  \paper {
    #(set-paper-size "tablette")
    print-page-number = ##t
    print-first-page-number = ##f
  }  
  \bookpart {
    \markup {
      \column {      
        \vspace #1
        \fill-line { \fontsize #9 "My Favorite Things" }
        \fill-line { "Music for Little Big Band" }
        \vspace #2
        \fill-line \fontsize #6 { \circle \bold \concat {" " E  \flat " "} }
        \fill-line \fontsize #2 { \concat {E \small \flat " Version"} } 
        \fontsize #3 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(Alto Sax)" } }
          \page-link #4 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Tenor Sax)" } }
          \page-link #6 \line  {  \hspace #10 \underline { Horn III \fontsize #-2 "(Baryton Sax)" } }
          \page-link #8 \line  {  \hspace #10 \underline { Horn IV \fontsize #-2 "(Trumpet 1)" } }
          \page-link #10 \line  {  \hspace #10 \underline { Horn V \fontsize #-2 "(Trumpet 2)" } }
          \page-link #12 \line  {  \hspace #10 \underline { Horn VI \fontsize #-2 "(Trombone)" } }
          \page-link #14 \line  {  \hspace #10  \underline "Wind Bass" }
        }
        \override #'(line-width . 120)
        \fontsize #1 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  }   
  \bookpart {
    \paper {
      page-count = #2
    }      
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 1" \line { "(A.Sax)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Alto" {  \transpose c a \Alto }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      page-count = #2
    }      
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 2" \line { "(T.Sax)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Tenor" {   \transpose c a \Tenor }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      page-count = #2
    }      
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 3" \line { "(B.Sax)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Baryton" { \transpose c a \Baryton }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      page-count = #2
    }      
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 4" \line { "(Tpt.1)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Trumpet" {  \transpose c a, \TrumpetI }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      page-count = #2
    }      
    \header { meter = \markup \pad-around #2 \circle \bold \concat {" " E  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 5" \line { "(Tpt.2)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Trumpet" {  \transpose c a, \TrumpetII }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      page-count = #2
    }      
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 6" \line { "(Tbn.)" } } } } 
        <<
          \context Staff <<
            \context Voice = "Trombone" {  \transpose c a' \Trombone }
            \context Voice = "Ossature" {  \ossatureHorns }
          >>
        >>
      >>
    }
  }
  \bookpart {
    \paper {
      page-count = #2
    }      
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \score {
      <<
        \context ChordNames = "Accords" { \transpose c a \Accords}
        \new Staff
        <<
          \set Staff.instrumentName = "Wind Bass"

          \context Staff <<
            \context Voice = "Basse" {  \transpose c a' \Basse }
            \context Voice = "Ossature" {  \ossature }
          >>
        >>
      >>
      \layout {}
} } }
