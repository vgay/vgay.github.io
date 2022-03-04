
\version "2.22.0"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Cécile Ma Fille"
composer = #"J. Datin and Claude Nougaro"
meter = #"(Med. Jazz Waltz)"
kwtempo = #"Medium"
kwstyle = #"Jazz Waltz"
kwfrench = #"Oui"

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
  s4 c:m c:m7+ c:m7 f2.:m g2:5+7 g4:7 c2.:m f:m7
  bes:7 es:7+ es:6 d2:m5-7 as4/c g2.:7/b c:m/bes f:7/a
  bes2:m9 es4:9 as2.:7+ d2:m11 g4:7 c2.:m6 c:m6
  f:m g:7 c:m s f:m/as bes:7 es:7+9 s
  f:m g:7 c4:m7 f:m/d es:7+ d2.:9 g:m d:7 f:m/g g2:5+7 g4:7
c:m c:m7+ c:m7 f2.:m g2:5+7 g4:7 c2.:m f:m7
  bes:7 es:7+ es:6 d2:m5-7 as4/c g2.:7/b c:m/bes f:7/a
  bes2:m9 es4:9 as2.:7+ d2:m11 g4:7 c2.:m6
}


theNotes =  \relative c' {
  \clef "treble" \key es \major \time 3/4
  \partial 4 c8 d
  \repeat volta 2 {
    \A es4 g es | f2 es8 d | g4 es d | c2 d8 es
    f4 g as | bes2 f4 | g2.~ | g2 f8 g |
    as4 d, es | f2 bes8 as | g4 c, d | es2 g4 |
    c2( bes4) | g2 f4 | g2( b,4) |
  }
  \alternative {
    { c4 r c8 d }
    { c2. }
  }
  \bar "||" \break
  \B d4 es f | d es f | es8 f g2~ | g2. |
  f4 g as | f g as | bes2.~ | bes2.  \break
  d,4 es f | d es f | es f g | c2. |
  d8 c bes4 bes | c8 bes a4 d, | g2.~ | g4 r c,8 d \bar "||" \break
  \A es4 g es | f2 es8 d | g4 es d | c2 d8 es
    f4 g as | bes2 f4 | g2.~ | g2 f8 g |
    as4 d, es | f2 bes8 as | g4 c, d | es2 g4 |
    c2 bes4 | g2 f4 | g2 b,4 | c2. | R
  \bar ".."
}



\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
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
    page-count = #1
  }
  #(define output-suffix "BbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
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
    page-count = #1
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
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
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
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
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a \theNotes
        >>
      >>
} } }

%{
convert-ly (GNU LilyPond) 2.22.1  convert-ly: Traitement de «  »...
Conversion en cours : 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}
