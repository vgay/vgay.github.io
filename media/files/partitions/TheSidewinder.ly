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

title = #"Sidewinder"
composer = #"Lee Morgan"
meter = #"(Med. Latin)"
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
  url = #"https://www.youtube.com/watch?v=qJi03NqXfk8"
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
  s8 s2 \repeat unfold 8 { s4 d4.:7 es8:7 s4 }
  \repeat unfold 4 { s4 g4.:7 as8:7 s4 }
  \repeat unfold 3 { s4 d4.:7 es8:7 s4 } s4 g4.:m5-7 c8:9- s4
  \repeat unfold 4 { s4 f4.:m7 bes8:7 s4 }
  \repeat unfold 2 { s4 d4.:7 es8:7 s4 } es4:7 r2. s1
}


theNotes =  \relative c' {
  \clef "treble" \key es \major \time 4/4
  \partial 8*5
  \partial 8*5 r8 r2
  \repeat volta 2 {
    r4 c' -^  r8 des -> r4 | % 3
    r4 c -^ r8 des -> r4 | % 4
    r8 c des4 es f | % 5
    c8 des c bes
    bes4 r | \break
    r4 c -^ r8 des -> r4 | % 7
    r4 c -^ r8 des -> r4 | % 8
    r8 c des4 es f | % 9
    fis8 g es des -> r
    a4. | \break \bar "||"
    as4 -. f' -^ r8 fis -> r4 | % 11
    r4 f -^ r8 fis -> r4 | % 12
    r8 f fis as bes
    as8 fis f | % 13
    as8 es f fis
    fis8 bes, as bes | \break % 14
    es,4 c' -^ r8 des -> r4 | % 15
    r4 c -^ r8 des -> r4 | % 16
    r8 bes ( c des es
    f4. ) | % 17
    r8 g, ( as a bes
    c4. ) | \break % 18
    r4 f, -^ r8 g -> r4 | % 19
    r4 f -^ r8 g -> r4 |
    r8 f g4 as a | % 21
    a8 bes as e r e
    bes8 e |\break  % 22
    es4 c' -^ r8 des -> r4 | % 23
    r4 c -^ r8 des -> r4 | % 24
    \override TextSpanner.bound-details.left.text = "Break and pickup fill"
    es4 -. r8 \startTextSpan bes16 des es8 -.
    es8 -. es16 bes des8 | % 25
    \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
    \mark \markup \with-color #red fine
    es4-^ r8 des des bes
    as8 bes \stopTextSpan }

  \label #'theLastPage
}

theNotesII =  \relative c' {
  \clef "treble" \key es \major \time 4/4
  \partial 8*5
  \partial 8*5 r8 r2
  \repeat volta 2 {
    r4 fis -^  r8 g -> r4 | % 3
    r4 fis -^ r8 g -> r4 | % 4
    r8 c des4 es f | % 5
    c8 des c bes
    bes4 r | % 6
    r4 fis -^ r8 g -> r4 | % 7
    r4 fis -^ r8 g -> r4 | % 8
    r8 c des4 es f | % 9
    fis8 g es des -> r
    a4. |
    as4 -. b -^ r8 c -> r4 | % 11
    r4 b -^ r8 c -> r4 | % 12
    r8 f, fis as bes as
    fis8 f | % 13
    as8 es f fis fis
    bes8 as bes | % 14
    es,4 fis -^ r8 g -> r4 | % 15
    r4 fis -^ r8 g -> r4 | % 16
    r8 bes ( c des es
    f4. ) | % 17
    r8 g, ( as a bes
    c4. ) \bar "||"  | % 18
    r4 as -^ r8 bes -> r4 | % 19
    r4 as -^ r8 bes -> r4 |
    r8 f g4 as a | % 21
    a8 bes as e r e
    bes8 e | % 22
    es4 fis -^ r8 g -> r4 | % 23
    r4 fis -^ r8 g -> r4 | % 24
    es'4 -. r8 bes16 des es8 -.
    es8 -. es16 bes des8 | % 25
    es4-^ r8 des des bes
    as8 bes }
}

chordsRhythm = \relative c'' {
  \override Rest #'staff-position = #10
  \improvisationOn \override NoteHead.no-ledgers = ##t
  \partial 8*5
  s8 s2 \repeat unfold 2 { r4 g-^ r8 8 r4 |  r4 g-^ r8 8 r4 } }

