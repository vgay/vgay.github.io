\version "2.22.1"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"


\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##t
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 15)
                            (minimum-distance . 15)
                            (padding . 2))
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
    }
  }
}

title = #"Song For A Twin"
composer = #"Enrique Simon"
meter = #"(Med. Straight)"
kwtempo = #"Medium"
kwstyle = #"World"

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
  asplayed = #"Filip Verneert · Enrique Simón Quartet" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=FkMJHhN9rr0"
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
    \override MultiMeasureRest #'expand-limit = #3
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
  c1..:m3.5.9 s b:dim7 s bes:9/as s a:m5-7 s
  es/g s f:7 s as1 es2./g f1:7 e2. es1..s
\repeat unfold 2 { a:m5-7 s es s  } bes b:dim7 c:m a:m5-7 fis:dim7 es1 as2. a1:m5-7 bes2.:7 es1..
}


theNotes =  \relative c'' {
  \clef "treble" \key es \major \time 7/4
  \showStartRepeatBar \bar "[|:"

  \repeat volta 2 {
    \oneVoice
    \mark #1  es4  d8
    g,8 ~  g2 ~  g2. ~ | % 12
    g1 r2. | % 13
    f'4  es8  as,8 ~  as2
    ~  as2. ~ | % 14
    as1 r2. | % 15
    c4  d8  bes8 ~  bes2 ~
    bes2. ~ | % 16
    bes1 r2. | % 17
    a4  c8  es,8 ~   es2 ~  es2.
    ~ | % 18
    es1 r2. | \break
    es1  f2. |
    g1  bes2. | % 21
    c1  es,2. ~ | % 22
    es1 r2 r4 | % 23
    bes'1  g2. | % 24
    es1  bes2. | % 25
    es1 ~  es2. | % 26
    R1..  }
  \break \mark #2
  f'4  g8  es8 ~  es2 ~  es2. ~ | % 28
  es1 r2. | % 29
  es1 ~  es2. ~ |
  es1 r2. | % 31
  g4  as8  bes8 ~  bes2 ~
  bes2. ~ | % 32
  bes1 r2. | % 33
  es,1 ~  es2. ~ | % 34
  es1 r2. | \break
  d1  f2. | % 36
  bes2  as2 ~  as4.  d4. | % 37
  es2  g,2 ~  g2. ~ | % 38
  g1 r2. | % 39
  f1  es2. |
  g2..  as8  g4  f8  es4
  c8 | % 41
  es2..  es8  c4  as8  g4
  bes8 | % 42
  es1 ~  es2. ~ \bar "||" \break
  \doubleMark
  \markup { \with-color #red \musicglyph "scripts.varcoda" }
  \markup { \with-color #red \musicglyph "scripts.varcoda" }

  es1 r2.
  \bar ".."
  \label #'theLastPage
}

chordsRhythm = \relative c'' {
  \clef "treble" \key es \major \time 7/4
  \set Staff.instrumentName = "Piano"

\repeat unfold 2 { g2   \autoBreaksOff g2  g4.  g4. }
\repeat volta 2 { \repeat unfold 4 { g2  g2  g4.  g4. } }

}

Basse = \relative c {
  \clef "bass" \key es \major \time 7/4
  \set Staff.instrumentName = "Bass"
R1.. R
   g4  c8  es8 ~  es2 ~  es2. |
   as,4  c8  f8 ~  f2 ~  f2. |
   a,4  c8  fis8 ~  fis2 ~ fis2. |
   as,4  c8  f8 ~  f2 ~  f2. |

  \bar ".."
}

guitar =  \relative c''' {
  \clef "treble" \key es \major \time 7/4
  \repeat volta 2 {
    g,2   g2  es'4  c8  d4. | % 12
     es4  d4  es2  es4.  g,4. | % 13
     f2  f2  d'4  g,8  f'4. | % 14
     d4  as4  d2  d4.  f4.  | % 15
     bes,2  bes2  c4  d8  f4. | % 16
     d4  bes4  d2  c4.
    d4. | % 17
     a2  es2  c'4  es8  f4.
    | % 18
     es4  c4  a2  es'4.
    c4. | % 19
     bes4  g8  bes4.  es,4
    bes'4  g8  bes4. |
     es,4  bes'4  g8  bes4.
    es,4.  bes'4  g8 | % 21
     c4  a8  c4.  f,4  c'4
     a8  c4. | % 22
     f,4  c'4  a8  c4.  f,4.
     c'4  a8 | % 23
     as2  <as c es>2  g4.  <g bes
    es>4. | % 24
     f2  <as c es>2  e4.  <gis b es>4.
    | % 25
     <es g bes>2  <es g bes>2  <es g bes>4.
     <es g bes>4. | % 26
     <es g bes>2  <es g bes>2  <es g bes>4.
     <es g bes>4.
  }

  <es c' g'>1  c''4.  es,4. | % 28
   bes2  a2  as4.  g4. | % 29
   <es g bes>2  <es g bes>2  <es g bes>4
   es'8  bes'4  c8 |
   <es,, g bes>2  <es g bes>2  <es g bes>4.
   <es g bes>4. | % 31
  <es c' g'>1  c''4.  es,4. | % 32
   ges2  f2  es4.  b4. | % 33
   <es, g bes>2  <es g bes>2  <es g bes>4.
   <es g bes>4. | % 34
   <es g bes>2  <es g bes>2  <es g bes>4.
  <es g bes>4. | % 35
   <f bes d>2  bes4  f4  <f bes d>2. | % 36
   <f b d>2  <f as d>2  <f as d>4.  <d f
  as>4. | % 37
   <c es g>2  <g' c es>2  es'4  c8
   g4  f8 | % 38
  <g c es>1  es'4  d8  es4  f8 | % 39
  <a, c f>1  <as c es>2. |
   <es g bes>2  <es g bes>2  <es as c>4.
  <es as c>4. | % 41
  <g c es>1  <f bes d>2. | % 42
   <es g bes>2  <es g bes>2  <es g bes>4.
  <es g bes>4. \bar "||"
  <es g bes>1 r2 r4  \bar ".."
  }

BasseLine = \relative c {
  \clef "bass" \key es \major \time 7/4
  \showStartRepeatBar \bar "[|:"
\repeat volta 2 {
    \mark #1 \oneVoice
    c'1 ~  c4.  g4. | % 12
    c,1 ~  c2. | % 13
    b1 ~  b4.  f'4. | % 14
    b,1 ~  b2. | % 15
    as'1 ~  as4.  f4. | % 16
    as1 ~  as2. | % 17
    a1  es4.  c'4. | % 18
    a1 ~  a2. | % 19
    g1  es2. |
    g1  es4  bes'8  es,4. | % 21
     f4.  a8  c2  c4.
    a4. | % 22
     f4.  a8  c2  c4.
    a4. | % 23
    as1  g2. | % 24
    f1  e2. | % 25
     es2  es2  es4.  es4. | % 26
     es2  es2  es4.  es4.
  }
\mark #2
  as,1  es'2. | % 28
   bes'2  a2  as4.  g4. | % 29
   es2  es2  es4.  es4. |
   es2  es2  es4.  es4. | % 31
  as,1  es'2. | % 32
   ges2  f2  es4.  b4. | % 33
   es2  es2  es4.  es4. | % 34
   es2  es2  es4.  es4. | % 35
  bes1  f'2. | % 36
   b2  a2 ~  a4.  f4. | % 37
  c'1  b4.  bes4. | % 38
  a1  as4.  g4. | % 39
  fis1  f4.  e4. |
  es1  bes4.  es4. | % 41
  a1  bes4.  f4. | % 42
   es2  es2  es4.  es4. \bar "||" \break
  \doubleMark
  \markup { \with-color #red \musicglyph "scripts.varcoda" }
  \markup { \with-color #red \musicglyph "scripts.varcoda" }
  es1 r2.
  \bar ".."   \label #'theLastPage

}

grille = \chordmode {
  \bar "[|:"

  \bar ".." }



\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    %print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes \\
          { s1.. \once \override Score.RehearsalMark.extra-offset = #'(-24 . 0.5 )
            \mark \markup "Intro Rhythm Section"
          }
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    %print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes \\
          { s1.. \once \override Score.RehearsalMark.extra-offset = #'(-24 . 0.5 )
            \mark \markup "Intro Rhythm Section"
          }
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    %print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a, \theNotes \\
          { s1.. \once \override Score.RehearsalMark.extra-offset = #'(-24 . 0.5 )
            \mark \markup "Intro Rhythm Section"
          }
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      \new StaffGroup <<
        \new Staff { \Intro \chordsRhythm }
        \new Staff \Basse
      >>
    }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes \\ { \repeat unfold 7 { s1..*4 \break } }
        >>
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      \new StaffGroup <<
        \new Staff { \Intro \chordsRhythm }
        \new Staff \Basse
      >>
    }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes \\ { \repeat unfold 7 { s1..*4 \break } }
        >>
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      \new StaffGroup <<
        \new Staff { \Intro \chordsRhythm }
        \new Staff \Basse
      >>
    }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a, \theNotes \\ { \repeat unfold 7 { s1..*4 \break } }
        >>
      >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    %page-count = #1
  }
  #(define output-suffix "BassTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleFa } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \BasseLine
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    ragged-last = ##t
  }
  #(define output-suffix "Bassa4")
  \bookpart {
    \score {
      \new StaffGroup <<
        \new Staff { \Intro \chordsRhythm }
        \new Staff \Basse
      >>
    }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleFa }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \BasseLine \\ { \repeat unfold 7 { s1..*4 \break } }
        >>
      >>
} } }


\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    ragged-last = ##t
    print-first-page-number = ##t
  }
  #(define output-suffix "RSa4")
  \bookpart {
    \score {
      \new StaffGroup <<
        \new Staff { \Intro \chordsRhythm }
        \new Staff \Basse
      >>
    }
    \score {
      <<
        \new ChordNames { \harmonies }
      \new StaffGroup <<
        \new Staff \guitar
        \new Staff
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \BasseLine \\ { \repeat unfold 7 { s1..*4 \break } }
      >> >>
      >>
} } }

