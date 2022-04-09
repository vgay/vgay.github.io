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
  ragged-bottom = ##t
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 15)
                             (padding . 2))
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

title = #"Tom Cat"
composer = #"Lee Morgan"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Swing"

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

swingMark = \markup  {
  \score {
    \new Staff \with {
      instrumentName = \markup \fontsize #2  Swing
      fontSize = #-1
      \override StaffSymbol.staff-space = #(magstep -3)
    }
    \relative c'' {
      a8[ 8]
      \once \override TextScript #'extra-offset = #'( -0.7 . -1.8 )
      s2^\markup " = " \tuplet 3/2 { 8 r8 8 } }
    \layout {
      line-width = #23
      indent = #1
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      \override Staff.StaffSymbol.line-count = #0
      \override Score.BarLine.break-visibility = ##(#f #f #f)
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  asplayed = #"Lee Morgan" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=5RofUC1BYu4"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  meter = \swingMark
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
  r4.
}



theNotes =  \relative c' {
  \clef "treble" \key bes \major \time 4/4
  \partial 4. f8 _\markup "Trumpett"  as-. bes
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup "1st and 2nd X : Bass with LH Piano and Drums, 3rd and 4th with horns"
  \repeat volta 2 {
    c-. c bes-. as bes-. bes a-. f | as4 bes8 as r f as bes |
    c c bes as bes bes \tuplet 3/2 { as f as } | r2 r8 f8 as-. bes | \break
    c-. c bes-. as bes-. bes as-. f | as4 bes8 as r f as bes |
    c c bes as bes bes \tuplet 3/2 { as f as } | r1 | \break
    bes4-. r des -. r | f \tuplet 3/2 { r8 es des } es des r4 |
    r4 des8 bes es des\tuplet 3/2 {  bes as bes } | r2 r8
    \startParenthesis \parenthesize f8 as \endParenthesis \parenthesize bes |
    \mark \markup 4x
  }
  \label #'theLastPage
}

theNotesII =  \relative c' {
  \clef "treble" \key bes \major \time 4/4
  \partial 4. d8 _\markup "Alto Sx" f-. g
  as-. as g-. f g-. g f-. d | f4 g8 f r d f g |
  as as g f g g \tuplet 3/2 { f d f } | r2 r8 des8 f-. g |
  as-. as g-. f g-. g f-. d | f4 g8 f r d f g |
  as as g f g g \tuplet 3/2 { f d f } | r1 |
  bes4-. r des -. r | f \tuplet 3/2 { r8 es des } es des r4 |
  r4 as8 f bes as \tuplet 3/2 {  f es f } | r2 r8
  \startParenthesis \parenthesize d8 f \endParenthesis \parenthesize g |
}

theNotesIII =  \relative c' {
  \key bes \major \time 4/4
  \partial 4. bes8 _\markup "Trombone" d-. es
  f-. f es-. d es-. es d-. bes | d4 es8 d r bes d es |
  f-. f es-. d es-. es \tuplet 3/2 { d bes d } | r2 r8 bes8 des-. es |
  f-. f es-. des es-. es des-. bes  | des4 es8 des r bes d f  |
  f-. f es-. d es-. es \tuplet 3/2 { d bes d } | r1 |
  bes4-. r des -. r | f \tuplet 3/2 { r8 es des } es des r4 |
  r4 as'8 f bes as \tuplet 3/2 {  f es f } | r2 r8
  \startParenthesis \parenthesize bes,8 d \endParenthesis \parenthesize es |
}

Basse = \relative c {
  \clef "bass" \key bes \major \time 4/4
  \partial 4. r4. _\markup "Bass"
  \repeat volta 2 {
    bes4 r d r | es8 des8~ 4 bes r | r4 \tuplet 3/2 { r8 bes as } bes4-. c8 bes~ | 2. r4 \break
    bes4 r d r | es8 des8~ 4 f4 r | r4 \tuplet 3/2 { r8 bes as } bes4-. c8 bes~ | 2. r4 \break
    r8 as g4-. r8 ges f4-. | es2-- des8 es-> r4 | r4 \tuplet 3/2 { r8 bes as } bes4-. c8 bes~ | 2. r4
  }
}

grille = \chordmode {
  \bar "[|:"
  bes1:9 es:9 \repeat percent 2 { bes:9 }\break
  \repeat percent 2 { es:9 }  \repeat percent 2 { bes:9 } \break  f:7 es:9 \repeat percent 2 { bes:9 }
  \bar ":|]" }



\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #2
    print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } \theNotes
          \new Staff \theNotesII
          \new Staff { \clef "bass" \theNotesIII }
          \new Staff \Basse
      >> >>
    }    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #2
    print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb } \transpose c d \theNotes
          \new Staff \transpose c d \theNotesII
          \new Staff \transpose c d \theNotesIII
      >> >>
    }
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #2
    print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Eb } \transpose c a \theNotes
          \new Staff \transpose c a \theNotesII
          \new Staff \transpose c a \theNotesIII
       >> >>
    }
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
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
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } \theNotes
          \new Staff \theNotesII
          \new Staff { \clef "bass" \theNotesIII }
          \new Staff \Basse
      >> >>
    }    \score {
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
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb } \transpose c d \theNotes
          \new Staff \transpose c d \theNotesII
          \new Staff \transpose c d \theNotesIII
      >> >>
    }
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
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Eb } \transpose c a \theNotes
          \new Staff \transpose c a \theNotesII
          \new Staff \transpose c a \theNotesIII
       >> >>
    }
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }

% \book {
%   \paper {
%     #(set-paper-size "tablette")
%     %page-count = #1
%   }
%   #(define output-suffix "BassTab")
%   %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
%   \bookpart {
%     \score {
%       <<
%         \new ChordNames { \harmonies }
%         \new Staff \with { instrumentName = \CleFa } <<
%           %\new Voice \with { \consists "Pitch_squash_engraver" }
%           \Basse
%         >>
%       >>
%     } %\form
% } }
%
% \book {
%   \paper {
%     #(set-paper-size "a4")
%     %page-count = #1
%   }
%   #(define output-suffix "Bassa4")
%   \bookpart {
%     \score {
%       <<
%         \new ChordNames { \harmonies }
%         \new Staff \with { instrumentName = \CleFa }
%         <<
%           %\new Voice \with { \consists "Pitch_squash_engraver" }
%           \Basse
%         >>
%       >>
%     } %\form
%     %}  \bookpart {
%     \score {
%       \layout {
%         indent = 0
%         \context {
%           \Score
%           \override SpacingSpanner.strict-note-spacing = ##t
%           proportionalNotationDuration = #(ly:make-moment 1/16)
%         }
%         \context {
%           \ChordGrid
%           \override BarLine.bar-extent = #'(-5 . 5)
%           \consists "Bar_engraver"
%           \override StaffSymbol.line-positions = #'( -10 10 )
%           \consists "Percent_repeat_engraver"
%         }
%       }
%       \new ChordGrid \\grille
% } } }

% \book {
%   %\paper { %page-count = #1
%	#(set-paper-size "a4")}
%   \header {meter = \markup \pad-around #1 \circle \bold \fontsize #-3 \concat {" " \musicglyph #"clefs.G" " "} }
%   \bookpart {
%     #(define output-suffix "RSa4")
%     \score {
%       <<
%         \new ChordNames {
%           \set chordChanges = ##f
%           \Accords
%         }
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Piano"
%           \new Voice = "Mel" { \chordsRhythm }
%         >>
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Basse"
%           \new Voice = "Mel" { \clef "bass_8" \Basse }
%           \new Voice = "Ctrl" { \ossature }
%         >>
%       >>
%
%     } %\form
%     %}  \bookpart {
%     \score {
%       \layout {
%         indent = 0
%         \context {
%           \Score
%           \override SpacingSpanner.strict-note-spacing = ##t
%           proportionalNotationDuration = #(ly:make-moment 1/16)
%         }
%         \context {
%           \ChordGrid
%           \override BarLine.bar-extent = #'(-5 . 5)
%           \consists "Bar_engraver"
%           \override StaffSymbol.line-positions = #'( -10 10 )
%           \consists "Percent_repeat_engraver"
%         }
%       }
%       \new ChordGrid \transpose c a \grille
% } } }

% \book {
%   %\paper { %page-count = #2
%	#(set-paper-size "tablette")}
%   \header {meter = \markup \pad-around #1 \circle \bold \fontsize #-3 \concat {" " \musicglyph #"clefs.G" " "} }
%   \bookpart {
%     #(define output-suffix "RSTab")
%     \score {
%       <<
%         \new ChordNames {
%           \set chordChanges = ##f
%           \Accords
%         }
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Piano"
%           \new Voice = "Mel" { \chordsRhythm }
%         >>
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Basse"
%           \new Voice = "Mel" { \clef "bass_8" \Basse }
%           \new Voice = "Ctrl" { \ossature }
%         >>
%       >>
%
% } } }