Basse = \relative c' {
  \clef "bass" \key es \major \time 4/4
  \partial 8*5
  bes8 -- -\f r as ( e4 ) ->
  \repeat volta 2 {
    es4 r8 es bes4 d | % 3
    es4 r8 es bes4 d | % 4
    es4 r8 es bes4 d | % 5
    es4 r8 es bes4 d | \break % 6
    es4 r8 es bes4 d | % 7
    es4 r8 es bes4 d | % 8
    es4 r8 es bes4 d | % 9
    es4 r8 es bes4 d | \break \bar "||"
    as'4 r8 as es4 g | % 11
    as4 r8 as es4 g | % 12
    as4 r8 as es4 g | % 13
    as4 r8 as es4 g | \break% 14
    es4 r8 es bes4 d | % 15
    es4 r8 es bes4 d | % 16
    es4 r8 es bes4 d | % 17
    g4 r8 g c,4 e |\break  \bar "||" % 18
    f4 r8 f e4 e | % 19
    f4 r8 f e4 e |
    f4 r8 f e4 e | % 21
    f4 r8 f e4 e |\break % 22
    es4 r8 es bes4 d | % 23
    es4 r8 es bes4 d | % 24
    es4 r r2 | % 25
    r4 r8 bes' -- r as ( e4 ) -> }
  \bar ".."
}

BasseIntro = \relative c' {
  \clef "bass" \key f \major \time 4/4
  \override Rest #'staff-position = #0
  \partial 8*5
  bes8 -- -\f r as ( e4 ) ->
  \repeat volta 2 {
    es4 r8 es bes4 d | % 3
    es4 r8 es bes4 d | % 4
    es4 r8 es bes4 d | % 5
    es4 r8 es bes4 d | % 6
    \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
    \once \override Score.RehearsalMark #'direction = #DOWN
    \mark \markup "Rhythm section cont. simile"
} }

grille = \chordmode {
  \bar "[|:"
  \repeat unfold 2 { \repeat percent 4 { d2:7 es:7  } \break }
  \repeat percent 4 { g2:7 as:7  } \break
  \repeat percent 3 { d2:7 es:7  } g:m5-7 c:9- \break
  \repeat percent 4 { f2:m7 bes:7  } \break
  \repeat percent 2 { d2:7 es:7  } es4:7 r2. r1
  \bar ":|]" }

grilleRhythm = {
  \improvisationOn
  \repeat unfold 2 { r4 c-^ r8 8 r4 | r4 c-^ r8 8 r4 }
  \repeat unfold 20 { \hideNotes c4 s2. }
}

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } \theNotes
          \new Staff \theNotesII
          \new Staff << \chordsRhythm \\  \BasseIntro  >>
      >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb } \transpose c d \theNotes
          \new Staff \transpose c d \theNotesII
          \new Staff << \chordsRhythm \\  \BasseIntro  >>
      >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Eb } \transpose c a, \theNotes
          \new Staff \transpose c a, \theNotesII
          \new Staff << \chordsRhythm \\  \BasseIntro  >>
      >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } \theNotes
          \new Staff \theNotesII
          \new Staff << \chordsRhythm \\  \BasseIntro  >>
      >> >>
    } %\form
  }  \bookpart {
    \paper { ragged-last = ##f }
    \score {
      \gridLayout
      <<      \new RhythmicStaff
              \with { \override StaffSymbol.line-count = 0 \remove Time_signature_engraver \remove Bar_engraver
              }
              \grilleRhythm
              \new ChordGrid \grille
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
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb } \transpose c d \theNotes
          \new Staff \transpose c d \theNotesII
          \new Staff << \chordsRhythm \\  \BasseIntro  >>
      >> >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      <<      \new RhythmicStaff
              \with { \override StaffSymbol.line-count = 0 \remove Time_signature_engraver \remove Bar_engraver
              }
              \grilleRhythm
              \new ChordGrid \transpose c d \grille
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
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Eb } \transpose c a, \theNotes
          \new Staff \transpose c a, \theNotesII
          \new Staff << \chordsRhythm \\  \BasseIntro  >>
      >> >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      <<      \new RhythmicStaff
              \with { \override StaffSymbol.line-count = 0 \remove Time_signature_engraver \remove Bar_engraver
              }
              \grilleRhythm
              \new ChordGrid \transpose c a \grille
      >>
} } }

