
\version "2.22.1"
#(set-global-staff-size 17)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "BookPartPagesNumber.ly"


\paper {
  ragged-last-bottom = ##t
  ragged-bottom = ##t
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 20)
                             (minimum-distance . 15)
                             (padding . 4))
  score-system-spacing = #'((basic-distance . 20)
                            (minimum-distance . 15)
                            (padding . 4))
  print-first-page-number = ##t
}

combo = ##t
title = #"Santa Cruz"
composer = #"Barry Olsen"
meter = #"(Med. Cha Cha)"
kwtempo = #"Medium"
kwstyle = #"Cha Cha"
%descr =#"Cha Cha for 2 trumpets, 1 trombone, 1 alto sax, 1 tenor sax and 1 baryton"

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
  asplayed = #"Ray Barretto" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=9o4uKKWqvnY"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
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
    \override NonMusicalPaperColumn #'line-break-permission = ##f
    \override NonMusicalPaperColumn #'page-break-permission = ##f
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
}



ossature =  \relative c {
  \set Score.markFormatter = #format-mark-box-letters
  \time 4/4 
  \mark \markup { \box { Intro } } 
  s1*16 \break \mark #1
  s1*8 \break s1*8 \break s1*8 \break s1*8 \break 
  \mark \markup \bold { \box { B } \with-color #red \musicglyph "scripts.varsegno"  } 
  s1*4 \break s1*4 \break s1*4 \break 
  s1*4 \break s1*4 \break s1*4 \break 
  \mark #3
  s1*7 \toCoda
  s1 \break \mark #4 s1*8 \break \bar "|."
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup \with-color #red "To Solos then D.S. al Coda"
}


ossatureCoda =  \relative c {
  \Coda s1*3 \mark \markup 6Xs s1*3 \bar ".."
}

ossatureDir =  \relative c {
  \set Score.markFormatter = #format-mark-box-letters
  \time 4/4 
  \mark \markup { \box { Intro } } 
  s1*4  \break 
  s1*4 \pageBreak 
  s1*4  \break 
  s1*4  \pageBreak \mark #1
  s1*4 \break 
  s1*4 \pageBreak 
  s1*4 \break 
  s1*4 \pageBreak 
  s1*4 \break 
  s1*4 \pageBreak 
  s1*4 \break 
  s1*4 \pageBreak
  \mark \markup \bold { \box { B } \with-color #red \musicglyph "scripts.varsegno"  }   
  s1*4 \break
  s1*4 \pageBreak 
  s1*4 \break 
  s1*4 \pageBreak 
  s1*4 \break 
  s1*4 \pageBreak \bar "||"
  \mark #3 s1*4 \break s1*3 
  \tweak self-alignment-X #RIGHT
  \mark \markup  { \page-link #13 { \with-color #(x11-color 'red) "To Coda" } }
  
  s1 \pageBreak
  \D s1*4 \break s1*4 \pageBreak \bar "|."
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup { \page-link #14 { \with-color #red "To Solos theb D.S. al Coda" } }
}

ossatureDirTab =  \relative c {
  \set Score.markFormatter = #format-mark-box-letters
  \time 4/4 
  \mark \markup { \box { Intro } } 
  s1*4  \pageBreak 
  s1*4 \pageBreak 
  s1*4  \pageBreak 
  s1*4  \pageBreak \mark #1
  s1*4 \pageBreak 
  s1*4 \pageBreak 
  s1*4 \pageBreak 
  s1*4 \pageBreak 
  s1*4 \pageBreak 
  s1*4 \pageBreak 
  s1*4 \pageBreak 
  s1*4 \pageBreak
  \mark \markup \bold { \box { B } \with-color #red \musicglyph "scripts.varsegno"  }   
  s1*4 \pageBreak
  s1*4 \pageBreak 
  s1*4 \pageBreak 
  s1*4 \pageBreak 
  s1*4 \pageBreak 
  s1*4 \pageBreak \bar "||"
  \mark #3 s1*4 \pageBreak s1*3 
  \tweak self-alignment-X #RIGHT
  \mark \markup  { \page-link #24 { \with-color #(x11-color 'red) "To Coda" } }
  s1 \pageBreak
  \D s1*4 \pageBreak s1*4 \pageBreak \bar "|."
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
   \mark \markup { \page-link #26 { \with-color #red "To Solos theb D.S. al Coda" } }
}

ossatureDirCoda =  \relative c {
  \Coda
  s1*3 \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible \mark \markup 6Xs \break
  s1*3 \bar ".."
}
ossatureDirCodaTab =  \relative c {
  \Coda
  s1*3 \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible \mark \markup 6Xs \pageBreak
  s1*3 \bar ".."
}

ossatureTab =  \relative c {
  \set Score.markFormatter = #format-mark-box-letters
  \time 4/4 
  \mark \markup { \box { Intro } } 
  s1*16 \break \mark #1
  s1*8 \break s1*8 \break s1*8 \break s1*8 \pageBreak 
  \mark \markup \bold { \box { B } \with-color #red \musicglyph "scripts.varsegno"  }
  s1*4 \break s1*4 \break s1*4 \break 
  s1*4 \break s1*4 \break s1*4 \break 
  \mark #3
  s1*7 \toCoda s1
  \break \mark #4 s1*8 \bar "|." \pageBreak
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup \with-color #red "To Solos theb D.S. al Coda"
}

ossatureTabTrbn =  \relative c {
  \set Score.markFormatter = #format-mark-box-letters
  \time 4/4 
  \mark \markup { \box { Intro } } 
  s1*16 \break \mark #1
  s1*8 \break s1*8 \break s1*8 \break s1*8 \pageBreak 
  \mark \markup \bold { \box { B } \with-color #red \musicglyph "scripts.varsegno"  }
  s1*4 s1*4 \break s1*4 s1*4 \break s1*4 s1*4 \break 
  \mark #3
  s1*7 \toCoda s1
  \break \mark #4 s1*8 \bar "|." \pageBreak
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup \with-color #red "To Solos then D.S. al Coda"
}

ossatureTabCoda =  \relative c {
  \Coda s1*3 \mark \markup 6Xs s \bar ".."
}



harmonies = \chordmode {
  \set chordChanges = ##t
  R1*16
  \repeat unfold 4 { g1:9 d:m7 }
  \repeat unfold 4 { g1:9 d:m7 }
  \repeat unfold 4 { as1:9 es1:m7 } 
  \repeat unfold 4 { g1:9 d1:m7 }
  cis1:m9 fis:13 b:m9 e:13 cis1:m9 fis:13 b:m9 e:13
  b:m9 e:13 a:7+ d:7+ es:m7 as:5+7.9-11+ cis:m9 fis:7
  b:m7 bes:5-7 a:maj7 d:7 
  es:aug7.9+ e:7 a:maj7 d:7
  \repeat unfold 4 { des1:7 as:m7 }
  \repeat unfold 4 { des1:13 as:m9 }
}

harmoniesB = \chordmode {
  \set chordChanges = ##t
  s1*8
  g1:9 d:m7 s1*6 
  g1:9 d:m7 s1*6
  g1:9 d:m7 s1*6 
  as1:9 es1:m7 s1*6 
  g1:9 d1:m7 s1*6 
  cis1:m9 fis:13 b:m9 e:13 cis1:m9 fis:13 b:m9 e:13
  b:m9 e:13 a:7+ d:7+ es:m7 as:5+7.9-11+ cis:m9 fis:7
  b:m7 bes:5-7 a:maj7 d:7 
  es:aug7.9+ e:7 a:maj7 d:7
  des1:7 as:m7 s1*6
  des1:13 as:m9 s1*6
}

harmoniesCoda = \chordmode {
  as1:m9 des:13 as:m9 des1*2:13 g1:7+11+
}


harmoniesDir = \chordmode {
  \set chordChanges = ##t
  g1:6 c:1.3.5.9 g1:6 c:1.3.5.9 g1:6 c:1.3.5.9 g1:6 c:1.3.5.9 
  g1:9 d:m7 g1:9 d:m7 g1:9 d:m7 g1:9 d:m7 
  g1:9 d:m7 g1:9 d:m7 g1:9 d:m7 g1:9 d:m7 
  g1:9 d:m7 g1:9 d:m7 g1:9 d:m7 g1:9 d:m7 
  as1:9 es1:m7 as1:9 es1:m7 as1:9 es1:m7 as1:9 es1:m7 
  g1:9 d:m7 g1:9 d:m7 g1:9 d:m7 g1:9 d:m7 
  cis1:m9 fis:13 b:m9 e:13 cis1:m9 fis:13 b:m9 e:13
  b:m9 e:13 a:7+ d:7+ es:m7 as:5+7.9-11+ cis:m9 fis:7
  b:m7 bes:5-7 a:maj7 d:7 
  es:aug7.9+ e:7 a:maj7 d:7 
  des1:7 as:m7 des1:7 as:m7 des1:7 as:m7 des1:7 as:m7 
  des1:13 as:m9 des1:13 as:m9 des1:13 as:m9 des1:13 as:m9
}

harmoniesDirCoda = \chordmode {
  as1:m9 des:13 as:m9 des1*2:13 g1:7+11+
}

harmoniesP = \chordmode {
  \set chordChanges = ##t
  g1:6 c:1.3.5.9 g:9 d:m7 
  g1:9 d:m7 
  as1:9 es1:m7 
  g1:9 d1:m7 
  cis1:m9 fis:13 b:m9 e:13 cis1:m9 fis:13 b:m9 e:13
  b:m9 e:13 a:7+ d:7+ es:m7 as:5+7.9-11+ cis:m9 fis:7
  b:m7 bes:5-7 a:maj7 d:7 
  es:aug7.9+ e:7 a:maj7 d:7 
  des:7 as:m7  des:7 as:m7 
  des1:13 as:m9 des1:13 as:m9
}
harmoniesPCoda = \chordmode {
  as1:m9 des:13 as:m9 des1*2:13 g1:7+11+
}

Grille = \chordmode {
  des1:13 as:m9 
  d:13 a:m9
  des:13 as:m9
  g:m7 c:7 f:m7 bes:7
  f:m7 bes:7 es:7+ as:7+11+
  a:m5-7.9 d:5+7 g:m7 c:7
  f:m7 e:9.11+ es:7+ as:7+11+
  a:9+ bes:9 es:7+ as:7+11+
  g:13 d:m9 g:13 d:m9 
}

GrilleII = \chordmode {
  g1:13 d:m9 
  as:13 es:m9 
  g1:13 d:m9 
}

Chorus = \relative c {
  \override Staff.Clef.stencil = ##f
  \override Staff.TimeSignature.stencil = ##f
  \showStartRepeatBar \bar "[|:"
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup "Cha Cha"
  \repeat volta 4 { \comp #8 } \mark \markup 4x 
  \repeat volta 4 { \comp #8 } \mark \markup 4x 
  \repeat volta 4 { \comp #8 } \break
  \doubleMark
  \markup 4x 
  \markup Samba
  \repeat volta 2 { \comp #16 } 
  \comp #16  \break
  \comp #16  
  \comp #16  \break
  \comp #16  
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup "Cha Cha"
  \repeat volta 2 { \comp #16 }
}

ChorusII = \relative c {
  \override Staff.Clef.stencil = ##f
  \override Staff.TimeSignature.stencil = ##f
  \showStartRepeatBar \bar "[|:"
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup "Cha Cha"
  \repeat volta 2 { \comp #8 } 
  \mark \markup 4x
  \repeat volta 2 { \comp #8 }
  \repeat volta 2 { \comp #8 } 
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup { \with-color #red "D.S. al Coda" }
}

ChorusIIDir = \relative c {
  \override Staff.Clef.stencil = ##f
  \override Staff.TimeSignature.stencil = ##f
  \showStartRepeatBar \bar "[|:"
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup "Cha Cha"
  \repeat volta 2 { \comp #8 } 
  \mark \markup 4x
  \repeat volta 2 { \comp #8 }
  \repeat volta 2 { \comp #8 } 
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup { \page-link #8 { \with-color #red "D.S. al Coda" } }
}

ChorusIIDirTab = \relative c {
  \override Staff.Clef.stencil = ##f
  \override Staff.TimeSignature.stencil = ##f
  \showStartRepeatBar \bar "[|:"
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup "Cha Cha"
  \repeat volta 2 { \comp #8 } 
  \mark \markup 4x
  \repeat volta 2 { \comp #8 }
  \repeat volta 2 { \comp #8 } 
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup { \page-link #14 { \with-color #red "D.S. al Coda" } }
}



Basse =  \relative g {
  \transposition c \key c \major
  \compressEmptyMeasures
  \override MultiMeasureRest #'expand-limit = #2
  \time 4/4 | % 1
  \inlineMMRN R1*4 | % 5
  g2 ~  g8  b8  c8  d8 ~ |
  d2 ~  d4  e8  d8 |
  g4.  f8 ~  f2 |
  r8  c8  a8  d8  c8  a8 f8  d8 | \break
  \repeat percent 4 { 
    g,4.  b8 ~  b4  d4 ~ |
    d4.  c8 ~  c4  a4
  }
  \repeat percent 4 { 
    g4.  b8 ~  b4  d4 ~ |
    d4.  c8 ~  c4  a4 
  } 
  \repeat percent 4 { 
    g4.  b8 ~  b4  d4 ~ |
    d4.  c8 ~  c4  a4 
  } 
  \repeat percent 4 { 
    as4.  c8 ~  c4  es4 ~ | % 34
    es4.  des8 ~  des4  bes4 
  } 
  \repeat percent 4 { 
    g4.  b8 ~  b4  d4 ~ |
    d4.  c8 ~  c4  a4 
  } 
  cis'2  gis2 | 
  fis2  ais2 | 
  b2  fis2 |
  e2  gis2 |
  cis2  gis2 | 
  fis2  ais2 | 
  b2  fis2 | 
  e2  gis2 |
  b2  fis2 |
  e2  gis2 | 
  a2  e2 | 
  d8  d'8  cis8  a8 gis8  g8  fis8  f8 |
  es2  bes'2 | 
  as2  e4  d4 | 
  cis2  gis'2 | 
  fis4 r8  fis8  fis,4  b4 ~ | 
  b4 r4  fis'2 | 
  bes,2  e2 |
  a2  e2 |
  d2  a'2 |
  es2  b'2 | 
  e,2  b'2 |
  a2  e2 | 
  d2  a'2 |
  \repeat percent 3 { 
    des,4.  f8 ~  f4  as4 ~ | 
    as4.  ges8 ~  ges4  es4 |
  }
  des4.  f8 ~  f4  as4 ~ |
  as4.  ges8 ~  ges4  es4 
  \repeat percent 4 {
    des4.  f8 ~  f4  as4 ~ | 
    as4.  ges8 ~  ges4  es4 
  }
}

CodaBasse =  \relative g {
 \key c \major
  as4.  ges8 ~  ges4  es4 \repeat
  volta 2 {
    des4.  f8 ~  f4  as4 ~ | 
    as4.  ges8 ~  ges4  es4 |
  }
  des4.  f8 ~  f4  as4 |
  r8  des,8  c8  b8 r8  bes8  a8
  as8 | 
  g1 \fermata 
}

BasseDir =  \relative g {
  \transposition c \clef "bass" \key c \major
  \compressEmptyMeasures
  \override MultiMeasureRest #'expand-limit = #2
  \time 4/4 | % 1
  R1*4 | % 5
  g2 ~  g8  b8  c8  d8 ~ |
  d2 ~  d4  e8  d8 |
  g4.  f8 ~  f2 |
  r8  c8  a8  d8  c8  a8 f8  d8 |
  \repeat unfold 4 { 
    g,4.  b8 ~  b4  d4 ~ |
    d4.  c8 ~  c4  a4
  }
  \repeat unfold 4 { 
    g4.  b8 ~  b4  d4 ~ |
    d4.  c8 ~  c4  a4 
  } 
  \repeat unfold 4 { 
    g4.  b8 ~  b4  d4 ~ |
    d4.  c8 ~  c4  a4 
  } 
  \repeat unfold 4 { 
    as4.  c8 ~  c4  es4 ~ | % 34
    es4.  des8 ~  des4  bes4 
  } 
  \repeat unfold 4 { 
    g4.  b8 ~  b4  d4 ~ |
    d4.  c8 ~  c4  a4 
  } 
  cis'2  gis2 | 
  fis2  ais2 | 
  b2  fis2 |
  e2  gis2 |
  cis2  gis2 | 
  fis2  ais2 | 
  b2  fis2 | 
  e2  gis2 |
  b2  fis2 |
  e2  gis2 | 
  a2  e2 | 
  d8  d'8  cis8  a8 gis8  g8  fis8  f8 |
  es2  bes'2 | 
  as2  e4  d4 | 
  cis2  gis'2 | 
  fis4 r8  fis8  fis,4  b4 ~ | 
  b4 r4  fis'2 | 
  bes,2  e2 |
  a2  e2 |
  d2  a'2 |
  es2  b'2 | 
  e,2  b'2 |
  a2  e2 | 
  d2  a'2 |
  \repeat unfold 3 { 
    des,4.  f8 ~  f4  as4 ~ | 
    as4.  ges8 ~  ges4  es4 |
  }
  des4.  f8 ~  f4  as4 ~ |
  as4.  ges8 ~  ges4  es4 
  \repeat unfold 4 {
    des4.  f8 ~  f4  as4 ~ | 
    as4.  ges8 ~  ges4  es4 
  }
}

CodaBasseDir =  \relative g {
  \clef "bass" \key c \major
  \time 4/4 
  as4.  ges8 ~  ges4  es4 
  des4.  f8 ~  f4  as4 ~ | 
  as4.  ges8 ~  ges4  es4 |

  des4.  f8 ~  f4  as4 |
  r8  des,8  c8  b8 r8  bes8  a8
  as8 | 
  g1 \fermata 
}

PianoMD =  \relative c'' {
  \clef "treble" \key c \major \time 4/4 |
  \showStartRepeatBar \bar "[|:"
  \repeat volta 4 { 
    <b d e g>4  q r8  q r q | 
    r8  <c d e g> r  q ~ q4  q  
  }
  \mark \markup 4x
  \repeat volta 4 { 
    <d, a' d g>4  q r8  q8  r  q | 
    r8  <d a' d g> r  q ~ q4  q  | 
  }  \break 
  \doubleMark
  \markup 4X
  \markup \bold \box A
  \repeat volta 8 { 
    <d a' d g>4  q r8  q8  r  q | 
    r8  <d a' d g> r  q ~ q4  q  | 
  }
  \mark \markup 8x
  \repeat volta 4 { 
    <es bes' es as>4  q r8  q8  r  q | \break
    r8  <es bes' es as> r  q ~ q4  q  |
  } 
  \mark \markup 4x
  \repeat volta 4 { 
    <d a' d g>4  q r8  q8  r  q | 
    r8  <d a' d g> r  q ~ q4  q  | 
  } \break
  \doubleMark
  \markup 4X
  \markup { \bold \box \fontsize #2 B \raise #1 \with-color #red \musicglyph "scripts.varsegno"  }
  << { \override Rest #'staff-position = #0 \comp #32 } \\ { \hideNotes c1 \unHideNotes s1*7 } >> \break
  <d fis>2. r8  q ~ | 
  q2. r4 | 
  <cis e>2. r8  q ~ | 
  q2. r4 | 
  <f as>2. r8  <e b'>8 ~ |
  q2. r4 | 
  <e gis>2 r8  <e gis>8 r8  <e gis>8 ~ | 
  q4 r r  <fis cis'> ~ | \break
  q2. r8  <e c'>8 ~ |
  q2. r8  <e b'>8 ~  |
  q2. r8  <e b'>8 ~  |
  q2. r8  <fis b>8 ~  |
  q2. r8  <fis b>8 ~  | 
  q2. r8  <e b'>8 ~  |
  q2  gis4  e8  c8 ~ |
  c4.  <c e>8  <d fis>4  <c e>8 <ces es>8 ~  
  \bar "||-[|:" \C \break
  \repeat volta 3 {
    q4  q r8  q r8  q |
    r8  <ces es> r  q ~  q4  q
  }
  \mark \markup 3X
  <ces es>4  q r8  q r q | \toCoda
  r8  <ces es> r  q ~  q4  q |
  \bar "||-[|:" \D \break
  \repeat volta 4 {
    <ces es>4  q r8  q r  q |
    r8  <ces es> r  q  q4  q | 
    <ces es>4  q r8  q r  q |
    r8  <ces es> r  q  q4  q | 
  } 
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup \with-color #red "To Solos Then D.S. al Coda"
  %   \doubleMark
  %   \markup 4x
  %   \markup { \bold \larger \center-column {\pad-markup #2 " " \with-color #red \musicglyph "scripts.varcoda"} }
}

CodaPianoMD =  \relative c'' {
  \clef "treble" \key c \major \time 4/4 \Coda
  r8  <b es> r  q ~  q4  q 
  \repeat volta 6 {
    <c es>4  q r8  q r  q |
    r8  <ces es> r  q ~ q4 q |
  }
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \mark \markup 6X \break
  <c es>4  q r8  q r  q |
  r8  as' bes  <as des f> r as bes as |
  <d, a' cis>1 \fermata \bar ".."
}

CodaPianoMDTab =  \relative c'' {
  \clef "treble" \key c \major \time 4/4 \Coda
  r8  <b es> r  q ~  q4  q 
  \repeat volta 6 {
    <c es>4  q r8  q r  q |
    r8  <ces es> r  q ~ q4 q |
  }
  \mark \markup 6X 
  <c es>4  q r8  q r  q |
  r8  as' bes  <as des f> r as bes as |
  <d, a' cis>1 \fermata \bar ".."
}

PianoMG =  \relative f {
  \compressEmptyMeasures
  \override MultiMeasureRest #'expand-limit = #2
  \clef "bass" \key c \major \time 4/4 R1*2
  <f b>4  q r8  q r <f c'>
  r  q r  q ~ q4  q
  <f b>4  q r8  q r <f c'>
  r  q r  q ~ q4  q
  <ges c>4 q r8  q r <ges des'>
  r  q r  q ~ q4  q
  <f b>4  q r8  q r <f c'>
  r  q r  q ~ q4  q
  s1*8
  <a cis>2. r8  <gis cis>8 ~  
  q2. r4  
  <gis b>2. r8  <fis a>8 ~
  q2. r4  
  <ges des'>2. r8  <ges c>8 ~
  q2. r4  
  <b dis>2 r8  <b dis>8 r8 <ais dis>8 ~ 
  q4 r r  <a d> ~ 
  q2. r8  <as d> ~ 
  q2. r8 <gis cis> ~  
  q2. r8  <fis c'> ~  
  q2. r8  <g des'> ~  
  q2. r8  <gis d'> ~ 
  q2. r8 <gis cis> ~ 
  q2. r8  <fis c'> ~ 
  q2  <a c>4  <fis a>8 <f bes> ~
  <f bes>4  q r8  q r <ges bes>
  r8  <ges bes> r  q ~ q4  q
  <f bes>4  q r8  q r <ges bes>
  r8  <ges bes> r  q ~ q4  q
  <f bes>4  q r8  q r <ges bes>
  r8  <ges bes> r  q ~ q4  q
  <f bes>4  q r8  q r <ges bes>
  r8  <ges bes> r  q ~ q4  q
}

CodaPianoMG =  \relative c' {
  \clef "bass" \key c \major \time 4/4
  r8  <ges bes> r  q ~  q4  q
  <f bes>4  q r8  q r <ges bes>
  r8  <ges bes> r  q ~ q4  q
  <f bes>4  q r8  q r <ges bes>
  r  <des, des'>  <c c'> <b b'> r <bes bes'> <a a'> <as as'> <g g'>1 \fermata 
}

Guitare =  \relative c'' {
  \key c \major 
  \showStartRepeatBar \bar "[|:"
  \Intro
  \repeat volta 4 {
    <g b d e>4  q r8  q r  <g c d e>8 |
    r8 q r  q ~ q4  q |
  }
  \repeat volta 4 {
    <f b d a'>4  q r8  q r  <f c' d a'>8 |
    r8 q r  q ~ q4  q |
  }
  \break \A
  \repeat volta 8 {
    <f b d a'>4  q r8  q r  <f c' d a'>8 |
    r8 q r  q ~ q4  q |
  }
  \mark \markup 8X
  \repeat volta 4 {
    <ges c es bes'>4  q r8  q r  <ges des' es bes'>8 |
    r8 q r  q ~ q4  q |
  }
  \mark \markup 4X
  \repeat volta 4 {
    <f b d a'>4  q r8  q r  <f c' d a'>8 |
    r8 q r  q ~ q4  q |
  }
  \break
  \doubleMark
  \markup 4X
  \markup { \bold \box \fontsize #2 B \raise #1 \with-color #red \musicglyph "scripts.varsegno"  }

  \comp #32 | \break
  <d a' cis fis>2. r8  <d gis cis fis>8 ~ |
  <d gis cis fis>2. r4 |
  <e gis cis e>2. r8  <e a cis fis>8 ~ |
  <e a cis fis>2. r4 | 
  <ges bes des ges>2. r8  <ges b c e>8 ~ |
  <ges b c e>2. r4 | 
  <dis gis b e>2 r8  <dis gis b e>8 r8  <dis gis cis e>8 ~ | 
  <dis gis cis e>4 r4 r4  <d a' cis fis>4 ~ | \break
  <d a' cis fis>2. r8  <d gis c e>8 ~  | 
  <d gis c e>2. r8  <e gis cis e>8 ~  |
  <e gis cis e>2. r8  <e a c fis>8 ~ | 
  <e a c fis>2  <e a c fis>4 r8  <fis b cis g'>8 ~ |
  <fis b cis g'>2. r8  <d gis b e>8 ~  |
  <d gis b e>2. r8  <e gis cis e>8 ~  | 
  <e gis cis e>2. r8  <e a c fis>8 ~  | 
  <e a c fis>2  <e a c fis>8 r8  <e a c fis>8  <es as ces f>8 ~ | \break
  \C
  \repeat volta 4 {
    <es as ces f>4  <es as ces f>4 r8  <es as ces f>8 r8  <es as ces ges'>8 |
    r8  <es as ces ges'>8 r8  <es as ces ges'>8 ~ <es as ces ges'>4  <es as ces ges'>4 |
  }
  \mark \markup 3X
  <es as ces f>4  <es as ces f>4 r8  <es as ces f>8 r8  <es as ces ges'>8 |
  \toCoda
  r8  <es as ces ges'>8 r8  <es as ces ges'>8 ~ <es as ces ges'>4  <es as ces ges'>4 |
  \D 
  \repeat volta 4 {
    <es as ces f>4  <es as ces f>4 r8  <es as ces f>8 r8  <es as ces ges'>8 |
    r8  <es as ces ges'>8 r8  <es as ces ges'>8 ~ <es as ces ges'>4  <es as ces ges'>4 |
    <es as ces f>4  <es as ces f>4 r8  <es as ces f>8 r8  <es as ces ges'>8 |
    r8  <es as ces ges'>8 r8  <es as ces ges'>8 ~ <es as ces ges'>4  <es as ces ges'>4 |
  }
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup \with-color #red "To Solos Then D.S. al Coda"
}


GuitareDir =  \relative f {
  \clef "treble_8" \key c \major 
  \repeat unfold 4 {
    <g b d e>4  q r8  q r  <g c d e>8 |
    r8 q r  q ~ q4  q |
  }
  \repeat unfold 4 {
    <f b d a'>4  q r8  q r  <f c' d a'>8 |
    r8 q r  q ~ q4  q |
  }
  \repeat unfold 4 {
    <f b d a'>4  q r8  q r  <f c' d a'>8 |
    r8 q r  q ~ q4  q |
  }
  \repeat unfold 4 {
    <f b d a'>4  q r8  q r  <f c' d a'>8 |
    r8 q r  q ~ q4  q |
  }
  \repeat unfold 4 {
    <ges c es bes'>4  q r8  q r  <ges des' es bes'>8 |
    r8 q r  q ~ q4  q |
  }
  \repeat unfold 4 {
    <f b d a'>4  q r8  q r  <f c' d a'>8 |
    r8 q r  q ~ q4  q |
  }
  \comp #32 |
  <d a' cis fis>2. r8  <d gis cis fis>8 ~ <d gis cis fis>2. r4 |
  <e gis cis e>2. r8  <e a cis fis>8 ~ <e a cis fis>2. r4 | 
  <ges bes des ges>2. r8  <ges b c e>8 ~ <ges b c e>2. r4 | 
  <dis gis b e>2 r8  <dis gis b e>8 r8  <dis gis cis e>8 ~ | 
  <dis gis cis e>4 r4 r4  <d a' cis fis>4 ~ | 
  <d a' cis fis>2. r8  <d gis c e>8 ~  | 
  <d gis c e>2. r8  <e gis cis e>8 ~  |
  <e gis cis e>2. r8  <e a c fis>8 ~ |
  <e a c fis>2  <e a c fis>4 r8  <fis b cis g'>8 ~ |
  <fis b cis g'>2. r8  <d gis b e>8 ~  |
  <d gis b e>2. r8  <e gis cis e>8 ~  | 
  <e gis cis e>2. r8  <e a c fis>8 ~  | 
  <e a c fis>2  <e a c fis>8 r8  <e a c fis>8  <es as ces f>8 ~ |
  \repeat unfold 4 {
    <es as ces f>4  <es as ces f>4 r8  <es as ces f>8 r8  <es as ces ges'>8 |
    r8  <es as ces ges'>8 r8  <es as ces ges'>8 ~ <es as ces ges'>4  <es as ces ges'>4 |
  }
  \repeat unfold 4 {
    <es as ces f>4  <es as ces f>4 r8  <es as ces f>8 r8  <es as ces ges'>8 |
    r8  <es as ces ges'>8 r8  <es as ces ges'>8 ~ <es as ces ges'>4  <es as ces ges'>4 |
  }
}
CodaGuitareDir = \relative f' {
  \key c \major \Coda
  r8  <es as ces ges'>8 r8  <es as ces ges'>8 ~ <es as ces ges'>4  <es as ces ges'>4   

  <es as ces f>4  <es as ces f>4 r8 <es as ces f>8 r8  <es as ces ges'>8 |
  r8  <es as ces ges'>8 r8  <es as ces ges'>8 ~ <es as ces ges'>4  <es as ces ges'>4 | 

  <es as ces f>4  <es as ces f>4 r8  <es as ces f>8 r8  <es as ces ges'>8 | 
  r8  des8  c8  b8 r8  bes8  a8 as8 | 
  <g b d g cis fis>1 \fermata 
}

alto =  \relative c'' {
  \compressEmptyMeasures
  \override MultiMeasureRest #'expand-limit = #2
  \key c \major
  \time 4/4 
  \inlineMMRN R1*16 
  r4.  a8  dis8  e8  g8 e8 ~ -> |
  e8  c4 ->  a8 ~ ->  a8 d4 ->  b8 ~ |
  b8  g8  e4  d2 ~ |
  d2. r4 | 
  \times 2/3  { r4  e'4  f4 } \times 2/3  { g4  f4  e4 } |
  f4.  c8 ~  c4  d4 ~ |
  d8  b8  c4  a2 ~ |
  a2. r4 |
  r4.  a8  dis8  e8  g8 e8 ~ |
  e8  c4  a8 ~  a8  d4 b8 ~ | 
  b8  f8  b2. ~ |
  b2.  a'4 ~ | 
  a2 \glissando  a,4-. r | 
  R1*3 
  r4.  c8  ges'8  as8  bes8  c8 ~ |
  c8  as4  ges8 ~  ges8  bes4 as8 ~ |
  as8  f8  es4  des2 ~ | 
  des2. r4 |
  \times 2/3  { r4  f4  ges4 } \times 2/3  { as4  ges4  f4 } | 
  ges4.  f8 ~  f4  es4 ~ | 
  \times 2/3  { es4  c4  des4 ~ } des8  bes4. ~ | 
  bes2. r4 | 
  \times 2/3  { r4  e4  f4 } \times 2/3  { g4  f4  e4 } |
  f4.  d8 ~  d4  f4 ~ | 
  f8  d8  b8  d8  e2 ~ |
  e1 ~ | 
  e1 ~ | 
  e2 r2 |
  R1*2
  e4 r4 r8  e8 r8  e8 |
  r2 r8  e8 r8  e8 |
  r8  d4 r8 r8  d8 r8  d8 |
  r2 r8  d8 r8  d8 |
  r8  e4 r8 r8  e8 r8  e8 |
  r2 r8  e8 r8  e8 | 
  r8  d4 r8 r8  d8 r8  d8 |
  r2 r8  d8 r4 | 
  fis2 r4.  fis8 ~ | 
  fis4. r8  d4  d4 | 
  cis4.  gis'8  cis,4  d8 e8 ~ | 
  e4.  gis8  b,4  cis4 |
  f2  des4  f8  e8 ~ | 
  e4. r8  des4  es4 |
  e2 r8  e8 r8  e8 ~ | 
  e4 r8  a8  g4 -.  fis4 ~ |
  fis4.  fis8  e4  d8  c8 ~ |
  c2. r8  e8 ~ |
  e2  cis4.  c8 ~ | 
  c2.  c8  cis8 ~ |
  cis2..  d8 ~ | 
  d2. r8  e8 ~ |
  e4.  gis8  e4  cis8 a8 ~ | 
  a4.  c8  e4  c8  b8 ~ |
  b1 ~ |
  b1 ~ |
  b1 ~ |
  b1 ~ | 
  b1 ~ |
  b2 r2 | 
  R1*2
  r4.  as8  es'8  f8  ges8  as8 ~ -> |
  as8  f4 ->  des8 ~ ->  des8 f4 ->  es8 ~ |
  es8  ces8  es4  ces2 ~ | 
  ces1 ~ | 
  ces1 ~ |
  ces1 |
  R1*2 
}

CodaAlto = \relative c'' {
  \key c \major
  r8  as'8  bes8  f'8 r8  as,8 bes8 \once \override NoteHead #'style = #'cross  as8
  \repeat volta 2 {
    bes4 r4 r2 |
    r8  as8  bes8  f'8 r8  as,8 bes8 \once \override NoteHead #'style = #'cross as8 |
  }
  bes4 r4 r2 |
  r8  as8  bes8  as8 r8  f8 fes8  es8 | 
  d1 \fermata 
}

tenor =  \relative c'' {
  \compressEmptyMeasures
  \override MultiMeasureRest #'expand-limit = #2
  \key c \major
  \time 4/4 | % 1
  \inlineMMRN R1*16 
  r4.  a8  dis8  e8  g8 e8 ~ -> | 
  e8  c4 ->  a8 ~ ->  a8 d4 ->  b8 ~ |
  b8  g8  e4  d2 ~ |
  d2. r4 | 
  \times 2/3  { r4  b'4  c4 } \times 2/3  { d4  c4  b4 } |
  c4.  a8 ~  a4  b4 ~ | 
  b8  g8  a4  f2 ~ |
  f2. r4 | 
  r4.  a8  dis8  e8  g8 e8 ~ |
  e8  c4  a8 ~  a8  d4 b8 ~ | 
  b8  g8  f2. ~ | 
  f2.  d'4 ~ | 
  d2 \glissando  d,4-. r | 
  R1*3 
  r4.  as'8  es'8  f8  ges8 as8 ~ | 
  as8  f4  des8 ~  des8 f4  es8 ~ |
  es8  c8  as4  bes2 ~ |
  bes2. r4 | 
  \times 2/3  { r4  c4  des4 } \times 2/3  { es4  des4  c4 } |
  des4.  bes8 ~  bes4  c4 ~ |
  \times 2/3  { c4  as4  bes4 ~ } bes8  ges4. ~ | 
  ges2. r4 |
  \times 2/3  { r4  b4  c4 } \times 2/3  { d4  c4  b4 } |
  c4.  c8 ~  c4  d4 ~ |
  d8  b8  g8  b8  a2 ~ |
  a1 ~ |
  a1 ~ | 
  a2 r2 | 
  R1*2 
  b4 r4 r8  b8 r8  bes8 |
  r2 r8  bes8 r8  bes8 |
  r8  a4 r8 r8  a8 r8  gis8 |
  r2 r8  gis8 r8  gis8 |
  r8  b4 r8 r8  b8 r8  bes8 | 
  r2 r8  bes8 r8  bes8 | 
  r8  a4 r8 r8  a8 r8  gis8 |
  r2 r8  gis8 r4 |
  cis2  a4  d8  cis8 ~ |
  cis4. r8 r2 |
  b4.  e8  gis,4  a8 b8 ~ | 
  b4.  e8  fis,4  gis4 |
  bes2  bes4  des8  c8 ~ |
  c4. r8  a4  c4 | 
  b2 r8  c8 r8  bes8 ~ |
  bes4 r8  es8  e4 -.  d4 ~ | 
  d2. r8  d8 ~ | 
  d2. r8  cis8 ~ | 
  cis2  b4.  e8 ~ | 
  e4.  e,8  gis4  fis8  g8~ | 
  g2..  gis8 ~ | 
  gis2. r8  b8 ~ |
  b4.  cis8  b4  gis8 
  e8 ~ |
  e4.  fis8  b4  fis8  f8 ~ |
  f2.  ges4 ~ | % 74
  ges1 |
  as1 ~ |
  as1 ~ |
  as1 ~ |
  as2 r2 |
  R1*2 
  r4.  as8  es'8  f8  ges8 as8 ~ -> |
  as8  f4 ->  des8 ~ ->  des8 f4 ->  es8 ~ | 
  es8  ces8  des4  ges,2 ~ | 
  ges1 | 
  f1 ~ | 
  f1 | 
  R1*2
}

CodaTenor = \relative c'' {
  \key c \major
  r8  as8  bes8  f'8 r8  as,8
  bes8 \once \override NoteHead #'style = #'cross 
  as8 \repeat volta 2 {
    ces4 r4 r2 | 
    r8  as8  bes8  f'8 r8  as,8 bes8 \once \override NoteHead #'style = #'cross as8 |
  }
  ces4 r4 r2 | 
  r8  as8  bes8  a8 r8  as8 bes8  as8 | 
  a1 \fermata
}

baryton =  \relative c'' {
  \compressEmptyMeasures
  \override MultiMeasureRest #'expand-limit = #2
  \key c \major  \time 4/4 
  \inlineMMRN R1*16
  R1*3 | 
  r2 r8  e,8  d8  a8 | 
  g2 ~ \times 2/3 { g2  c4 } | 
  d4.  f,8 ~  f4  g4 ~ | 
  g2  d'2 ~ | 
  d2. r4 | 
  r4.  a'8  dis8  e8  g8 e8 ~ |
  e8  c4  a8 ~  a8 d4  b8 ~ | 
  b8  g8  d2. ~ | 
  d2.  g4 ~ | 
  g2 \glissando  g,4-. r | 
  R1*3
  r4.  es'8  bes'8  c8  des8 es8 ~ |
  es8  des4  bes8 ~  bes8 des4  c8 ~ |
  c8  as8  f4  es2 ~ |
  es2. r8  es,8 | 
  as2 ~ \times 2/3 { as2  des4 } |
  es4.  ges8 ~  ges4  f4 ~ |
  \times 2/3  { f4  des4  es4 ~ } es8  es4. ~ | 
  es2. r4 | 
  g,1 |
  d'4.  f8 ~  f4  g4 ~ |
  g8  e8  d8  e8  d2 ~ |
  d1 ~ |
  d1 ~ |
  d2 r2 |
  R1*2 
  gis4 r4 r8  gis8 r8  gis8 |
  r2 r8  gis8 r8  gis8 | 
  r8  fis4 r8 r8  fis8 r8  fis8 |
  r2 r8  fis8 r8  fis8 | 
  r8  gis4 r8 r8  gis8 r8  gis8 | 
  r2 r8  gis8 r8  gis8 |
  r8  fis4 r8 r8  fis8 r8  fis8 |
  r2 r8  fis8 r4 | 
  a2 r4.  as8 ~ | 
  as4. r8 r2 | 
  as4.  b8  as4  a8 fis8 ~ | 
  fis4. r8 r2 | 
  ges2 r4.  ges8 ~ |
  ges4. r8 r2 |
  des2 r8  des8 r8  ges,8 ~ |
  ges4 r4 r4  b4 ~ | 
  b2. r8  bes8 ~ | 
  bes2. r8  a8 ~ |
  a2. r8  d,8 ~ | 
  d2.  d8  es8 ~ | 
  es2..  e8 ~ | 
  e2. r8  a8 ~ |
  a2. r8  d,8 ~ |
  d4.  a'8  d4  d,8  des8 ~ |
  des2.  as'4 ~ |
  as1 |
  des2.  es4 ~ |
  es1 ~ |
  es1 ~ |
  es2 r2 |
  R1*2 
  r4.  as8  es'8  f8  ges8 
  as8 ~ -> | % 82
  as8  f4 ->  des8 ~ ->  des8
  f4 ->  es8 ~ |
  es8  ces8  ges4  as2 ~ |
  as1 ~ | 
  as1 ~ |
  as1 | 
  R1*2 
}

CodaBaryton = \relative c'' {
  \key c \major
  r8  as8  bes8  f'8 r8  as,8 bes8 r8 
  \repeat volta 2 {
    des,4 r4 r2 | 
    r8  as'8  bes8  f'8 r8  as,8 bes8 r8 |
  }
  des,4 r4 r2 |
  r8  des8  c8  b8 r8  bes8  a8
  as8 |
  g1 \fermata
}

trpI =  \relative c'' {
  \compressEmptyMeasures
  \override MultiMeasureRest #'expand-limit = #2
  \clef "treble" \key c \major
  \time 4/4
  \inlineMMRN R1*16 
  r4.  a8  dis8  e8  g8 e8 ~ -> | 
  e8  c4 ->  a8 ~ ->  a8 d4 ->  b8 ~ | 
  b8  g8  e4  d2 ~ |
  d2. r4 | 
  \times 2/3  { r4  g4  a4 } \times 2/3  { b4  a4  g4 } |
  a4.  f8 ~  f4  g4 ~ | 
  g8  e8  f4  d2 ~ | 
  d2. r4 | 
  r4.  a'8  dis8  e8  g8 e8 ~ |
  e8  c4  a8 ~  a8  d4  b8 ~ |
  b8  g8  a2. ~ | 
  a2.  e'4 ~ |
  e2  \glissando  e,4-. r | 
  R1*3
  r4.  as8  es'8  f8  ges8 as8 ~ |
  as8  f4  des8 ~  des8 f4  es8 ~ |
  es8  c8  as4  bes2 ~ |
  bes2. r4 | 
  \times 2/3  { r4  c4  des4 } \times 2/3 { es4  des4  c4 } |
  des4.  bes8 ~  bes4  c4 ~ | 
  \times 2/3  {c4  as4  bes4 ~ } bes8  ges4. ~ | 
  ges2. r4 |
  \times 2/3  { r4  g4  a4 } \times 2/3 { b4  a4  g4 } | 
  a4.  f8 ~  f4  d'4 ~ | 
  d8  b8  g8  b8  a2 ~ | 
  a1 ~ |
  a1 ~ |
  a2 r2 |
  R1*2
  \repeat unfold 4 {
    gis4 r8  cis8  e,4  fis8 gis8 | 
    r4.  cis8  e,4  fis4 | 
  }
  \repeat unfold 3 {
    gis4.  cis8  e,4  fis8  gis8 ~ |
    gis4.  cis8  e,4  fis4 | 
  }
  gis4.  cis8  e,4  fis8  gis8 ~ | 
  gis4 r8  cis8  d4 -.  cis4 ~ -> | 
  cis4.  b8  gis4  fis8  e8 ~ | 
  e4.  gis8  b4  e,8  fis8 ~ | 
  fis4.  b8  gis4  e8  fis8 ~ | 
  fis4.  gis8  b4  e,8  fis8 ~ | 
  fis4.  b8  gis4  e8  fis8 ~ | 
  fis4.  gis8  b4  e,8  fis8 ~ | 
  fis4.  b8  gis4  e8  c8 ~ |
  c4.  e8  gis4  e8  es8 ~ 
  es1 ~ |
  es1 ~ |
  es1 ~ |
  es1 ~ |
  es1 ~ |
  es2 r2 |
  R1 R1
  r4.  as8  es'8  f8  ges8 as8 ~ -> |
  as8  f4 ->  des8 ~ ->  des8 f4 ->  es8 ~ |
  es8  ces8  as4  es'2 ~ |
  es1 ~ |
  es1 ~ |
  es1 |
  R1*2 
}

CodaTrpI = \relative c'' {
  \key c \major
  r8  as8  bes8  f'8 r8  as,8
  bes8 r8 \repeat volta 2 {
    des4 r4 r2 | 
    r8  as8  bes8  f'8 r8  as,8 bes8 r8 |
  }
  des4 r4 r2 | 
  r8  as8  bes8  f'8 r8  as,8 bes8  as8 |
  des1 \fermata
}

trpII =  \relative c'' {
  \compressEmptyMeasures
  \override MultiMeasureRest #'expand-limit = #2
  \key c \major
  \time 4/4
  \inlineMMRN R1*16 
  r4.  a8  dis8  e8  g8 e8 ~ -> |
  e8  c4 ->  a8 ~ ->  a8 d4 ->  b8 ~ |
  b8  g8  e4  d2 ~ |
  d2. r4 | 
  \times 2/3  { r4  g4  a4 }  \times 2/3  { b4  a4  g4 } | 
  a4.  d,8 ~  d4  e4 ~ |
  e8  c8  d4  b2 |
  c2. r4 |
  r4.  a'8  dis8  e8  g8 e8 ~ |
  e8  c4  a8 ~  a8  d4 b8 ~ | 
  b8  g8  e2. ~ |
  e2.  b'4 ~ |
  b2 \glissando  b,4-. r | 
  R1*3
  r4.  f'8  bes  c  des  f ~ | 
  f  des4  bes8 ~  bes  des4  c8 ~ |
  c8  as8  es4  f2 ~ |
  f2. r4 | % 37
  \times 2/3  { r4  as4  bes4 } \times 2/3  { c4  bes4  as4 } |
  bes4.  ges8 ~  ges4  as4 ~ |
  \times 2/3  { as4  f4  ges4 ~ } ges8  es4. ~ | 
  es2. r4 |
  \times 2/3  { r4  g4  a4 } \times 2/3  { b4  a4  g4 } |
  a4.  d,8 ~  d4  a'4 ~ |
  a8  g8  d8  g8  f2 ~ | 
  f1 ~ | 
  f1 ~ | 
  f2 r2 | 
  R1*2 
  \repeat unfold 4 {
    gis4 r8  cis8  e,4  fis8 gis8 | 
    r4.  cis8  e,4  fis4 | 
  }
  \repeat unfold 3 {
    gis4.  cis8  e,4  fis8  gis8 ~ |
    gis4.  cis8  e,4  fis4 |
  }
  gis4.  cis8  e,4  fis8  gis8 ~ |
  gis4 r8  cis8  d4 -.  cis4 ~ -> |
  cis4.  b8  gis4  fis8  e8 ~ |
  e4.  gis8  b4  e,8  fis8 ~ |
  fis4.  b8  gis4  e8  fis8 ~ |
  fis4.  gis8  b4  e,8  fis8 ~ |
  fis4.  b8  gis4  e8  fis8 ~ | 
  fis4.  gis8  b4  e,8  fis8 ~ |
  fis4.  b8  gis4  e8  c8 ~ | 
  c4.  e8  gis4  e8  es8 ~ |
  es1 ~ |
  es1 ~ |
  es1 ~ |
  es1 ~ |
  es1 ~ |
  es2 r2 |
  R1*2 
  r4.  as8  es'8  f8  ges8 as8 ~ -> | 
  as8  f4 ->  des8 ~ ->  des8 f4 ->  es8 ~ |
  es8  ces8  ges4  ces2 ~ |
  ces1 ~ | 
  ces1 ~ | 
  ces1 |
  R1*2 
}
CodaTrpII = \relative c'' {
  \key c \major
  r8  as8  bes8  f'8 r8  as,8 bes8 r8 |
  \repeat volta 2 {
    des4 r4 r2 | 
    r8  as8  bes8  f'8 r8  as,8 bes8 r8 | 
  }
  des4 r4 r2 |
  r8  as8  bes8  des8 r8  as8 bes8  as8 |
  a!1 \fermata
}

trombone =  \relative a {
  \compressEmptyMeasures
  \override MultiMeasureRest #'expand-limit = #2
  \key c \major \time 4/4 
  \inlineMMRN R1*16 
  r4.  a8  dis8  e8  g8 e8 ~ -> | 
  e8  c4 ->  a8 ~ ->  a8 d4 ->  b8 ~ | 
  b8  g8  e4  d2 ~ |
  d2. r4 | 
  \times 2/3  { r4  f4  g4 } \times 2/3  { a4  g4  f4 } |
  g4.  d8 ~  d4  f4 ~ | 
  f8  c8  d4  d'2 ~ | 
  d2. r4 |
  r4.  a8  dis8  e8  g8 e8 ~ | 
  e8  c4  a8 ~  a8  d4 b8 ~ |
  b8  g8  a2. ~ |
  a2.  f'4 ~ |
  f2 \glissando  f,4-. r | 
  R1*3
  r4.  as8  es'8  f8  g8 as8 ~ | 
  as8  f4  des8 ~  des8 f4  f8 ~ | 
  f8  es8  c4  ges2 ~ |
  ges2. r4 |
  \times 2/3  { r4  ges4  as4 } \times 2/3  { bes4  as4  ges4 } |
  as4.  des8 ~  des4  as4 ~ |
  \times 2/3  { as4  f4  ges4 ~ } ges8  ges4. ( | 
  des'2. ) r4 | 
  \times 2/3  { r4  f,4  g4 } \times 2/3  { a4  g4  f4 } |
  g4.  a8 ~  a4  b4 ~ | 
  b8  a8  f8  a8  c2 ~ | 
  c1 |
  b1 ~ |
  b2 r2 |
  R1*2 
  dis4 r4 r8  dis8 r8  dis8 |
  r2 r8  dis8 r8  dis8 |
  r8  cis4 r8 r8  cis8 r8  cis8 |
  r2 r8  cis8 r8  cis8 |
  r8  dis4 r8 r8  dis8 r8  dis8 | 
  r2 r8  dis8 r8  dis8 |
  r8  cis4 r8 r8  cis8 r8  cis8 | 
  r2 r8  cis8 r4 |
  d2  fis,4  a8  d8 ~ | 
  d4. r8  gis,4  b4 |
  cis2  fis,4  a8  d8 ~ |
  d4. r8  gis,4  b4 | 
  des2  fis,4  a8  des8 ~ | 
  des4. r8  gis,4  b4 | 
  dis2 r8  dis8 r8  dis8 ~ | 
  dis4 r8  b8  bes4 -.  a4 ~ | 
  a2.  a8  gis8 ~ | 
  gis2. r8  b8 ~ |
  b4.  gis8  e4  gis8  b8 ~ |
  b2  e4  a,8  b8 ~ | 
  b2..  cis8 ~ | 
  cis2. r8  cis8 ~ | 
  cis4.  e8  cis4  b8 fis8 ~ |
  fis4.  b8  c4  a8  bes8 ~ |
  bes1 ~ | 
  bes1 ~ | 
  bes1 ~ | 
  bes1 ~ | 
  bes1 ~ | 
  bes2 r2 |
  R1*2
  r4.  as8  es'8  f8  ges8 as8 ~ -> |
  as8  f4 ->  des8 ~ ->  des8
  f4 ->  es8 ~ | 
  es8  ces8  as4  es'2 ~ |
  es1 ~ |
  es1 ~ |
  es1 |
  R1*2 
}

CodaTombone = \relative c'' {
  \key c \major 
  r8  as,8  bes8  f'8 r8  as,8 bes8 \once \override NoteHead #'style = #'cross as8 
  \repeat volta 2 {
    ces4 r4 r2 |
    r8  as8  bes8  f'8 r8  as,8 bes8 \once \override NoteHead #'style = #'cross as8 |
  }
  f'4 r4 r2 | 
  r8  f8  e8  es8 r8  as,8 g8  ges8 | 
  d1 \fermata 
}


%%%%%%%%%% Conducteur - A4 %%%%%%%%%%%


\book {
  \paper {
    #(set-paper-size "a4")
    first-page-number =#0
    print-page-number = ##t
  }
  #(define output-suffix "Da4")
  \bookpart {
    \paper {
      print-first-page-number = ##f
    }   
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "Santa Cruz" }
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
          \line  {  \hspace #15 Piano \fontsize #-2 "(or Guitare)" }
          \vspace #0.3
          \line  {  \hspace #15  Bass }
        }
        \vspace #3
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  } 
  \bookpart {
    \paper { 
      %page-count = #12  
      oddFooterMarkup = \markup \small { \fill-line { \line { "Santa Cruz (Barry Olsen) - Full Score" } } }
    }
    \score {
      <<
        \new StaffGroup << 
          \new Staff \with { instrumentName = \markup { \center-column { "Horn 1" \line { "(A.Sax)" } } } 
                             shortInstrumentName = "A.Sx" midiInstrument = "alto sax" } 
          << \new Voice = "Mel" { \transpose c a, \alto }
             \new Voice = "ctrl" { \ossatureDir } >> 
          \new Staff \with { instrumentName = \markup { \center-column { "Horn 2" \line { "(T.Sax)" } } } 
                             shortInstrumentName = "T.Sx" midiInstrument = "tenor sax"} 
          << \new Voice = "Mel" { \transpose c d \tenor } >> 
          \new Staff \with { instrumentName = \markup { \center-column { "Horn 3" \line { "(B.Sax)" } } } 
                             shortInstrumentName = "B.Sx" midiInstrument = "baritone sax"} 
          << \new Voice = "Mel" { \transpose c a \baryton } >>   
        >>     
        \new StaffGroup << 
          \new Staff \with { instrumentName = \markup { \center-column { "Horn 4" \line { "(Tpt.1)" } } } 
                             shortInstrumentName = "Tpt.1" midiInstrument = "trumpet"} 
          << \new Voice = "Mel" { \transpose c d \trpI } >> 
          \new Staff \with { instrumentName = \markup { \center-column { "Horn 5" \line { "(Tpt.2)" } } }  
                             shortInstrumentName = "Tpt.  2"  midiInstrument = "trumpet"} 
          << \new Voice = "Mel" { \transpose c d \trpII } >> 
          \new Staff \with { instrumentName = \markup { \center-column { "Horn 6" \line { "(Tbn.)" } } }  
                             shortInstrumentName = "Tbn."  midiInstrument = "trombone"} 
          << \new Voice = "Mel" { \clef "bass" \trombone } >>   
        >>     
        \new StaffGroup << 
          \new Staff \with { instrumentName = \markup { \center-column { "Piano" \line { "or Guit." } } } 
                             shortInstrumentName = "Pno" midiInstrument = "grand piano"} 
          << \new Voice = "Mel" { \GuitareDir } >> 
          \new ChordNames \with { \override VerticalAxisGroup.staff-affinity = #CENTER }
          { \harmoniesDir }
          \new Staff \with { instrumentName = "Bass" 
                             shortInstrumentName = "Bass" midiInstrument = "fretless bass"} 
          << \new Voice = "Mel" { \BasseDir } >> 
        >>
      >>
      \layout {
        \context { 
          \Score
          \revert KeySignature #'break-visibility
          \revert Clef #'break-visibility
        } 
      }
    } 
    \score {
      <<       
        \new StaffGroup << 
          \new Staff \with { instrumentName = "A.Sx" shortInstrumentName = "A.Sx" } 
          << \new Voice = "Mel" { \transpose c a, \CodaAlto }
             \new Voice = "ctrl" { \ossatureDirCoda } >> 
          \new Staff \with { instrumentName = "T.Sx" shortInstrumentName = "T.Sx" } 
          << \new Voice = "Mel" { \transpose c d \CodaTenor } >> 
          \new Staff \with { instrumentName = "B.Sx" shortInstrumentName = "B.Sx" } 
          << \new Voice = "Mel" { \transpose c a \CodaBaryton } >>   
        >>            
        \new StaffGroup << 
          \new Staff \with { instrumentName = "Tpt1" shortInstrumentName = "Tpt.1" } 
          << \new Voice = "Mel" { \transpose c d \CodaTrpI } >> 
          \new Staff \with { instrumentName = "Tpt2" shortInstrumentName = "Tpt.2" } 
          << \new Voice = "Mel" { \transpose c d \CodaTrpII } >> 
          \new Staff \with { instrumentName = "Tbn." shortInstrumentName = "Tbn." } 
          << \new Voice = "Mel" { \CodaTombone } >>   
        >>     
        \new StaffGroup << 
          \new Staff \with { instrumentName = "Pno" shortInstrumentName = "Pno" } 
          << \new Voice = "Mel" { \CodaGuitareDir }>> 
          \new ChordNames \with { \override VerticalAxisGroup.staff-affinity = #CENTER }
          { \harmoniesDirCoda }
          \new Staff \with { instrumentName = "Bass" shortInstrumentName = "Bass" } 
          << \new Voice = "Mel" { \CodaBasseDir } >> 
        >>
      >>
      \layout { indent = 0 }
    }
    \score {
      <<
        \new ChordNames { \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusIIDir
      >>
      \layout { indent = 0 }
    }
  }
}



%%%%%%%%%% C - A4 %%%%%%%%%%%


\book {
  \paper {
    #(set-paper-size "a4")
    first-page-number =#0
    print-page-number = ##t
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \paper {
      print-first-page-number = ##f
    }   
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "Santa Cruz" }
        \fill-line { "Music for Little Big Band" }
        \vspace #2
        \fill-line \fontsize #8 { \circle \bold \concat {C \raise #-1 K} }
        \vspace #1
        \fontsize #4 \fill-line { "C version" } 
         \vspace #2      
        \fontsize #4 {
           \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(Alto Sax)" } }
          \vspace #0.3
          \page-link #4 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Tenor Sax)" } }
          \vspace #0.3
          \page-link #6 \line  {  \hspace #10 \underline { Horn III \fontsize #-2 "(Baryton Sax)" } }
          \vspace #0.3
          \page-link #8 \line  {  \hspace #10 \underline { Horn IV \fontsize #-2 "(Trumpet 1)" } }
          \vspace #0.3
          \page-link #10 \line  {  \hspace #10 \underline { Horn V \fontsize #-2 "(Trumpet 2)" } }
          \vspace #0.3
          \page-link #12 \line  {  \hspace #10 \underline { Horn VI \fontsize #-2 "(Trombone)" } }
          \vspace #0.3
          \page-link #14 \line  {  \hspace #10 \underline { Piano \fontsize #-2 "(or Guitare)" } }
          \vspace #0.3
          \page-link #16 \line  {  \hspace #10 \underline { Bass } }
        }
        \vspace #3
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  } 

  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { "Santa Cruz (Barry Olsen) - C version - Horn 1" } } }
    }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 1" \line { "(A.Sax)" } } } }
        <<
          \new Voice = "Mel" { \clef "treble_8" \transpose c c, \alto }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \clef "treble_8" \transpose c c, \CodaAlto }
          \new Voice = "ctrl" { \ossatureCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { "Santa Cruz (Barry Olsen) - C version - Horn 2" } } }
    }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 2" \line { "(T.Sax)" } } } }
        <<
          \new Voice = "Mel" { \clef "treble_8" \transpose c c, \tenor }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \clef "treble_8" \transpose c c, \CodaTenor }
          \new Voice = "ctrl" { \ossatureCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { "Santa Cruz (Barry Olsen) - C version - Horn 3" } } }
    }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 3" \line { "(B.Sax)" } } } }
        <<
          \new Voice = "Mel" { \clef "bass" \transpose c c, \baryton }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \clef "bass" \transpose c c, \CodaBaryton }
          \new Voice = "ctrl" { \ossatureCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { "Santa Cruz (Barry Olsen) - C version - Horn 4" } } }
    }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 4" \line { "(Tpt.1)" } } } }
        <<
          \new Voice = "Mel" { \trpI }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \CodaTrpI }
          \new Voice = "ctrl" { \ossatureCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { "Santa Cruz (Barry Olsen) - C version - Horn 5" } } }
    }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 5" \line { "(Tpt.2)" } } } }
        <<
          \new Voice = "Mel" { \trpII }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \CodaTrpII }
          \new Voice = "ctrl" { \ossatureCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { "Santa Cruz (Barry Olsen) - C version - Horn 6" } } }
    }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 6" \line { "(Tromb.)" } } } }
        <<
          \new Voice = "Mel" { \clef "bass" \trombone }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \clef "bass" \CodaTombone }
          \new Voice = "ctrl" { \ossatureCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { "Santa Cruz (Barry Olsen) - C version - Piano or Guitare" } } }
    }
    \score {
      <<
        \new Staff \with { instrumentName = \markup { \center-column { "Piano" \line { "or Guit." } } } }
        <<
          \new Voice = "Mel" { \Guitare }
          \new Voice = "ctrl" { s1*38 \pageBreak }
        >> 
        \new ChordNames { \harmoniesP }
        \new TabStaff \transpose c c, \Guitare
      >>
    } 
    \score {
      <<
        \new Staff <<
          \new Voice = "Mel" { \CodaGuitareDir }
          \new Voice = "ctrl" { \ossatureCoda }
        >>  
        \new ChordNames { \harmoniesCoda }
        \new TabStaff \transpose c c, \CodaGuitareDir
      >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { "Santa Cruz (Barry Olsen) - C version - Bass" } } }
    }
    \score {
      <<
        \new ChordNames { \harmoniesB }
        \new Staff \with { instrumentName = "Bass" }
        <<
          \new Voice = "Mel" { \clef "bass" \Basse }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \clef "bass" \CodaBasse }
          \new Voice = "ctrl" { \ossatureCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
} 





% %------------Bb A4 ---------------


\book {
  \paper {
    #(set-paper-size "a4")
    first-page-number =#0
    print-page-number = ##t
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \paper {
      print-first-page-number = ##f
    }   
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "Santa Cruz" }
        \fill-line { "Music for Little Big Band" }
        \vspace #2
        \fill-line \fontsize #6 { \circle \bold \concat {" " B  \flat " "} }
        \vspace #1
        \fill-line \fontsize #4 { \concat {B \small \flat " Version"} } 
        \vspace #2      
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(Alto Sax)" }  }
          \vspace #0.3
          \page-link #4 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Tenor Sax)" } }
          \vspace #0.3
          \page-link #6 \line  {  \hspace #10 \underline { Horn III \fontsize #-2 "(Baryton Sax)" }  } 
          \vspace #0.3
          \page-link #8 \line  {  \hspace #10 \underline { Horn IV \fontsize #-2 "(Trumpet I)" } }
          \vspace #0.3
          \page-link #10 \line  {  \hspace #10 \underline { Horn V \fontsize #-2 "(Trumpet II)" } }
          \vspace #0.3
          \page-link #12 \line  {  \hspace #10 \underline { Horn VI \fontsize #-2 "(Trombone)" }  }
          \vspace #0.3
          \page-link #14 \line  {  \hspace #10 \underline { Wind Bass } }
        }
        \vspace #3
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  } 

  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Santa Cruz (Barry Olsen) - B"\flat" version - Horn 1" } } } }
    }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 1" \line { "(A.Sax)" } } } }
        <<
          \new Voice = "Mel" { \transpose c d  \alto }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c d  \CodaAlto }
          \new Voice = "ctrl" { \ossatureCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c d \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Santa Cruz (Barry Olsen) - B"\flat" version - Horn 2" } } } }
    }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 2" \line { "(T.Sax)" } } } }
        <<
          \new Voice = "Mel" { \transpose c d \tenor }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c d \CodaTenor }
          \new Voice = "ctrl" { \ossatureCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c d \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Santa Cruz (Barry Olsen) - B"\flat" version - Horn 3" } } } }
    }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 3" \line { "(B.Sax)" } } } }
        <<
          \new Voice = "Mel" { \transpose c d \baryton }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c d \CodaBaryton }
          \new Voice = "ctrl" { \ossatureCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c d \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Santa Cruz (Barry Olsen) - B"\flat" version - Horn 4" } } } }
    }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 4" \line { "(Tpt.1)" } } } }
        <<
          \new Voice = "Mel" { \transpose c d \trpI }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c d \CodaTrpI }
          \new Voice = "ctrl" { \ossatureCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c d \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Santa Cruz (Barry Olsen) - B"\flat" version - Horn 5" } } } }
    }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 5" \line { "(Tpt.2)" } } } }
        <<
          \new Voice = "Mel" { \transpose c d \trpII }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c d \CodaTrpII }
          \new Voice = "ctrl" { \ossatureCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c d \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Santa Cruz (Barry Olsen) - B"\flat" version - Horn 6" } } } }
    }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 6" \line { "(Tromb.)" } } } }
        <<
          \new Voice = "Mel" { \transpose c d' \trombone }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c d' \CodaTombone }
          \new Voice = "ctrl" { \ossatureCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c d \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Santa Cruz (Barry Olsen) - B"\flat" version - Wind Bass" } } } }
    }
    \score {
      <<
        \new ChordNames { \transpose c d \harmoniesB }
        \new Staff \with { instrumentName = "Wind Bass" }
        <<
          \new Voice = "Mel" { \transpose c d'' \Basse }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c d'' \CodaBasse }
          \new Voice = "ctrl" { \ossatureCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c d \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
} 

% %------------Eb A4 ---------------
\book {
  \paper {
    #(set-paper-size "a4")
    first-page-number =#0
    print-page-number = ##t
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \paper {
      print-first-page-number = ##f
    }   
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "Santa Cruz" }
        \fill-line { "Music for Little Big Band" }
        \vspace #2
        \fill-line \fontsize #6 { \circle \bold \concat {" " E  \flat " "} }
        \vspace #1
        \fill-line \fontsize #4 { \concat {E \small \flat " Version"} } 
        \vspace #2      
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(Alto Sax)" } }
          \vspace #0.3
          \page-link #4 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Tenor Sax)" } }
          \vspace #0.3
          \page-link #6 \line  {  \hspace #10 \underline { Horn III \fontsize #-2 "(Baryton Sax)" } }
          \vspace #0.3
          \page-link #8 \line  {  \hspace #10 \underline { Horn IV \fontsize #-2 "(Trumpet I)" } }
          \vspace #0.3
          \page-link #10 \line  {  \hspace #10 \underline { Horn V \fontsize #-2 "(Trumpet II)" } }
          \vspace #0.3
          \page-link #12 \line  {  \hspace #10 \underline { Horn VI \fontsize #-2 "(Trombone)" } }
          \vspace #0.3
          \page-link #14 \line  {  \hspace #10 \underline { Wind Bass } }
        }
        \vspace #3
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  } 

  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Santa Cruz (Barry Olsen) - E"\flat" version - Horn 1" } } } }
    }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 1" \line { "(A.Sax)" } } } }
        <<
          \new Voice = "Mel" { \transpose c a,  \alto }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c a,  \CodaAlto }
          \new Voice = "ctrl" { \ossatureCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c a \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Santa Cruz (Barry Olsen) - E"\flat" version - Horn 2" } } } }
    }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 2" \line { "(T.Sax)" } } } }
        <<
          \new Voice = "Mel" { \transpose c a, \tenor }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c a, \CodaTenor }
          \new Voice = "ctrl" { \ossatureCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c a \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Santa Cruz (Barry Olsen) - E"\flat" version - Horn 3" } } } }
    }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 3" \line { "(B.Sax)" } } } }
        <<
          \new Voice = "Mel" { \transpose c a \baryton }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c a \CodaBaryton }
          \new Voice = "ctrl" { \ossatureCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c a \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Santa Cruz (Barry Olsen) - E"\flat" version - Horn 4" } } } }
    }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 4" \line { "(Tpt.1)" } } } }
        <<
          \new Voice = "Mel" { \transpose c a \trpI }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c a \CodaTrpI }
          \new Voice = "ctrl" { \ossatureCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c a \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Santa Cruz (Barry Olsen) - E"\flat" version - Horn 5" } } } }
    }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 5" \line { "(Tpt.2)" } } } }
        <<
          \new Voice = "Mel" { \transpose c a \trpII }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c a \CodaTrpII }
          \new Voice = "ctrl" { \ossatureCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c a \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Santa Cruz (Barry Olsen) - E"\flat" version - Horn 6" } } } }
    }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 6" \line { "(Tromb.)" } } } }
        <<
          \new Voice = "Mel" { \transpose c a \trombone }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c a \CodaTombone }
          \new Voice = "ctrl" { \ossatureCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c a \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \paper { 
      oddFooterMarkup = \markup \small { \fill-line { \line { \concat { "Santa Cruz (Barry Olsen) - E"\flat" version - Wind Bass" } } } }
    }
    \score {
      <<
        \new ChordNames { \transpose c a \harmoniesB }
        \new Staff \with { instrumentName = "Wind Bass" }
        <<
          \new Voice = "Mel" { \transpose c a' \Basse }
          \new Voice = "ctrl" { \ossature }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c a' \CodaBasse }
          \new Voice = "ctrl" { \ossatureCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c a \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
} 


%%%%%%%%%% C - A5 %%%%%%%%%%%


\book {
  \paper {
    #(set-paper-size "tablette")
    first-page-number =#0
    print-page-number = ##t
  }
  #(define output-suffix "CTab")
  \bookpart {
    \paper {
      print-first-page-number = ##f
    }   
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "Santa Cruz" }
        \fill-line { "Music for Little Big Band" }
        \vspace #2
        \fill-line \fontsize #8 { \circle \bold \concat {C \raise #-1 K} }
        \vspace #1
        \fontsize #4 \fill-line { "C version" } 
         \vspace #2      
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(Alto Sax)" } }
          \vspace #0.3
          \page-link #5 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Tenor Sax)" } }
          \vspace #0.3
          \page-link #8 \line  {  \hspace #10 \underline { Horn III \fontsize #-2 "(Baryton Sax)" } }
          \vspace #0.3
          \page-link #11 \line  {  \hspace #10 \underline { Horn IV \fontsize #-2 "(Trumpet 1)" } }
          \vspace #0.3
          \page-link #14 \line  {  \hspace #10 \underline { Horn V \fontsize #-2 "(Trumpet 2)" } }
          \vspace #0.3
          \page-link #17 \line  {  \hspace #10 \underline { Horn VI \fontsize #-2 "(Trombone)" } }
          \vspace #0.3
          \page-link #20 \line  {  \hspace #10 \underline { Piano \fontsize #-2 "(or Guitare)" } }
          \vspace #0.3
          \page-link #24 \line  {  \hspace #10 \underline { Bass } }
        }
        \vspace #3
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  } 


  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 1" \line { "(A.Sax)" } } } }
        <<
          \new Voice = "Mel" { \clef "treble_8" \transpose c c, \alto }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \clef "treble_8" \transpose c c, \CodaAlto }
          \new Voice = "ctrl" { \ossatureTabCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 2" \line { "(T.Sax)" } } } }
        <<
          \new Voice = "Mel" { \clef "treble_8" \transpose c c, \tenor }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \clef "treble_8" \transpose c c, \CodaTenor }
          \new Voice = "ctrl" { \ossatureTabCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 3" \line { "(B.Sax)" } } } }
        <<
          \new Voice = "Mel" { \clef "bass" \transpose c c, \baryton }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \clef "bass" \transpose c c, \CodaBaryton }
          \new Voice = "ctrl" { \ossatureTabCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 4" \line { "(Tpt.1)" } } } }
        <<
          \new Voice = "Mel" { \trpI }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \CodaTrpI }
          \new Voice = "ctrl" { \ossatureTabCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 5" \line { "(Tpt.2)" } } } }
        <<
          \new Voice = "Mel" { \trpII }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \CodaTrpII }
          \new Voice = "ctrl" { \ossatureTabCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 6" \line { "(Tromb.)" } } } }
        <<
          \new Voice = "Mel" { \clef "bass" \trombone }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \clef "bass" \CodaTombone }
          \new Voice = "ctrl" { \ossatureTabCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \new Staff \with { instrumentName = \markup { \center-column { "Piano" \line { "or Guit." } } } }
        <<
          \new Voice = "Mel" { \Guitare }
          \new Voice = "ctrl" { s1*10 \pageBreak s1*24 \pageBreak }
        >> 
        \new ChordNames { \harmoniesP }
        \new TabStaff \transpose c c, \Guitare
      >>
    } 
    \score {
      <<
        \new Staff <<
          \new Voice = "Mel" { \CodaGuitareDir }
          \new Voice = "ctrl" { \ossatureCoda }
        >>  
        \new ChordNames { \harmoniesCoda }
        \new TabStaff \transpose c c, \CodaGuitareDir
      >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \fontsize #2 { \pad-around #1 \bold \concat {C \raise #-1 K} } }
    \score {
      <<
        \new ChordNames { \harmoniesB }
        \new Staff \with { instrumentName = "Bass" }
        <<
          \new Voice = "Mel" { \clef "bass" \Basse }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \clef "bass" \CodaBasse }
          \new Voice = "ctrl" { \ossatureTabCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
} 

% %------------Bb A5 ---------------


\book {
  \paper {
    #(set-paper-size "tablette")
    first-page-number =#0
    print-page-number = ##t
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \paper {
      print-first-page-number = ##f
    }   
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "Santa Cruz" }
        \fill-line { "Music for Little Big Band" }
        \vspace #2
        \fill-line \fontsize #6 { \circle \bold \concat {" " B  \flat " "} }
        \vspace #1
        \fill-line \fontsize #4 { \concat {B \small \flat " Version"} } 
        \vspace #2      
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(Alto Sax)" } }
          \vspace #0.3
          \page-link #5 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Tenor Sax)" } }
          \vspace #0.3
          \page-link #8 \line  {  \hspace #10 \underline { Horn III \fontsize #-2 "(Baryton Sax)" } }
          \vspace #0.3
          \page-link #11 \line  {  \hspace #10 \underline { Horn IV \fontsize #-2 "(Trumpet I)" } }
          \vspace #0.3
          \page-link #14 \line  {  \hspace #10 \underline { Horn V \fontsize #-2 "(Trumpet II)" } }
          \vspace #0.3
          \page-link #17 \line  {  \hspace #10 \underline { Horn VI \fontsize #-2 "(Trombone)" } }
          \vspace #0.3
          \page-link #20 \line  {  \hspace #10 \underline { Wind Bass } }
        }
        \vspace #3
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  } 

  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 1" \line { "(A.Sax)" } } } }
        <<
          \new Voice = "Mel" { \transpose c d  \alto }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c d  \CodaAlto }
          \new Voice = "ctrl" { \ossatureTabCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c d \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 2" \line { "(T.Sax)" } } } }
        <<
          \new Voice = "Mel" { \transpose c d \tenor }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c d \CodaTenor }
          \new Voice = "ctrl" { \ossatureTabCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c d \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 3" \line { "(B.Sax)" } } } }
        <<
          \new Voice = "Mel" { \transpose c d \baryton }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c d \CodaBaryton }
          \new Voice = "ctrl" { \ossatureTabCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c d \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 4" \line { "(Tpt.1)" } } } }
        <<
          \new Voice = "Mel" { \transpose c d \trpI }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c d \CodaTrpI }
          \new Voice = "ctrl" { \ossatureTabCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c d \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 5" \line { "(Tpt.2)" } } } }
        <<
          \new Voice = "Mel" { \transpose c d \trpII }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c d \CodaTrpII }
          \new Voice = "ctrl" { \ossatureTabCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c d \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 6" \line { "(Tromb.)" } } } }
        <<
          \new Voice = "Mel" { \transpose c d' \trombone }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c d' \CodaTombone }
          \new Voice = "ctrl" { \ossatureTabCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c d \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " B  \flat " "} }
    \score {
      <<
        \new ChordNames { \transpose c d \harmoniesB }
        \new Staff \with { instrumentName = "Wind Bass" }
        <<
          \new Voice = "Mel" { \transpose c d'' \Basse }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c d'' \CodaBasse }
          \new Voice = "ctrl" { \ossatureTabCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c d \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c d \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
} 

% %------------Eb A5 ---------------
\book {
  \paper {
    #(set-paper-size "tablette")
    first-page-number =#0
    print-page-number = ##t
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \paper {
      print-first-page-number = ##f
    }   
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "Santa Cruz" }
        \fill-line { "Music for Little Big Band" }
        \vspace #2
        \fill-line \fontsize #6 { \circle \bold \concat {" " E  \flat " "} }
        \vspace #1
        \fill-line \fontsize #4 { \concat {E \small \flat " Version"} } 
        \vspace #2      
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(Alto Sax)" } }
          \vspace #0.3
          \page-link #5 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Tenor Sax)" } }
          \vspace #0.3
          \page-link #8 \line  {  \hspace #10 \underline { Horn III \fontsize #-2 "(Baryton Sax)" } }
          \vspace #0.3
          \page-link #11 \line  {  \hspace #10 \underline { Horn IV \fontsize #-2 "(Trumpet I)" } }
          \vspace #0.3
          \page-link #14 \line  {  \hspace #10 \underline { Horn V \fontsize #-2 "(Trumpet II)" } }
          \vspace #0.3
          \page-link #17 \line  {  \hspace #10 \underline { Horn VI \fontsize #-2 "(Trombonen)" } }
          \vspace #0.3
          \page-link #20 \line  {  \hspace #10 \underline { Wind Bass } }
        }
        \vspace #3
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  } 

  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 1" \line { "(A.Sax)" } } } }
        <<
          \new Voice = "Mel" { \transpose c a,  \alto }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c a,  \CodaAlto }
          \new Voice = "ctrl" { \ossatureTabCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c a \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 2" \line { "(T.Sax)" } } } }
        <<
          \new Voice = "Mel" { \transpose c a, \tenor }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c a, \CodaTenor }
          \new Voice = "ctrl" { \ossatureTabCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c a \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 3" \line { "(B.Sax)" } } } }
        <<
          \new Voice = "Mel" { \transpose c a \baryton }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c a \CodaBaryton }
          \new Voice = "ctrl" { \ossatureTabCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c a \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 4" \line { "(Tpt.1)" } } } }
        <<
          \new Voice = "Mel" { \transpose c a \trpI }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c a \CodaTrpI }
          \new Voice = "ctrl" { \ossatureTabCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c a \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 5" \line { "(Tpt.2)" } } } }
        <<
          \new Voice = "Mel" { \transpose c a \trpII }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c a \CodaTrpII }
          \new Voice = "ctrl" { \ossatureTabCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c a \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \markup { \center-column { "Horn 6" \line { "(Tromb.)" } } } }
        <<
          \new Voice = "Mel" { \transpose c a \trombone }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c a \CodaTombone }
          \new Voice = "ctrl" { \ossatureTabCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c a \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
  \bookpart {
    \header { meter = \markup \pad-around #4 \circle \bold \concat {" " E  \flat " "} }
    \score {
      <<
        \new ChordNames { \transpose c a \harmoniesB }
        \new Staff \with { instrumentName = "Wind Bass" }
        <<
          \new Voice = "Mel" { \transpose c a' \Basse }
          \new Voice = "ctrl" { \ossatureTab }
        >> 
      >>
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \harmoniesCoda }
        \new Staff <<
          \new Voice = "Mel" { \transpose c a' \CodaBasse }
          \new Voice = "ctrl" { \ossatureTabCoda }
      >>  >> 
      \layout { indent = 0 }
    }    
    \score {
      <<
        \new ChordNames { \transpose c a \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \transpose c a \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusII
      >>
      \layout { indent = 0 }
    }
  } 
} 


%%%%%%%%%% Conducteur - A4 %%%%%%%%%%%


\book {
  \paper {
    #(set-paper-size "tablette")
    first-page-number =#0
    print-page-number = ##t
  }
  #(define output-suffix "DTab")
  \bookpart {
    \paper {
      print-first-page-number = ##f
    }   
    \markup {
      \column {      
        \vspace #3
        \fill-line { \fontsize #9 "Santa Cruz" }
        \fill-line { "Music for Little Big Band" }
        \vspace #1
        \fontsize #4 {
          \fill-line { \circle \bold \concat {" " \musicglyph "clefs.G_change" " "} }
          \fill-line { "Conductor" } 
        }
        \vspace #2      
        \fontsize #4 {
         \page-link #2 \line  {  \hspace #10 \underline { Full Score \fontsize #-2 "(conductor)"} }
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
          \line  {  \hspace #15 Piano \fontsize #-2 "(or Guitare)" }
          \vspace #0.3
          \line  {  \hspace #15  Bass }
        }
        \vspace #1
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  } 
  \bookpart {
    \score {
      <<
        \new StaffGroup << 
          \new Staff \with { instrumentName = \markup { \center-column { "Horn 1" \line { "(A.Sax)" } } } 
                             shortInstrumentName = "A.Sx" midiInstrument = "alto sax" } 
          << \new Voice = "Mel" { \transpose c a, \alto }
             \new Voice = "ctrl" { \ossatureDirTab } >> 
          \new Staff \with { instrumentName = \markup { \center-column { "Horn 2" \line { "(T.Sax)" } } } 
                             shortInstrumentName = "T.Sx" midiInstrument = "tenor sax"} 
          << \new Voice = "Mel" { \transpose c d \tenor } >> 
          \new Staff \with { instrumentName = \markup { \center-column { "Horn 3" \line { "(B.Sax)" } } } 
                             shortInstrumentName = "B.Sx" midiInstrument = "baritone sax"} 
          << \new Voice = "Mel" { \transpose c a \baryton } >>   
        >>     
        \new StaffGroup << 
          \new Staff \with { instrumentName = \markup { \center-column { "Horn 4" \line { "(Tpt.1)" } } } 
                             shortInstrumentName = "Tpt.1" midiInstrument = "trumpet"} 
          << \new Voice = "Mel" { \transpose c d \trpI } >> 
          \new Staff \with { instrumentName = \markup { \center-column { "Horn 5" \line { "(Tpt.2)" } } }  
                             shortInstrumentName = "Tpt.  2"  midiInstrument = "trumpet"} 
          << \new Voice = "Mel" { \transpose c d \trpII } >> 
          \new Staff \with { instrumentName = \markup { \center-column { "Horn 6" \line { "(Tbn.)" } } }  
                             shortInstrumentName = "Tbn."  midiInstrument = "trombone"} 
          << \new Voice = "Mel" { \clef "bass" \trombone } >>   
        >>     
        \new StaffGroup << 
          \new Staff \with { instrumentName = \markup { \center-column { "Piano" \line { "or Guit." } } } 
                             shortInstrumentName = "Pno" midiInstrument = "grand piano"} 
          << \new Voice = "Mel" { \GuitareDir } >> 
          \new ChordNames \with { \override VerticalAxisGroup.staff-affinity = #CENTER }
          { \harmoniesDir }
          \new Staff \with { instrumentName = "Basse" 
                             shortInstrumentName = "Bass" midiInstrument = "fretless bass"} 
          << \new Voice = "Mel" { \BasseDir } >> 
        >>
      >>
      \layout {
        \context { 
          \Score
          \revert KeySignature #'break-visibility
          \revert Clef #'break-visibility
        } 
      }
    } 
    \score {
      <<       
        \new StaffGroup << 
          \new Staff \with { instrumentName = "A.Sx" shortInstrumentName = "A.Sx" } 
          << \new Voice = "Mel" { \transpose c a, \CodaAlto }
             \new Voice = "ctrl" { \ossatureDirCodaTab } >> 
          \new Staff \with { instrumentName = "T.Sx" shortInstrumentName = "T.Sx" } 
          << \new Voice = "Mel" { \transpose c d \CodaTenor } >> 
          \new Staff \with { instrumentName = "B.Sx" shortInstrumentName = "B.Sx" } 
          << \new Voice = "Mel" { \transpose c a \CodaBaryton } >>   
        >>            
        \new StaffGroup << 
          \new Staff \with { instrumentName = "Tpt1" shortInstrumentName = "Tpt.1" } 
          << \new Voice = "Mel" { \transpose c d \CodaTrpI } >> 
          \new Staff \with { instrumentName = "Tpt2" shortInstrumentName = "Tpt.2" } 
          << \new Voice = "Mel" { \transpose c d \CodaTrpII } >> 
          \new Staff \with { instrumentName = "Tbn." shortInstrumentName = "Tbn." } 
          << \new Voice = "Mel" { \CodaTombone } >>   
        >>     
        \new StaffGroup << 
          \new Staff \with { instrumentName = "Pno" shortInstrumentName = "Pno" } 
          << \new Voice = "Mel" { \CodaGuitareDir }>> 
          \new ChordNames \with { \override VerticalAxisGroup.staff-affinity = #CENTER }
          { \harmoniesDirCoda }
          \new Staff \with { instrumentName = "Bass" shortInstrumentName = "Bass" } 
          << \new Voice = "Mel" { \CodaBasseDir } >> 
        >>
      >>
      \layout { indent = 0 }
    }
    \score {
      <<
        \new ChordNames { \Grille } 
        \new Staff \with { instrumentName = "Solo 1" } \Chorus
      >>
      \layout { indent = 0 }
    } 
    \score {
      <<
        \new ChordNames { \GrilleII } 
        \new Staff \with { instrumentName = "Solo 2" } \ChorusIIDirTab
      >>
      \layout { indent = 0 }
  } }
} 
