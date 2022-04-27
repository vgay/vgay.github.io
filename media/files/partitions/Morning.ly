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
  system-system-spacing = #'((basic-distance . 20)
                             (minimum-distance . 15)
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

title = #"Morning"
composer = #"Clare Fisher"
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
  %asplayed = #"" % doit être commentée si vide
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
  a4.:m5-7 d2:9- g:m7 c8:9 s2 a4.:m5-7 d2:9- g8:m7  s4. c8:9 s2
  a4.:m5-7 d2:9- g:m7 c8:9 s2  a4.:m5-7 d2:9- g:m7 c8:9 s2  a4.:m5-7 d2:9- g8:m7 s1
  a4.:m5-7 d2:9- g:m7 c8:9 s2  a4.:m5-7 d2:9- g:m7 c8:9 s2  c4.:m7 f4:7 bes2.:7+ es8:7+ s2
  c4.:m7 f2:7 g8:m7 s1 c4.:m7 f2:7 g8:m7 s1
  c1*2:m7 bes2:7+ es4.:7+ d8:m7 s2 g2:7 c1*2:m7 g:7
  a4.:m5-7 d2:9- g:m7 c8:9 s2  a4.:m5-7 d2:9- g:m7 c8:9 s2  c4.:m7 f2:7 bes:7+ es8:7+ s2
  c4.:m7 f2:7 g8:m7
}


theNotes =  \relative c'' {
  \clef "treble" \key es \major \time 4/4
  % \partial 8
  \mark \markup \box Intro \oneVoice
  \repeat unfold 4 { R1 } \break
  \repeat volta 2 { R1 R } \alternative { { R R } { R1 | r2 r8  d  a  bes } } \break \mark #1 \bar "||-[|:"
  \repeat volta 2 {
    c8  d4. ~  d2 | % 16
    r2 r8  d  a  bes | % 17
    c8  d4  f8 ~  f es4  d8 ~ | % 18
    d2 r8  g,  bes  d |
    c4 r8  d r4  a16  g a8 ~ |
    a8  as4  g8 ~  g g8  a  bes
  }
  \alternative {
    {
      c4 -. r8  bes ~  bes r4 g8 ~ | % 22
      g2 r8  d'  a  bes
    }
    {
      c4 -. r8  bes'~ bes r4  g8 ~ | g8  g,  a  bes  c d8  es  f
    }
  }
  \bar "||" \break \mark #2
  g4 -.  g -. r8  g r  g ~ | % 26
  g4.  a8  d  c  bes a8 | % 27
  g4 -.  g -. r8  g r  g ~ | % 28
  g4.  a8  d  c  bes a8 | \break % 29
  g4 -.  g -. r8  g r  g ~ |
  g4 r8  g,  a  bes  c d16  es | % 31
  f2 ~  f8 r  es r | % 32
  d2 r8  d  a  bes \bar "||" \break \mark #1
  c8  d4. ~  d2 | % 16
  r2 r8  d  a  bes | % 17
  c8  d4  f8 ~  f es4  d8 ~ | % 18
  d2 r8  g,  bes  d | \break
  c4 r8  d r4  a16  g a8 ~ |
  a8  as4  g8 ~  g g8  a  bes
  c4 r8  bes' r4.  g8 ~ |
  g2 r \bar ".."
  \label #'theLastPage
}

