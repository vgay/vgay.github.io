
\version "2.19.80"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "chord-grid-JAS.ly"


\paper {
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  system-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 10)
                             (padding . 0))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 8)
                            (padding . 3))
}

title = #"Footprints"
composer = #"Wayne Shorter"
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
  tagline = ##f
}

\layout {
  \context {
    \Score
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
}


\layout {
  \context {
    \Score
    extraNatural = ##f
    \omit BarNumber
    skipBars = ##t
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  c1.:m11 s s s f:m11 s c:m11 s
  fis2.:m5-7 f:11+13 e:8 a:8 c1.:m11
}


theNotes =  \relative c'' {
  \clef "treble" \key bes \major \time 6/4
  \showStartRepeatBar \bar "[|:"
  bes4-- 4-- 4--  8 c ~ 4. a8
  \times 3/5 { bes4 a g f d ~ } 2 c4-.
  \repeat unfold 2 { r2 r8 d ~ 2 c4-. } \break
  bes'4-- 4-- 4--  8 c ~ 4. d8
  \times 3/5 { es4 d c bes g ~ } 2 f4-.
  \times 3/5 { bes4 a g f d } ~  2 c4-.
  r2 r8 d ~ 2 c4-. \break
  b'4 4 4 8 d ~ 4. g,8  %\cadenzaOff \bar "|"
  bes2 ~ \times 2/3 { 8 a as } g2 ~ 16 c g ges
  f1. ~ 1. \break
  \bar ":|]"
}

theNotesII =  \relative c'' {
  \clef "treble" \key bes \major \time 6/4
  f4-- 4-- 4--  8 g ~ 4. e8
  \times 3/5 { f4 e d c a ~ } 2 g4-.
  \repeat unfold 2 { r2 r8 a  ~ 2 g4-. } \break
  f'4-- 4-- 4--  8 g ~ 4. as8
  \times 3/5 { bes4 as g f d ~ } 2 c4-.
  \times 3/5 { f4 e d c a ~ } 2 g4-.
  r2 r8 a  ~ 2 g4-. \break
  fis'4 4 4 f8 a ~ 4. d,8
  f2 ~ \times 2/3 { 8 e es } d2 ~ 16 g d des
  c1. ~ 1. \break
  \bar ":|]"
}



Basse = \relative c' {
  \clef "bass" \key bes \major \time 6/4
  \showStartRepeatBar \bar "[|:"
  \repeat unfold 4 { c,4 g' c es2 ~ es8 g, }
  \repeat unfold 2 { c,4 f bes es2 ~ es8 a, }
  \repeat unfold 2 { c,4 g' c es2 ~ es8 g, }
  fis2. f | e a, | \repeat unfold 2 { c4 g' c es2 ~ es8 g, }
}


grille = \chordmode {
  \bar "[|:"
  \repeat percent 4 c1:m11 \break
  \repeat percent 2 f:m11 \repeat percent 2 c:m11 \break
  fis2:m5-7 f:11+13 e2:8 a2:8 \repeat percent 2 c1:m11
  \bar ":|]" }

marques = \relative c' {
  s1
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } <<
            \theNotes \\ \transpose c c, \theNotesII
          >>
          \new ChordNames {
            \set chordChanges = ##t
            \harmonies
          }
          \new Staff  <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }
            \Basse
      >> >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \transpose c d \harmonies
        }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb } \transpose c d \theNotes
          \new Staff \with { instrumentName = \markup \center-column { "sounds 1" "octave lower" } } \transpose c d \theNotesII
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \transpose c a \harmonies
        }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Eb } \transpose c a \theNotes
          \new Staff \transpose c a, \theNotesII
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } \theNotes
          \new Staff \with { instrumentName = \markup \center-column { "sounds 1" "octave lower" } } \theNotesII
          \new Staff  <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }
            \Basse
      >> >> >>
    } % }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \transpose c d \harmonies
        }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb } \transpose c d \theNotes
          \new Staff \with { instrumentName = \markup \center-column { "sounds 1" "octave lower" } } \transpose c d \theNotesII
      >> >>
    } % }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \transpose c a \harmonies
        }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Eb } \transpose c a \theNotes
          \new Staff \transpose c a, \theNotesII
      >> >>
    } % }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }