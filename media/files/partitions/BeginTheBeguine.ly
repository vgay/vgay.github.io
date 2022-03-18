
\version "2.22.1"
#(set-global-staff-size 17)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



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
  oddHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \null \null \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} }
  } }
  evenHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} \null \null }
    }
  }
}

title = #"Begin The Beguine"
composer = #"Cole Porter"
meter = #"(Biguine)"
kwtempo = #"Medium"
kwstyle = #"Beguine"

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
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
  c1 c:6 c:7+ c:6 c1*2 g:7
  g1:7 d1:m7 f:6 d:m7 g:7 d2:m7 g:7 c1*2
  c1 c:6 c:7+ c:6 c1*2 g:7
  g1:7 d1:m7 f:6 d:m7 g:7 d2:m7 g:7 c1*2
  c1:m f:9 bes1*2 bes1:m es:7 as:7+ as:6
  a:dim des:9- g as g f:m7 g1*2:7
  c1 c:6 c:7+ c:6 c1*2 g1:7 d2:m7 g:7
  f1*4:m6 g1 d2:m7 g:7 c1*2
  c1 c:6 c:7+ c:6 c c:6 g1*2:7
  f1 d:m7 e:m a:m7 d:m7 g:7 c:6 c
  c1 c:6 c:7+ c:6 c c2:6 g4:7 c g1*2:7
  f1 d:m7 e:m a:7 d1*2:7 f:m6
  g:7  c1*2:7+ d1*2:m7 s2 f:m6
  g1:7 c c:6 c:7+
}


theNotes =  \relative c' {
  \set Score.markFormatter = #format-mark-box-alphabet
  \clef "treble" \key c \major \time 4/4 \mark #1
  \times 2/3 { c4 d e } g2~ | g~ g8 e4 d8 | e1~ | e2~ e8 r c4 |
  \times 2/3 { c4 d e } a2~ | a4 g \times 2/3 { g f e } f2 d~ | d~ d4 r8 d | \break
  \times 2/3 { d4 e f } d'2~ | d4 c \times 2/3 { c b a } | c2 a~ | a2. d,4 |
  \times 2/3 { d4 e f } g2~ | \times 2/3 { g4 g g } f4. e8 | e1~ | e2 r4 c | \bar "||" \break \mark #2
  \times 2/3 { c4 d e } g2~ | g~ g8 e4 d8 | e1~ | e2~ e8 r c4 |
  \times 2/3 { c4 d e } b'2~ | b4 a   \times 2/3 { g f e }  | f2 d2~ | d2. r4   \break
  \times 2/3 { d4 e f } e'2~ | e2 \times 2/3 { d4 c b } | c2 a~ | a1
  \times 2/3 { d,4 e f } g2~ | g~ g8 f4 e8 | c1~ | c2~ c4 r8 c || \bar "||"  \break \mark #3
  \times 2/3 { c4 d es } g2~ | g4 g \times 2/3 { a g f } | bes2 f~ | f2. r8 f8 |
  \times 2/3 { bes,4 c des } f2~ | f \times 2/3 { g4 f es } | c'1~ | c2. c4 | \break
  c d es2 | \times 2/3 { es4 d c } es4. c8 | d2 b?~ | b4 c \times 2/3 { c4 bes as }
  b!2 g | as~ \times 2/3 { as4 es d } | g1 ~ | g2. r8 c, \bar "||"  \pageBreak \mark #4
  \times 2/3 { c4 d e } g2~ | g4 e \times 2/3 { e d c } | e1~ | e2~ e8 r c4
  \times 2/3 { c4 d e } \times 2/3 { g a g } | bes4. a8 \times 2/3 { g4 f e } | f2 d~ | d r4 d \break
  \times 2/3 { d e f } \times 2/3 { as c d } | \times 2/3 { e2 d4 } \times 2/3 { c4 bes as }
  c2( as~ | as) r4 d, | \times 2/3 { d e f } g2~ | g~ g8 f4 e8 | e1~ | e2 c'4 d \bar "||"  \break \mark #5
  \times 2/3 { e e e } e2~ | e~ e8 d4 c8 | e1~ | e2 c4 d |
  \times 2/3 { e e e } e4. e8 | e4. e8 d4. c8 | b2 g~ | g r4 a8 b | \break
  \times 2/3 { c4 c c } c4. c8 | \times 2/3 { c2 c4 } \times 2/3 { c b a } | g2 e~ | e2. r4 |
  \times 2/3 { d e f } g2~ | g~ g8 f4 e8 | g1~ | g2 c4 d \bar "||"  \break \mark #6
  \times 2/3 { e e e } \times 2/3 { e e e } | e2 e4. e8 | e1~ | e2. c8 d |
  \times 2/3 { e4 e e } e4. e8 | f4. e8 d4 c | b2 g~ | g2. a8 b |
  \times 2/3 { c4 c c } c c | d2 \times 2/3 { c4 b a } | g2 e~ | e2. e8 e |
  \times 2/3 { d4 e f } g2~ | g~ g4. g8 | \times 2/3 { d4 e f } g2~ | g1 |
  \times 2/3 { d4 e f } g2~ | g~ g8 f4 e8 | c1~ | c2. r4 \break  \bar "|."
  \doubleMark
  \markup {\with-color #red \bold "To Coda"}
  \markup { \with-color #red \musicglyph "scripts.varcoda" }

  \times 2/3 { d4 e f } g2~ | g1~ | g~ | g2~ g8 a4 c8 | c1~ | c~ | c~ | c2. r4
  \bar ".."     \label #'theLastPage
}

chordsRhythm = \relative c''' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key f \major \time 4/4
}




\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
    print-page-number = ##t
    print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
    print-page-number = ##t
    print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
    print-page-number = ##t
    print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a \theNotes
        >>
      >>
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
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
    }
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    }
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a \theNotes
        >>
      >>
    }
} }
