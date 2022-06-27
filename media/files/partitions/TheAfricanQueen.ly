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

title = #"The African Queen"
composer = #"Horace Silver"
meter = #"(Med. Latin Swing)"
kwtempo = #"Medium"
kwstyle = #"Latin / Swing"

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
  asplayed = #"Horace Silver" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=m4Z9NxK94H4"
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
    \override MultiMeasureRest #'expand-limit = #1
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
  \column { \line { \fontsize #2 \concat { "On " \box A " horns play binary 8th while Rhythm Section swings" } } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
s8 \repeat unfold 3 { c1*4:m } c1:m bes2:7.11+ a:8 as2:7.11+ g:8  c:m
}


theNotes =  \relative c'' {
  \clef "treble" \time 4/4 \key es \major
  \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup \box Intro
  \partial 8 r8 | \inlineMMRN R1*3 | r2.  c8  d \break  \mark \markup { \box A "(Latin)" }
  \repeat volta 2 {
    c8 c  bes  c bes8  bes  g  bes |  g8  g  f  g  f4 es8  f | % 7
    es8  es  c  es  c c  bes4 -. | c8 \<  es4  f8 ~   f2 ~ | \break
    \override TextSpanner.bound-details.left.text = "Drums Fill"
    \override TextSpanner.after-line-breaking = #ly:spanner::kill-zero-spanned-time
    f1 \startTextSpan ~ | 1 | R1 \! |
  }
  \alternative { { r2. c'8 d } { R1 } } \bar "||" \break
  \mark \markup \column { \pad-around #2 " " \concat { \box B " (Swing)" } }
  r8 \stopTextSpan
  <<
    {  \override TextSpanner.bound-details.left.text = "Drums Fill"
       \override TextSpanner #'extra-offset = #'( 0 . 0.5 )
      d \times 2/3  { f8  a  c } g8  f  es  c | % 15
      \times 2/3  { f16  ges  f } es8  f  c  es4  c8 d8 ~ \break
        \mark \markup \column { \pad-around #2 " " \concat { \box A " (Latin)" } }
      d1 \startTextSpan ~ | d1 |  s1.. s8  \stopTextSpan}
    \\
    { g,8 \times 2/3  { bes8  d  f } es8  des  a  e | % 15
      \times 2/3  { f16  ges  f } es8  f  c  es4  a8 bes8 ~
      bes1 ~ | 1 \inlineMMRN R1*2 }
  >>

  \bar ".."
   \label #'theLastPage
}

chordsRhythm = \relative c' {
    \clef "treble" \time 4/4 \key es \major
    \partial 8 r8 | % 1
    \repeat unfold 4 { r4  <es bes' d>8  <f g b> ~ <f g b>2 } | % 2
    \repeat volta 2 {
      \repeat unfold 7 { s1 }    }
    \alternative { { s1 } { s1 } }
    <f d' as'>4 <f d' as'>  <es
    cis' g'>4  <es cis' g'> | % 15
    <es c' ges'>4  <es c' ges'>  <des b'
    f'>2 | % 16
    \repeat unfold 4 { r4  <es bes' d>8  <f g b> ~ <f g b>2 } | % 2
}


Basse = \relative c' {
    \clef "bass" \time 4/4 \key es \major
    \partial 8  g8 | % 1
    \repeat unfold 4 { c,8  g'  es'  f ~ f4 r8  g, } | % 2
    \repeat volta 2 {
      \repeat unfold 7 { s1 }
  }
  \alternative { { s1 } { s1 } }
  bes,4 bes  a  a | % 15
  as4  as8  g ~  g4.
  g8 | % 16
  \repeat unfold 4 { c,8  g'  es'  f ~ f4 r8  g, } | % 2
}

grille = \chordmode {
  \bar "[|:" \mark \markup \column { \pad-around #3 " " \box A }
  \repeat volta 2 { \repeat percent 4 { c1:m } } \break
  \mark #2 bes2:7.11+ a:8 as:7.11+ g:8 \bar "||" \stopStaff s1 \bar "" s \bar "" \startStaff
  \mark #1 \repeat percent 4 { c1:m }
  \bar ".." }



\book {
  \paper {
    #(set-paper-size "a5landscape")
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
        \new Staff \with { \RemoveEmptyStaves instrumentName = Piano } \chordsRhythm
        \new Staff \with { \RemoveEmptyStaves instrumentName = Bass } \Basse
      >> >>
    } \form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
        \new Staff \with { instrumentName = \Bb } \transpose c d \theNotes
        \new Staff \with { \RemoveEmptyStaves instrumentName = Piano } \chordsRhythm
        \new Staff \with { \RemoveEmptyStaves instrumentName = Bass } \Basse
      >> >>    } \form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
   \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
        \new Staff \with { instrumentName = \Eb } \transpose c a \theNotes
        \new Staff \with { \RemoveEmptyStaves instrumentName = Piano } \chordsRhythm
        \new Staff \with { \RemoveEmptyStaves instrumentName = Bass } \Basse
      >> >>    } \form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    print-page-number = ##f
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
        \new Staff \with { instrumentName = \CleSol } \theNotes
        \new Staff \with { \RemoveEmptyStaves instrumentName = Piano } \chordsRhythm
        \new Staff \with { \RemoveEmptyStaves instrumentName = Bass } \Basse
      >> >>
    } \form
    }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    print-page-number = ##f
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
        \new Staff \with { instrumentName = \Bb } \transpose c d \theNotes
        \new Staff \with { \RemoveEmptyStaves instrumentName = Piano } \chordsRhythm
        \new Staff \with { \RemoveEmptyStaves instrumentName = Bass } \Basse
      >> >>    } \form
    }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    print-page-number = ##f
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
        \new Staff \with { instrumentName = \Eb } \transpose c a\theNotes
        \new Staff \with { \RemoveEmptyStaves instrumentName = Piano } \chordsRhythm
        \new Staff \with { \RemoveEmptyStaves instrumentName = Bass } \Basse
      >> >>
    } \form
    }  \bookpart {
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
%     } \form
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
%     } \form
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
%     } \form
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