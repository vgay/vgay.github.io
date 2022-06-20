\version "2.22.1"
#(set-global-staff-size 17)
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
    }
  }
}

title = #"Double Up"
composer = #"Lee Morgan"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Blues"

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
  asplayed = #"Lee Morgan" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=uwTpfXI0Kmg"
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
  s2 f1:7 bes:7 f:7 c2:m7 f:7
  bes1:7 s1 f2:7 bes:7 es:7 d:7
  g1:m7 c:7 f2:7 d:7 g:m7 c:7
  s8 f1:7 bes:7 f:7 c2:m7 f:7
  bes1:7 s f2:7 bes:7 es:7 d:7
  g1:m7 c:7 f2:7 d:7 g:m7 c:7
  f1:7
}

harmoniesTab = \chordmode {
  \set chordChanges = ##f
  s2 f1:7 bes:7 f:7 c2:m7 f:7
  bes1:7 s1 f2:7 bes:7 es:7 d:7
  g1:m7 c:7 f2:7 d:7 g:m7 c:7
  s8 f1:7 bes:7 f:7 c2:m7 f:7
  bes1:7 s f2:7 bes:7 es:7 d:7
  g1:m7 c:7 f2:7 d:7 g:m7 c:7
  s1 f1:7
}


theNotes =  \relative c' {
  \clef "treble" \key bes \major \time 4/4
  \partial 2 \tuplet 3/2 { r8 c f } \tuplet 3/2 { a bes a }

  \mark \markup { \with-color #red \raise #1 \musicglyph "scripts.varsegno" \box Head }
  \repeat volta 2 {
    f1 r2 d16 f a c bes f d des | c f r4. r2 | r8 c16 es g bes g gis a f g e f d es f | \break
    d as r4. r2 | r2 g'16 as g as g e f g | a! c, r4. r2 | r es'16 d c bes a g fis a | \break
    g d r4. r2 | r4 b'16( c-.) c-. c-. b16( c-.) c-. c-. \tuplet 3/2 { b bes as } f es | f4-. r r2
    \tuplet 3/2 { r8 d f } \tuplet 3/2 { a bes b } \tuplet 3/2 { c bes a } \tuplet 3/2 { f es c }
  }
  \break \doubleMark
  \markup  { \with-color #red { "To Coda" \raise #1 \musicglyph "scripts.varcoda" } }
  \markup \box Solos
  \repeat volta 2 {
    \cadenzaOn \parenthesize f1*1/8 <c es f>16[ _\markup "Voicing behind last chorus of last soloist" q] r8 q4-- r2 \cadenzaOff \bar "|"  R1 |  <c es f>16 q r8 q4-- r2 | R1 |  \break
    <f as bes>16 q r8 q4-- r2 | R1 <c es f>16 q r8 q4-- r2 | R1 |  \break
    <g' bes c>16 q r8 q4-- r2 | <g bes c>16 q r8 q4-- r2 | <c, es f>16 q r8 q4-- r2 |
    r2 \tuplet 3/2 { r8 c f } \tuplet 3/2 { a bes a } } \break
  \doubleMark
  \markup {\with-color #red \bold "D.S. al Coda"}
  \markup { \with-color #red \musicglyph "scripts.varcoda" }
  f1 <c' es f>4-^ q2. \fermata \bar ".."
  \label #'theLastPage
}

theNotesTab =  \relative c' {
  \clef "treble" \key bes \major \time 4/4
  \partial 2 \tuplet 3/2 { r8 c f } \tuplet 3/2 { a bes a }

  \mark \markup { \with-color #red \raise #1 \musicglyph "scripts.varsegno" \box Head }
  \repeat volta 2 {
    f1 r2 d16 f a c bes f d des | c f r4. r2 | r8 c16 es g bes g gis a f g e f d es f | \break
    d as r4. r2 | r2 g'16 as g as g e f g | a! c, r4. r2 | r es'16 d c bes a g fis a | \break
    g d r4. r2 | r4 b'16( c-.) c-. c-. b16( c-.) c-. c-. \tuplet 3/2 { b bes as } f es | f4-. r r2
    \tuplet 3/2 { r8 d f } \tuplet 3/2 { a bes b } \tuplet 3/2 { c bes a } \tuplet 3/2 { f es c }
  }
  \break \doubleMark
  \markup  { \with-color #red { "To Coda" \raise #1 \musicglyph "scripts.varcoda" } }
  \markup \box Solos
  \repeat volta 2 {
    \cadenzaOn \parenthesize f1*1/8 <c es f>16[ _\markup "Voicing behind last chorus of last soloist" q] r8 q4-- r2 \cadenzaOff \bar "|"  R1 |  <c es f>16 q r8 q4-- r2 | R1 |  \break
    <f as bes>16 q r8 q4-- r2 | R1 <c es f>16 q r8 q4-- r2 | R1 |  \break
    <g' bes c>16 q r8 q4-- r2 | <g bes c>16 q r8 q4-- r2 | <c, es f>16 q r8 q4-- r2 |
    r2 \tuplet 3/2 { r8 c f } \tuplet 3/2 { a bes a } }
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup {\with-color #red \bold "D.S. al Coda"}
  \stopStaff s1 \bar "||" \startStaff
  \mark \markup { \with-color #red \musicglyph "scripts.varcoda" }
  f1 <c' es f>4-^ q2. \fermata \bar ".."
  \label #'theLastPage
}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  % \partial 8
  % \showStartRepeatBar \bar "[|:"


}

Basse = \relative c' {
  \clef "bass" \key f \major \time 4/4
  % \partial 8
  % \showStartRepeatBar \bar "[|:"

  \bar ".."
}

grille = \chordmode {
  \bar "[|:"
  f1:7 bes:7 f:7 c2:m7 f:7 \break
  \repeat percent 2 { bes1:7 }  f2:7 bes:7 es:7 d:7 \break
  g1:m7 c:7 f2:7 d:7 g:m7 c:7
  \bar ":|]" }



\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #1
    %print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmoniesTab }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotesTab
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #1
    %print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmoniesTab }
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotesTab
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #1
    %print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmoniesTab }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a \theNotesTab
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
      \layout { ragged-last = ##t }
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
    } %\form
    %}  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      \layout { ragged-last = ##t }
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    } %\form
    %}  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      \layout { ragged-last = ##t }
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a \theNotes
        >>
      >>
    } %\form
    %}  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }

