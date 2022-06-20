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
    }
  }
}

title = #"The Cat"
composer = #"Lalo Schifrin"
meter = #"(Med. Up Blues)"
kwtempo = #"Med. Up"
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
  asplayed = #"Jimmy Smith" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=PaKLB71QE4k"
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


\defineBarLine "|-|" #'("|" "|" "|")

harmonies = \chordmode {
  \set chordChanges = ##f
  s2. s1*4
  f1:7 bes:7 f:7 s bes:7 s f:7 s c:7 bes:7 f:7
}


theNotes =  \relative c' {
  \clef "treble" \key f \major \time 4/4
  \partial 2. \mark \markup \box Intro
  % \showStartRepeatBar \bar "[|:"
  <c g' bes c>4 -. _\markup "Brass section" <es as es'>8  <e a e'> r  <f c' f> ~ | % 2
  q4 r r2 | % 3
  R1*3 | \break
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup "Rhythm section cont. simile"
  \markup \box Head
  \repeat volta 2 {
    r4  f8  c  es  e4  f8 | % 7
    r8  as  bes  f  as  bes -. r4 | % 8
    r4 \times 2/3  { es32  e  f ~ } f8. ~  f4  es8  f | % 9
    es4  c8  es  b  bes16
    as16  f8  es | \break \bar "|-|"
    r4  bes'8  f  as  a4  bes8 | % 11
    r8  es  f  f,  es'
    f8 -. r4 | % 12
    r4 \times 2/3  { es32  e  f ~ } f8. ~  f4  es8  f | % 13
    es4  c8  es  b  bes16 as16  f8  es | \break \bar "|-|" % 14
    r4  es' -. r8  c r4 | % 15
    bes4 -. r8  as r  es  e  f | % 16
    r4 \times 2/3  { es'32  e  f ~ } f8. ~  f4  es8  f | % 17
    es4  c8  es  b  bes16 as16  f8  es | % 18
  }
  \label #'theLastPage
}

chordsRhythm = \relative c'' {
  \override Rest #'staff-position = #10
  \improvisationOn \override NoteHead.no-ledgers = ##t
  \partial 2.
  s2. \repeat unfold 2 { r4 g-. r8 8 r4 | 4-. r8 8 r4 4-. } }

grilleRhythm = {
  \improvisationOn
  \repeat unfold 6 { r4 c-. r8 8 r4 | 4-. r8 8 r4 4-. }
}

Basse = \relative c {
  \clef "bass" \key f \major \time 4/4
  \override Rest #'staff-position = #0
  \partial 2.\mark \markup \box Intro
  c4  es8  e4  f8 ~ | % 2
  f4 r8  c ~  c  es  e4 | % 3
  f4  c'8  c, ~  c  es e4 -. | % 4
  f4.  c8 ~  c  es  e4 | % 5
  f4  c'8  c, ~  c  es e4 -. | \break % 6
  \mark \markup \box Head
  \repeat volta 2 {
  f4 r8  c ~  c  es  e4 | % 7
  f4  c'8  c, ~  c  es e4 -. | % 8
  f4.  c8 ~  c  es  e4 | % 9
  f4  c'8  f, ~  f  f as8  a | \break \bar "|-|"
  bes4 r8  f ~  f  as a4 | % 11
  bes4  f8  f ~  f  es e4 -. | % 12
  f4.  c'8 ~  c  es, e4 | % 13
  f4  c'8  c, ~  c as'8  f  es | \break \bar "|-|" % 14
  c4  g'8  c, ~  c  c b4 | % 15
  bes4  f'8  bes ~  bes es,8  e4 -. | % 16
  f4  f8  c' ~  c r e,4 | % 17
  f8  f  c'4 r8  as  f es8 | % 18
  }
}

BasseIntro = \relative c {
  \clef "bass" \key f \major \time 4/4
  \override Rest #'staff-position = #0
  \partial 2.
  % \showStartRepeatBar \bar "[|:"
  c4  es8  e4  f8 ~ | % 2
  f4 r8  c ~  c  es  e4 | % 3
  f4  c'8  c, ~  c  es e4 -. | % 4
  f4.  c8 ~  c  es  e4 | % 5
  f4  c'8  c, ~  c  es e4 -. | % 6
}

grille = \chordmode {
  \bar "[|:" f1:7 bes:7 \repeat percent 2 { f:7 } \break
  \repeat unfold 2 { bes:7 } \repeat percent 2 { f:7 } \break
  c:7 bes:7 \repeat percent 2 { f:7 }
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
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } \theNotes
          \new Staff << \chordsRhythm \\ \BasseIntro >>
      >> >>
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
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb } \transpose c d \theNotes
          \new Staff << \chordsRhythm \\ \BasseIntro >>
      >> >>
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
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Eb } \transpose c a \theNotes
          \new Staff << \chordsRhythm \\ \BasseIntro >>
      >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    system-system-spacing = #'((basic-distance . 15)
                               (minimum-distance . 8)
                               (padding . 1))
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } \theNotes
          \new Staff << \chordsRhythm \\ \BasseIntro >>
      >> >>
    } %\form
    %}  \bookpart {
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
    system-system-spacing = #'((basic-distance . 15)
                               (minimum-distance . 8)
                               (padding . 1))
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb } \transpose c d \theNotes
          \new Staff << \chordsRhythm \\ \BasseIntro >>
      >> >>
    } %\form
    %}  \bookpart {
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
    system-system-spacing = #'((basic-distance . 15)
                               (minimum-distance . 8)
                               (padding . 1))
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Eb } \transpose c a \theNotes
          \new Staff << \chordsRhythm \\ \BasseIntro >>
      >> >>
    } %\form
    %}  \bookpart {
    \score {
      \gridLayout
      <<      \new RhythmicStaff
              \with { \override StaffSymbol.line-count = 0 \remove Time_signature_engraver \remove Bar_engraver
              }
              \grilleRhythm
              \new ChordGrid \transpose c a \grille
      >>} } }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
  }
  #(define output-suffix "BassTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
          \new Staff \with { instrumentName = \CleFa } \Basse
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    system-system-spacing = #'((basic-distance . 15)
                               (minimum-distance . 8)
                               (padding . 1))
  }
  #(define output-suffix "Bassa4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
          \new Staff \with { instrumentName = \CleFa } \Basse
      >>
    }
    \score {
      \gridLayout

      <<      \new RhythmicStaff
              \with { \override StaffSymbol.line-count = 0 \remove Time_signature_engraver \remove Bar_engraver
              }
              \grilleRhythm
              \new ChordGrid \grille
      >>
} } }