chordsRhythm = \relative c' {
  \clef "treble_8" \key f \major \time 4/4
  % \partial 8
  \mark \markup \box Intro
  g8_\markup "Guitar only"  c  es  fis, ~ fis8  es'  c  f, ~ |
  f8  d'  bes  d,  e  bes'8  d  c |
  g8  c  es  fis, ~  fis8  es'  c  f, ~ |
  f8  d'  bes  d,  e  bes'8  d  c | \break
  \repeat volta 2 {

    g8  c  es  fis, ~ fis8  es'  c  f, ~ |
    f8  d'  bes  d,  e  bes'8  d  c |
  }
  \alternative {
    { g8  c  es  fis, ~  fis8  es'  c  f, ~ |  f8 \repeatTie <bes d> r  e,  <bes' d>4 <bes d>4 }
    { g8  c  es  fis, ~ fis8  es' r  <f, bes d> ~ | <f bes d>1 }
  }
  \bar "||-[|:" \break \mark #1
  \repeat volta 2 {
    g8  c  es  fis, ~ fis8  es'  c  f, ~ | % 16
    f8  d'  bes  d,  e bes'8  d  c | % 17
    g8  c  es  fis, ~ fis8  f' r  <f, bes d> ~ | % 18
    <f bes d>8 r  e  <bes' d> ~ <bes d>2 | % 19
    <c, g' bes es>4 -. r8  <c es a c f> r  a'8  f  <bes, f' a d> ~ |
    <bes f' a d>8  as' r  <bes, es g bes d> ~ <bes es g bes d>8 r r4
  }
  \alternative {
    {
      <c g' c es g>4 -. r8  <c es a c f> ~ q r4  <d f bes d g>8 ~| % 22
      <d f bes d g>2 r
    }
    {
      <c g' c es g>4 -. r8  <c es a c f> ~ q r4  <f bes d g>8 ~
      <f bes d g>2 r  \bar "||" \break \mark #2
    }
  }
  <c g' bes es>4 -.  q -. r8  q8 r  q ~ | % 26
  q2  a'8  d  a4 -. | % 27
  <bes, f' a d>4 -.  q -. r8  <es bes' des g>8 r  <d a' c f> ~ | % 28
  q2  b'8  f' r4 | \break
  <c, g' bes es>4 -.  q -. r8 q8 r  q ~ |
  q2  g'8  c  es d8 | % 31
  \repeat unfold 8 { <g, b f' g>8 }  |
  <d f b d>8 -.  q r4  q4 r
  \break \bar "||" \mark #1
  g8  c  es  fis, ~ fis8  es'  c  f, ~ | % 16
  f8  d'  bes  d,  e bes'8  d  c | % 17
  g8  c  es  fis, ~ fis8  f' r  <f, bes d> ~ | % 18
  <f bes d>8 r  e  <bes' d> ~ <bes d>2 | \break
  <c, g' bes es g>4 r8  <c es a c f> ~ q r4 <bes f' a d a'>8 ~ | % 38
  q8 r4  <es g bes d g>8 ~ q r r4 | % 39
  <g c es g>4 -. r8  <es a c f> r4.  <f bes d g>8 ~ |
  <f bes d g>2 r \bar ".."
  \label #'theLastPage
}

Basse = \relative c {
  \clef "bass" \key f \major \time 4/4
  % \partial 8
  \mark \markup \box Intro \oneVoice
  \repeat unfold 4 { R1 } \break
  \repeat volta 2 {
    a4 r8  d ~  d r  g,  g ~ |
    g4 r8  c r  d  g,  gis |

  }
  \alternative {
    {  a4 r8  d ~  d r  g,  g ~ | g4 r8  c r  d  g,  gis  }
    {  a4 r8  d ~  d r  g,  g ~ | g1 }
  }
  \break \bar "||-[|:" \mark #1
  \repeat volta 2 {
    a4 r8  d ~  d r  g, g8 ~ | % 16
    g4 r8  c r  d  g,  gis  | % 17
    a4 r8  d ~  d r  g, g8 ~ | % 18
    g4 r8  c r  bes  d  cis | % 19
    c4 r8  f ~  f r  bes, bes8 ~ |
    bes4 r8  es ~  es  bes es8  bes
  }
  \alternative {
    {
      c4 r8  f, ~  f r4 g8 ~ | % 22
      g2 r
    }
    {
      c4 r8  f ~  f r4 g8~
      g2 r |
    }
  }
  \bar "||" \break \mark #2
  c,4 -.  c r8  c r  c ~ | % 26
  c4 r8  f, r  f  f'  c | % 27
  bes4 -.  bes r8  c r  d ~ | % 28
  d4 r8  g, r  g  g'  d | \break
  c4 -.  c r8  c r  c ~ |
  c4 r8  f, r  f  c'  d | % 31
  \repeat unfold 8 { es8 }  | % 32
  d8  d r4  f8  d r
  bes8 \bar "||" \break \mark #1
  a4 r8  d ~  d r  g,  g ~ | % 34
  g4 r8  c r  d  g,  gis | % 35
  a4 r8  d ~  d r  g,  g ~ | % 36
  g4 r8  c r  bes  d  cis |\break
  c4 r8  f ~  f r r  bes, ~ | % 38
  bes4 r8  es ~  es  g gis8  a | % 39
  c4 -. r8  f, r4.  g,8 ~ |
  g2 r
  \bar ".."
  \label #'theLastPage
}

grille = \chordmode {
  \bar "[|:" \mark #1 \repeat unfold 2 { a2:m5-7 d:9- g:m7 c:9 } \break
  c2:m7 f4:7 bes:7+ q2 es:7+ c:m7 f:7 g1:m7 \break \bar ":|]" \mark #2
  \repeat percent 2 { c:m7 } bes2:7+ es:7+ d:m7 g:7 \break
  \repeat percent 2 { c1:m7 } \repeat percent 2 { g:7 } \break \bar ":|]" \mark #1
  \mark #1 \repeat unfold 2 { a2:m5-7 d:9- g:m7 c:9 } \break
  c2:m7 f:7 bes:7+ es:7+ c:m7 f:7 g1:7
  \bar ".." }



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
          \new Staff \with { instrumentName = \CleSol }
          << { \theNotes }  \\ { s1*14 \break } >>
      >>
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
        \new ChordNames { \harmonies }
          \new Staff \with { instrumentName = \CleSol }
          << { \transpose c d \theNotes }  \\ { s1*14 \break } >>
      >>
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
        \new ChordNames { \harmonies }
          \new Staff \with { instrumentName = \CleSol }
          << { \transpose c a, \theNotes }  \\ { s1*14 \break } >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    print-page-number = ##f
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
          \new Staff \with { instrumentName = \CleSol }
          << { \theNotes }  \\ { s1*14 \break } >>
      >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    print-page-number = ##f
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb  }
        << { \transpose c d \theNotes }  \\ { s1*14 \break } >>
      >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    print-page-number = ##f
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb }
        %\new Voice
        << { \transpose c a, \theNotes }  \\ { s1*14 \break } >>
      >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "Da4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } \theNotes
          \new Staff \chordsRhythm
          \new Staff \Basse
      >> >>
} } }


\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    print-page-number = ##f
  }
  #(define output-suffix "Guitara4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = Guitar } \chordsRhythm
      >> >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "GuitarTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = Guitar } \chordsRhythm
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    print-page-number = ##f
  }
  #(define output-suffix "Bassa4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = Bass }
          << { \Basse  } \\ { s1*14 \break } >>
      >> >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "BassTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = Bass }
          << { \Basse  } \\ { s1*14 \break } >>
      >> >>
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